# see: https://gist.github.com/junegunn/8b572b8d4b5eddd8b85e5f4d40f17236
# see: https://junegunn.kr/2016/07/fzf-git/

is_in_git_repo() {
  git rev-parse HEAD > /dev/null 2>&1
}

alias fzf-down='fzf --height 50% --min-height 20 --border --bind ctrl-/:toggle-preview'

_gf() {
  is_in_git_repo || return
  git -c color.status=always status --short |
  fzf-down -m --ansi --nth 2..,.. \
    --preview '(git diff --color=always -- {-1} | sed 1,4d; cat {-1})' |
  cut -c4- | sed 's/.* -> //'
}

_gb() {
  is_in_git_repo || return
  git branch -a --color=always | rg -v '/HEAD' | sort |
  fzf-down --ansi --multi --tac --preview-window right:70% \
    --preview 'git log --oneline --graph --date=short --color=always --pretty="format:%C(auto)%cd %h%d %s" $(sed s/^..// <<< {} | cut -d" " -f1)' |
  sed 's/^..//' | cut -d' ' -f1 |
  sed 's#^remotes/##'
}

_gh() {
  is_in_git_repo || return
  git log --date=short --format="%C(green)%C(bold)%cd %C(auto)%h%d %s (%an)" --graph --color=always |
  fzf-down --ansi --no-sort --reverse --multi --bind 'ctrl-s:toggle-sort' \
    --header 'Press CTRL-S to toggle sort or CTRL-/ to toggle preview' \
    --preview 'rg -o "[a-f0-9]{7,}" <<< {} | xargs git show --color=always' |
  rg -o "[a-f0-9]{7,}"
}

join-lines() {
  local item
  while read item; do
    echo -n "${(q)item} "
  done
}

() {
  local c
  for c in $@; do
    eval "fzf-g$c-widget() { local result=\$(_g$c | join-lines); zle reset-prompt; LBUFFER+=\$result }"
    eval "zle -N fzf-g$c-widget"
    eval "bindkey '^g^$c' fzf-g$c-widget"
  done
} f b h

alias git-fixup='git commit --fixup="$(_gh)"'
