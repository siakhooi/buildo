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
- `buildo-checker-{docker-usage,path-usage,space-left}`
- `buildo-completion`
- `buildo-config-{edit,set}`
- `buildo-config`
- `buildo-docker-{build,build-list,images}`
- `buildo-git-pull`
- `buildo-github-release-latest-get`
- `buildo-housekeep-by-age`
- `buildo-jira-{issue,status}-get`
- `buildo-jira-curl`
- `buildo-message`
- `buildo-proxy`
- `buildo-upgrade`
- `buildo-version`
- `my-jira`
- `pip-purge-all`

### Init functions

- `/usr/lib/buildo/buildo-init-git-functions`
  - `buildo_shell_prompt_for_git_repo`

## Environments
- `BUILDO_DOCKER_BUILD_HOME` - default `$BUILDO_HOME/docker-build`

## Dependencies

- `yq`
- `docker`
