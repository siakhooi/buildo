set-version:
	scripts/set-version.sh
build:
	scripts/build.sh
clean:
	scripts/clean.sh
deploy-in-dev:
	scripts/deploy-in-dev.sh
undeploy:
	scripts/undeploy.sh
	rm -rf ~/.buildo

un-all: undeploy clean
all: clean set-version build deploy-in-dev

commit:
	scripts/git-commit.sh

release:
	scripts/release.sh
