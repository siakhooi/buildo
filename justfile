set-version:
	scripts/set-version.sh
clean:
	rm -rf target siakhooi-buildo-*rpm* siakhooi-buildo_*.deb*

shellcheck:
	./scripts/shellcheck.sh
build-deb: clean shellcheck
	scripts/build-deb.sh

build-rpm: clean shellcheck
	scripts/build-rpms.sh

release:
	scripts/release.sh

deb-install:
	sudo apt install ./*.deb
deb-uninstall:
	sudo apt remove -y siakhooi-buildo

root := justfile_directory()
docker-test:
	docker run --rm -v {{ root }}:/workspaces docker.io/siakhooi/devcontainer:deb2604 scripts/bats-test.sh

docker-build-rpm:
	docker run --rm -v {{ root }}:/workspaces docker.io/siakhooi/devcontainer:rpm44 scripts/build-rpms.sh
docker-build-deb:
	docker run --rm -v {{ root }}:/workspaces docker.io/siakhooi/devcontainer:deb2604 scripts/build-deb.sh

all: clean set-version shellcheck docker-build-deb docker-build-rpm
