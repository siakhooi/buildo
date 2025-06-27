set-version:
	scripts/set-version.sh
clean:
	scripts/clean.sh
build-deb:
	scripts/build-deb.sh
deploy-deb-in-dev:
	scripts/deploy-deb-in-dev.sh
undeploy:
	scripts/undeploy.sh
	rm -rf ~/.buildo

un-all: undeploy clean
all-deb: clean set-version build-deb deploy-deb-in-dev

commit:
	scripts/git-commit-and-push.sh

release:
	scripts/release.sh
