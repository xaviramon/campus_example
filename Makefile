ACTUAL_BRANCH := $(shell git rev-parse --abbrev-ref HEAD)


.PHONY: help
help: ## Display help message
	@grep -E '^[0-9a-zA-Z_-]+\.*[0-9a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: push
push: ## Push to remote repositories
	git push

.PHONY: clean
clean: ## Remove intended and documentation folders
	rm -rf ./intended/* && \
	rm -rf ./documentation/*

.PHONY: build
build: ## Generate configurations and documentation for all regions
	ansible-playbook ./playbooks/generate_config.yml -i inventory.yml --skip-tags validate -f 32 --vault-password-file ./vault-password.txt

.PHONY: build-apac
build-apac: ## Generate configurations and documentation for APAC region
	ansible-playbook ./playbooks/generate_config.yml -i inventory.yml --limit APAC --skip-tags validate -f 32 --vault-password-file ./vault-password.txt

.PHONY: build-emea
build-emea: ## Generate configurations and documentation for EMEA region
	ansible-playbook ./playbooks/generate_config.yml -i inventory.yml --limit EMEA --skip-tags validate -f 32 --vault-password-file ./vault-password.txt

.PHONY: build-amer
build-amer: ## Generate configurations and documentation for AMER region
	ansible-playbook ./playbooks/generate_config.yml -i inventory.yml --limit AMER --skip-tags validate -f 32 --vault-password-file ./vault-password.txt

.PHONY: build-office
build-office: ## Generate configurations and documentation for AMER region
	ansible-playbook ./playbooks/generate_config.yml -i inventory.yml --limit $(OFFICE) --skip-tags validate -f 32 --vault-password-file ./vault-password.txt

.PHONY: build-preview-debug
build-preview-debug: ## Generate configurations and documentation with debug
	ansible-playbook ./playbooks/generate_config.yml -i inventory.yml --skip-tags validate --tags debug -f 32 --vault-password-file ./vault-password.txt

.PHONY: build-nodocs
build-nodocs: ## Generate configurations without documentation
	ansible-playbook ./playbooks/generate_config_no_docs.yml -i inventory.yml --skip-tags validate,documentation -f 32 --vault-password-file ./vault-password.txt

.PHONY: deploy
deploy: ## Deploy configs to CVaaS - WIP (missing token)
	ansible-playbook ./playbooks/deploy_configs_cvaas.yml -i inventory.yml -f 32 --vault-password-file ./vault-password.txt

.PHONY: deploy-selectively
deploy-selectively: ## Deploy configs on specific location to CVaaS and the workspace description includes the branch name. Execution: make deploy-selectively location=<location>
	ansible-playbook ./playbooks/deploy_configs_cvaas.yml -i inventory.yml -f 32 --vault-password-file ./vault-password.txt --extra-vars '{"cv_workspace_description":"Deployed selectively on $(location) using branch: $(ACTUAL_BRANCH)","cv_change_control_name":"Deployed selectively on $(location) using branch: $(ACTUAL_BRANCH)","cv_change_control_description":"Deployed selectively on $(location) using branch: $(ACTUAL_BRANCH)","my_playbook_hosts": $(location)}'

.PHONY: deploy-send-branch
deploy-send-branch: ## Deploy configs to CVaaS and the workspace description includes the branch name
	ansible-playbook ./playbooks/push_configs_new.yml -i inventory.yml -f 32 --vault-password-file ./vault-password.txt --extra-vars '{"cv_workspace_description":"Deploy using branch: $(ACTUAL_BRANCH)"}'

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
create-host_vars: ## Generate hostvar files based on the Ansible inventory
	mkdir -p host_vars; for host in `ansible all -i inventory.yml --list-hosts | sed '1d'`; do echo "---" > host_vars/$$host.yml; done

.PHONY: create-group_vars
create-group_vars: ## Generate groupvar files based on the EXOFFICE1 template (Example Office1). Execution: make create-group_vars OFFICE=<Name of the office> THEATER=<Region>
	cd group_vars; rename -c "^(EXOFFICE1)([\w]*)(.yml)$\" "$(OFFICE)\(2)\(3)"; sed 's/EXOFFICE1/$(OFFICE)/g' $(OFFICE).yml > tmp; sed 's/THEATER/$(THEATER)/g' tmp > tmp2 ; cat tmp2 > $(OFFICE).yml; rm tmp tmp2
	cd group_vars; cp -r CONNECTED_ENDPOINTS_EXOFFICE1 CONNECTED_ENDPOINTS_$(OFFICE); cd CONNECTED_ENDPOINTS_$(OFFICE); rename "^(EXOFFICE1)([\w]*)(.yml)$\" "$(OFFICE)\(2)\(3)"; for file in *; do sed 's/EXOFFICE1/$(OFFICE)/g' $$file > tmp; cat tmp > $$file; rm tmp; done
	cd group_vars; cp -r TENANT_NETWORKS_EXOFFICE1 TENANT_NETWORKS_$(OFFICE); cd TENANT_NETWORKS_$(OFFICE); rename "^(EXOFFICE1)([\w]*)(.yml)$\" "$(OFFICE)\(2)\(3)"; for file in *; do sed 's/EXOFFICE1/$(OFFICE)/g' $$file > tmp; cat tmp > $$file; rm tmp; done
	yq -Yi '.all.children.GLOBAL.children.$(THEATER).children += {"$(OFFICE)":{"children":{"$(OFFICE)_SPINES":{"hosts":{"$(OFFICE)_SPINE01":{is_deployed: false},"$(OFFICE)_SPINE02":{is_deployed: false}}},"$(OFFICE)_LEAVES":{"children":{"$(OFFICE)_LEAF01":{"hosts":{"$(OFFICE)_LEAF01A":{"is_deployed": false},"$(OFFICE)_LEAF01B":{"is_deployed": false}}},"$(OFFICE)_LEAF02":{"hosts":{"$(OFFICE)_LEAF02A":{"is_deployed": false},"$(OFFICE)_LEAF02B":{"is_deployed": false}}}}},"$(OFFICE)_SUBLEAVES":{"children":{"$(OFFICE)_SUBLEAF01":{"hosts":{"$(OFFICE)_SUBLEAF01C":{"is_deployed": false},"$(OFFICE)_SUBLEAF01D":{"is_deployed": false}}},"$(OFFICE)_SUBLEAF02":{"hosts":{"$(OFFICE)_SUBLEAF02C":{"is_deployed": false},"$(OFFICE)_SUBLEAF02D":{"is_deployed": false}}}}},"$(OFFICE)_INTERNET_LEAVES":{"hosts":{"$(OFFICE)_INTERNET_LEAF01":{"is_deployed": false},"$(OFFICE)_INTERNET_LEAF02":{"is_deployed": false}}}}}}' inventory.yml
	yq -Yi '.all.children += {"CONNECTED_ENDPOINTS_$(OFFICE)":{"children":{"$(OFFICE)_SPINES":'null',"$(OFFICE)_LEAVES":'null',"$(OFFICE)_SUBLEAVES":'null'}}}' inventory.yml
	yq -Yi '.all.children += {"TENANT_NETWORKS_$(OFFICE)":{"children":{"$(OFFICE)_SPINES":'null',"$(OFFICE)_LEAVES":'null',"$(OFFICE)_SUBLEAVES":'null'}}}' inventory.yml
