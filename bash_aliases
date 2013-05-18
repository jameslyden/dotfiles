# git aliases
alias gadd='git add'
alias gcom='git commit'
alias gpush='git push'
alias gpull='git pull'
alias gbr='git branch'
alias gstat='git status'
alias gvis='git visualize'
alias gdiff='git diff'

# gitted prompt
git_prompt()
{
	local git_status="$(git status -unormal 2>&1)"
	if ! [[ "$git_status" =~ Not\ a\ git\ repo ]]; then
		if [[ "$git_status" =~ nothing\ to\ commit ]]; then
			local ansi=32
		elif [[ "$git_status" =~ nothing\ added\ to\ commit\ but\ untracked\ files\ present ]]; then
			local ansi=34
		else
			local ansi=33
		fi
		echo -n '\[\e[0;33;'"$ansi"'m\]'"$(__git_ps1)"'\[\e[0m\]' \
			| sed -e 's/)/]/' -e 's/ (/[/'
	fi
}

prompt_command()
{
	PS1="\u@\h:\w$(git_prompt)\$ "
}

PROMPT_COMMAND=prompt_command
