# Buildo

power toys for builder.

## Installation

### Deb

```
sudo curl -L https://siakhooi.github.io/apt/siakhooi-apt.list | sudo tee /etc/apt/sources.list.d/siakhooi-apt.list > /dev/null
sudo curl -L https://siakhooi.github.io/apt/siakhooi-apt.gpg  | sudo tee /usr/share/keyrings/siakhooi-apt.gpg > /dev/null
sudo apt update
sudo apt install siakhooi-buildo
```

### Rpm

```
sudo curl -L https://siakhooi.github.io/rpms/siakhooi-rpms.repo | sudo tee /etc/yum.repos.d/siakhooi-rpms.repo > /dev/null
sudo yum install siakhooi-buildo
```

### Setup Completion

add the following to `~/.bashrc`

```bash
source <(buildo-completion)
```

## Binaries

- `buildo-anacron-{exec,log,run,status}`
- `buildo-auto-commit`
- `buildo-backup`
- `buildo-checker-{docker-usage,path-usage,space-left}`
- `buildo-completion`
- `buildo-config-{edit,set}`
- `buildo-config`
- `buildo-docker-{build,build-list,images}`
- `buildo-expiring`
- `buildo-git-pull`
- `buildo-github-release-latest-get`
- `buildo-housekeep-by-age`
- `buildo-jira-{issue,status}-get`
- `buildo-jira-curl`
- `buildo-message`
- `buildo-prepare`
- `buildo-proxy`
- `buildo-upgrade`
- `buildo-version`
- `docker-clean`
- `docker-images`
- `docker-stats`
- `my-jira`
- `newman-collection`
- `pip-purge-all`

### Init functions

- `/usr/lib/buildo/buildo-init-git-functions`
  - `buildo_shell_prompt_for_git_repo`

## Environments
- `BUILDO_DOCKER_BUILD_HOME` - default `$BUILDO_HOME/docker-build`

## Dependencies

- `yq`
- `docker`

## Deployments
- https://siakhooi.github.io/apt/
- https://siakhooi.github.io/rpms/

## Badges

![GitHub](https://img.shields.io/github/license/siakhooi/buildo?logo=github)
![GitHub last commit](https://img.shields.io/github/last-commit/siakhooi/buildo?logo=github)
![GitHub tag (latest by date)](https://img.shields.io/github/v/tag/siakhooi/buildo?logo=github)
![GitHub issues](https://img.shields.io/github/issues/siakhooi/buildo?logo=github)
![GitHub closed issues](https://img.shields.io/github/issues-closed/siakhooi/buildo?logo=github)
![GitHub pull requests](https://img.shields.io/github/issues-pr-raw/siakhooi/buildo?logo=github)
![GitHub closed pull requests](https://img.shields.io/github/issues-pr-closed-raw/siakhooi/buildo?logo=github)
![GitHub top language](https://img.shields.io/github/languages/top/siakhooi/buildo?logo=github)
![GitHub language count](https://img.shields.io/github/languages/count/siakhooi/buildo?logo=github)
![GitHub repo size](https://img.shields.io/github/repo-size/siakhooi/buildo?logo=github)
![GitHub code size in bytes](https://img.shields.io/github/languages/code-size/siakhooi/buildo?logo=github)
![Workflow](https://img.shields.io/badge/Workflow-github-purple)
![workflow](https://github.com/siakhooi/buildo/actions/workflows/workflow-build-with-quality-checks.yml/badge.svg)
![workflow](https://github.com/siakhooi/buildo/actions/workflows/workflow-deployments.yml/badge.svg)

![Release](https://img.shields.io/badge/Release-github-purple)
![GitHub release (latest by date)](https://img.shields.io/github/v/release/siakhooi/buildo?label=GPR%20release&logo=github)
![GitHub all releases](https://img.shields.io/github/downloads/siakhooi/buildo/total?color=33cb56&logo=github)
![GitHub Release Date](https://img.shields.io/github/release-date/siakhooi/buildo?logo=github)

[![Wise](https://img.shields.io/badge/Funding-Wise-33cb56.svg?logo=wise)](https://wise.com/pay/me/siakn3)
![visitors](https://hit-tztugwlsja-uc.a.run.app/?outputtype=badge&counter=ghmd-buildo)
