set-version:
	scripts/set-version.sh
clean:
	scripts/clean.sh

shellcheck:
	./scripts/shellcheck.sh
build-deb: clean shellcheck
	scripts/build-deb.sh
undeploy:
	scripts/undeploy.sh
	rm -rf ~/.buildo

build-rpm: clean shellcheck
	scripts/build-rpms.sh

un-all: undeploy clean
all-deb: clean set-version build-deb deb-install
all-rpm: clean set-version build-rpm rpm-install

commit:
	scripts/git-commit-and-push.sh

release:
	scripts/release.sh

deb-install:
	sudo apt install ./*.deb
deb-uninstall:
	sudo apt remove -y siakhooi-buildo

docker-build-rpm:
	docker run --rm -v $(CURDIR):/workspace docker.io/siakhooi/devcontainer:rpm scripts/build-rpms.sh
docker-build-deb:
	docker run --rm -v $(CURDIR):/workspace docker.io/siakhooi/devcontainer:deb scripts/build-deb.sh
