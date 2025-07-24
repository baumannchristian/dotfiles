function build_prompt() {
  local exit_code=$?

  # current directory
  local cwd="%F{cyan}%1~%f"

  # git
  local gitpart=""
  if git rev-parse --is-inside-work-tree &>/dev/null; then
    # truncate branch name
    local branch=$(git symbolic-ref --short HEAD 2>/dev/null || git rev-parse --short HEAD 2>/dev/null)
    branch=${branch:0:14}

    # lines in unstaged changes
    local added=$(git diff --numstat 2>/dev/null | awk '{sum+=$1} END{print sum+0}')
    local removed=$(git diff --numstat 2>/dev/null | awk '{sum+=$2} END{print sum+0}')

     # always show branch
    local gitpart=""
    if [[ ! -n $(git status --porcelain) ]]; then
      gitpart=" %F{green} ${branch}%f"
    else
      gitpart=" %F{yellow} ${branch}%f"
    fi

    if [[ $added -gt 0 ]]; then
      gitpart+=" %F{green}+${added}%f"
    fi
    if [[ $removed -gt 0 ]]; then
      gitpart+=" %F{red}-${removed}%f"
    fi
  fi

  PROMPT="${cwd}${gitpart} ➜ "
}

# hooks
autoload -U add-zsh-hook
add-zsh-hook precmd build_prompt
add-zsh-hook chpwd  build_prompt

# initial
build_prompt
