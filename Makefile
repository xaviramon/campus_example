ACTUAL_BRANCH := $(shell git rev-parse --abbrev-ref HEAD)


.PHONY: help
help: ## Display help message
	@grep -E '^[0-9a-zA-Z_-]+\.*[0-9a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: push
push: ## Push to remote repositories
	git push

.PHONY: clean
clean: ## Remove generated files
	rm -rf ./intended/* && \
	rm -rf ./documentation/*

.PHONY: build
build: ## Generate files
	ansible-playbook ./playbooks/generate_config.yml -i inventory.yml --skip-tags validate -f 32 --vault-password-file ./vault-password.txt

.PHONY: build-apac
build-apac: ## Generate files
	ansible-playbook ./playbooks/generate_config.yml -i inventory.yml --limit APAC --skip-tags validate -f 32 --vault-password-file ./vault-password.txt

.PHONY: build-emea
build-emea: ## Generate files
	ansible-playbook ./playbooks/generate_config.yml -i inventory.yml --limit EMEA --skip-tags validate -f 32 --vault-password-file ./vault-password.txt

.PHONY: build-amer
build-amer: ## Generate files
	ansible-playbook ./playbooks/generate_config.yml -i inventory.yml --limit AMER --skip-tags validate -f 32 --vault-password-file ./vault-password.txt

.PHONY: build-preview-debug
build-preview-debug: ## Generate files without passwords but with debug
	ansible-playbook ./playbooks/generate_config.yml -i inventory.yml --skip-tags validate --tags debug -f 32 --vault-password-file ./vault-password.txt

.PHONY: build-nodocs
build-nodocs: ## Generate files without documentation
	ansible-playbook ./playbooks/generate_config.yml -i inventory.yml --skip-tags validate,documentation -f 32 --vault-password-file ./vault-password.txt

.PHONY: deploy
deploy: ## Deploy configs using new role
	ansible-playbook ./playbooks/generate_and_eapi_deploy.yml -i inventory.yml -f 32 --vault-password-file ./vault-password.txt

.PHONY: deploy-ignore-branch
deploy-ignore-branch: ## Deploy configs using new role
	ansible-playbook ./playbooks/push_configs_new.yml -i inventory.yml -f 32 --vault-password-file ./vault-password.txt --extra-vars '{"cv_workspace_description":"Deploy using branch: $(ACTUAL_BRANCH)"}'

.PHONY: deploy-debug
deploy-debug: ## Deploy configs using new role
	ansible-playbook ./playbooks/push_configs_new.yml -i inventory.yml -f 32 --vault-password-file ./vault-password.txt -vvv

.PHONY: commit-config
commit-config: ## Commit generated configuration and documentation
	git add intended
	git add documentation
	pre-commit
	git commit -m "Configuration and Documentation generated"

.PHONY: commit-avd-config
commit-avd-config: ## Commit AVD variables
	git add group_vars
	git add host_vars
	git add inventory.yml
	pre-commit
	@read -p "Commit message:" message; git commit -m "$$message"

.PHONY: commit-build-avd-config
commit-build-avd-config: ## Commit AVD variables, generate files, and commit configuration and documentation
	make commit-avd-config
	make build
	make config-commit

.PHONY: prepare-pr
prepare-pr: ## Remove generated configuration and documentation before creating a Pull Request
	rm -rf intended/
	rm -rf documentation/
	git add .
	git commit -m "Prepare Pull Request - Deleted configuration and documentation to avoid conflicts"

.PHONY: create-host_vars
create-host_vars: ## Generate hostvar files
	mkdir -p host_vars; for host in `ansible all -i inventory.yml --list-hosts | sed '1d'`; do echo "---" > host_vars/$$host.yml; done

.PHONY: create-group_vars
create-group_vars: ## Generate groupvar files
	mkdir -p group_vars; for group in `ansible-inventory --list -i inventory.yml | jq -r 'keys | unique | .[] | select(. | startswith("_") | not) | select(. | startswith("CONNECTED") | not) | select(. | startswith("TENANT") | not)'`; do if [ ! -f group_vars/$$group.yml ]; then echo "---" > group_vars/$$group.yml; fi; done

.PHONY: rename-connected_endpoints
rename-connected_endpoints: ## Rename connected_endpoints groupvar file to CONNECTED_ENDPOINTS
	rename 's/^INOFFICE1/INOFFICE2/' *
.PHONY: rename-group_vars
rename-group_vars: ## Rename group_vars groupvar files
	cd group_vars; rename -c "^(EXOFFICE1)([\w]*)(.yml)$\" "$(OFFICE)\(2)\(3)"; sed 's/EXOFFICE1/$(OFFICE)/g' $(OFFICE).yml > tmp; cat tmp > $(OFFICE).yml; rm tmp
	cd group_vars; cp -r CONNECTED_ENDPOINTS_EXOFFICE1 CONNECTED_ENDPOINTS_$(OFFICE); cd CONNECTED_ENDPOINTS_$(OFFICE); rename "^(EXOFFICE1)([\w]*)(.yml)$\" "$(OFFICE)\(2)\(3)"; for file in *; do sed 's/EXOFFICE1/$(OFFICE)/g' $$file > tmp; cat tmp > $$file; rm tmp; done
	cd group_vars; cp -r TENANT_NETWORKS_EXOFFICE1 TENANT_NETWORKS_$(OFFICE); cd TENANT_NETWORKS_$(OFFICE); rename "^(EXOFFICE1)([\w]*)(.yml)$\" "$(OFFICE)\(2)\(3)"; for file in *; do sed 's/EXOFFICE1/$(OFFICE)/g' $$file > tmp; cat tmp > $$file; rm tmp; done
