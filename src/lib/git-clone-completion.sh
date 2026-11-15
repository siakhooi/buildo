#!/usr/bin/env bash

_git_clone_config() {
  printf '%s/.git-clone.yaml' "${HOME}"
}

_git_clone_urls() {
  local config
  config=$(_git_clone_config)
  [[ -f $config ]] || return 0

  if command -v yq &>/dev/null; then
    yq -r '.repos[]' "$config" 2>/dev/null
    return 0
  fi

  awk '
    /^[[:space:]]*-[[:space:]]+/ {
      sub(/^[[:space:]]*-[[:space:]]+/, "")
      gsub(/^["'\'']|["'\'']$/, "")
      print
    }' "$config"
}

_git_clone_used_urls() {
  local i word cur
  cur="${COMP_WORDS[COMP_CWORD]}"
  for ((i = 1; i < COMP_CWORD; i++)); do
    word="${COMP_WORDS[i]}"
    [[ $word == "$cur" ]] && continue
    [[ $word == -* ]] && continue
    printf '%s\n' "$word"
  done
}

_git_clone_candidates() {
  local -a urls used
  local url used_url found

  mapfile -t urls < <(_git_clone_urls)
  ((${#urls[@]})) || return 0

  mapfile -t used < <(_git_clone_used_urls)
  for url in "${urls[@]}"; do
    found=
    for used_url in "${used[@]}"; do
      if [[ $url == "$used_url" ]]; then
        found=1
        break
      fi
    done
    [[ -n $found ]] && continue
    printf '%s\n' "$url"
  done
}

_git_clone_fzf_pick() {
  local cur query selected
  cur="${COMP_WORDS[COMP_CWORD]}"
  query=$cur

  selected=$(
    FZF_DEFAULT_OPTS="${FZF_DEFAULT_OPTS:---height 40% --reverse --bind=tab:down,btab:up}" \
      fzf --query="$query" --select-1 --exit-0 --prompt='git-clone> ' \
      < <(_git_clone_candidates) 2>/dev/null
  ) || true

  if [[ -n $selected ]]; then
    COMPREPLY=("$selected")
    return 0
  fi
  return 1
}

_git_clone() {
  local cur prev
  local -a candidates

  compopt +o default +o bashdefault 2>/dev/null
  compopt -o nospace 2>/dev/null

  cur="${COMP_WORDS[COMP_CWORD]}"

  if declare -F _init_completion &>/dev/null; then
    _init_completion -s || return
    prev="${COMP_WORDS[COMP_CWORD - 1]}"
  else
    prev="${COMP_WORDS[COMP_CWORD - 1]}"
  fi

  case $prev in
    -h) return ;;
  esac

  if [[ $cur == -* ]]; then
    mapfile -t COMPREPLY < <(compgen -W '-h' -- "$cur")
    return
  fi

  mapfile -t candidates < <(_git_clone_candidates)
  if ((${#candidates[@]} == 0)); then
    COMPREPLY=()
    return
  fi

  if [[ -z $cur ]] && command -v fzf &>/dev/null; then
    if _git_clone_fzf_pick; then
      return
    fi
  fi

  local cand
  cand=$(printf '%s\n' "${candidates[@]}")
  mapfile -t COMPREPLY < <(compgen -W "$cand" -- "$cur")
}

complete -F _git_clone git-clone
