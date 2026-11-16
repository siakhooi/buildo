#!/bin/bash

_repo_copy_names()
{
	local root
	while IFS= read -r root; do
		[[ -n "$root" && -d "$root" ]] || continue
		find "$root" -mindepth 1 -maxdepth 1 -type d -printf '%f\n' 2>/dev/null
	done < <(buildo-config '."repo-copy".path[]' 2>/dev/null) | awk '!seen[$0]++'
}

_repo_copy_completions()
{
	local cur files selected
	COMPREPLY=()
	cur="${COMP_WORDS[COMP_CWORD]}"

	if command -v fzf >/dev/null 2>&1 && [[ -t 1 ]]; then
		selected=$(_repo_copy_names \
			| fzf --query="$cur" --select-1 --exit-0 2>/dev/null)
		if [[ -n "$selected" ]]; then
			COMPREPLY=("$selected")
			return
		fi
	fi

	files=$(_repo_copy_names)
	mapfile -t COMPREPLY < <(compgen -W "${files}" -- "${cur}")
}

complete -F _repo_copy_completions repo-copy
