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

### Config

- `buildo-config`
- `buildo-config-{edit,set}`

### pip

- `pip-{purge,upgrade}-all`

### docker

- `buildo-docker-{build,build-list,images}`

### git

- `git-reset-very-hard`

### message

- `buildo-message`

### Jira

- `buildo-jira-curl`
- `buildo-jira-{issue,status}-get`

### Proxy

- `buildo-proxy`

### Github

- `buildo-github-release-latest-get`

### Package
- `buildo-upgrade`

### Completion

- `buildo-completion`

### Anacron

- `buildo-anacron-{exec,log,run,status}`

### Init functions

- `/usr/lib/buildo/buildo-init-git-functions`
  - `buildo_shell_prompt_for_git_repo`

## Dependencies

- `yq`
- `docker`
