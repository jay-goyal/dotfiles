set -U fish_user_paths $fish_user_paths $HOME/.local/bin/
set fish_greeting                      # Supresses fish's intro message
set TERM "xterm-256color"              # Sets the terminal type
set EDITOR "vim"      # $EDITOR use Emacs in terminal
set VISUAL "vim"   # $VISUAL use Emacs in GUI mode

### PROMPT ###


# name: mars (based on eclm)
function _git_branch_name
  echo (command git symbolic-ref HEAD 2> /dev/null | sed -e 's|^refs/heads/||')
end

function _is_git_dirty
  echo (command git status -s --ignore-submodules=dirty 2> /dev/null)
end

function fish_prompt
  set -l last_status $status
  set -l cyan (set_color -o cyan)
  set -l yellow (set_color -o yellow)
  set -l red (set_color -o red)
  set -l blue (set_color -o blue)
  set -l green (set_color -o green)
  set -l normal (set_color normal)

  if test $last_status = 0
      set arrow " $green▶︎︎"
  else
      set arrow " $red▶︎︎"
  end
  set -l cwd $cyan(prompt_pwd)

  if [ (_git_branch_name) ]
    set git_branch (_git_branch_name)

    if [ (_is_git_dirty) ]
      set git_info "$blue ($yellow$git_branch±$blue)"
    else
      if test (_git_branch_name) = 'main'
        set git_info "$blue ($red$git_branch$blue)"
      else
        set git_info "$blue ($normal$git_branch$blue)"
      end
    end
  end

  echo -n -s $cwd $git_info $normal $arrow $normal ' '
end

### END OF PROMPT ###

# Functions needed for !! and !$
# Will only work in default (emacs) mode.
# Will NOT work in vi mode.
function __history_previous_command
  switch (commandline -t)
  case "!"
    commandline -t $history[1]; commandline -f repaint
  case "*"
    commandline -i !
  end
end

function __history_previous_command_arguments
  switch (commandline -t)
  case "!"
    commandline -t ""
    commandline -f history-token-search-backward
  case "*"
    commandline -i '$'
  end
end
# The bindings for !! and !$
bind ! __history_previous_command
bind '$' __history_previous_command_arguments


## BROOT ##
function br
    set -l cmd_file (mktemp)
    if broot --outcmd $cmd_file $argv
        read --local --null cmd < $cmd_file
        rm -f $cmd_file
        eval $cmd
    else
        set -l code $status
        rm -f $cmd_file
        return $code
    end
end


## ALIASES ##
abbr yays "yay -S"
abbr yayss "yay -Ss"
abbr yaysyyu "yay -Syyu"
abbr yaysyy "yay -Syy"
abbr yayr "yay -R"

alias ls='exa -al --color=always --group-directories-first' # my preferred listing
alias la='exa -a --color=always --group-directories-first'  # all files and dirs
alias ll='exa -l --color=always --group-directories-first'  # long format
alias lt='exa -aT --color=always --group-directories-first' # tree listing

alias vim="nvim"

abbr grep "rg"
abbr du "dust"
abbr compile "g++ -Wall -std=c++14"

export PATH="$HOME/.emacs.d/bin:$PATH"

colorscript random
