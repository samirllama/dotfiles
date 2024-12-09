# Case-sensitive completion must be off. _ and - will be interchangeable.
 HYPHEN_INSENSITIVE="true"
setopt prompt_subst
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
autoload bashcompinit && bashcompinit
autoload -Uz compinit
compinit

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

plugins=(git)

export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

# Set personal aliases, overriding those provided by Oh My Zsh libs, plugins, and themes.
# Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh

eval "$(starship init zsh)"
export STARSHIP_CONFIG=~/.config/starship/starship.toml

# You may need to manually set your language environment
export LANG=en_US.UTF-8

export EDITOR=/opt/homebrew/bin/nvim

# Function to get current branch name
git_current_branch() {
  git branch --show-current
}

# Function checks if the current working directory (PWD) starts with $HOME/Projects/bp.
set_git_config() {
  local current_dir="$PWD"
  local bp_dir="$HOME/Projects/bp"

  echo "Current directory: $current_dir"
  echo "BP directory: $bp_dir"

#  if [[ "$current_dir" == "$bp_dir*" ]]; then
#    echo "Setting work credentials"
#    git config --global user.name "Your Work Name"
#    git config --global user.email "your.work@email.com"
#  else
#    echo "Setting personal credentials"
#    git config --global user.name "S l"
#    git config --global user.email "s.**@***.com"
#  fi

}

# Enables powerful command-line completion: This includes suggestions for commands, file paths, options, and more
autoload -Uz compinit && compinit

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

#Sets the ZSH variable to the location of Oh My Zsh installation
export ZSH="$HOME/.oh-my-zsh"

export PATH="$HOME/.tmuxifier/bin:$PATH"

# Add to system's path
export PATH="/Applications/Cursor.app/Contents/MacOS:$PATH"

# User configuration
# export MANPATH="/usr/local/man:$MANPATH"
# You may need to manually set your language environment
# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

export PATH="/usr/local/go/bin:$PATH"
export PATH="$PATH:$HOME/go/bin"

# Update PATH to prioritiz Homebrew Python:
export PATH="/usr/local/opt/python@3.11/bin:$PATH"

# Created by `pipx` on 2024-09-16 22:15:41
export PATH="$PATH:/Users/apex/.local/bin"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="$PATH:$(yarn global bin)"
export PATH="$PYENV_ROOT/bin:$PATH"



function pyproject() {
    if [ -z "$1" ]; then
        echo "Please provide a project name."
        return 1
    fi
    
    local project_dir="/Users/apex/Documents/projects/py_projects/$1"
    
    if [ -d "$project_dir" ]; then
        echo "Project directory already exists."
        return 1
    fi
    
    mkdir -p "$project_dir"
    cd "$project_dir"
    python3 -m venv venv
    source venv/bin/activate
    
    echo "Project '$1' created and virtual environment activated."
    echo "You are now in $project_dir"
}


# I! Contents within this block are managed by 'conda init !?
# __conda_setup="$('/Users/apex/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
#     if [-f "/Users/apex/opt/anaconda3/etc/profile.d/conda.sh" ]; then
#         • "/Users/apex/opt/anaconda3/etc/profile.d/conda.sh"
#     else 
#         export PATH="/Users/apex/opt/anaconda3/bin:$PATH" 
#     fi
# fi 
# unset __conda_setup
#<<<-conda-initialize•<<‹

#•python•libs•locations
# export PYTHTONPATH=$PYTHONPATH:path/to/your/directory
export PYTHONPATH=$PYTHONPATH:/Users/apex/Documents/bp/bio-lc-lambda-layer/src/bioLCLambdaLayer/python:
export PYENV_ROOT="$HOME/.pyenv"

apex_dirs=(
    "/Users/apex/Documents/bp/bio-lc-lambda-layer/src/bioLCLambdaLayer/python"
    "/Users/apex/Documents/bp/bio-lc-lambda-layer/src/sqlalchemy/python"
    "/Users/apex/Documents/bp/bio-lc-lambda-layer/src/bioLcEmailServiceLambdaLayer/python"
)

for dir in "${apex_dirs[@]}"
do
    export PYTHONPATH="$PYTHONPATH:$dir"
done


# compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# loads the vcs_info function, which is used to display version control information in the prompt
# Load version control information
autoload -Uz vcs_info
precmd_functions+=(vcs_info)

autoload -U promptinit
promptinit
# optionally define some options
PURE_CMD_MAX_EXEC_TIME=10


# sets the format for displaying Git branch information, where %b is replaced with the current branch name
setopt prompt_subst
set_git_config

eval "$(pyenv init --path)"
eval "$(pyenv init -)"
eval "$(starship init zsh)"
eval "$(tmuxifier init -)"

echo ".zshrc loaded"

# Created by `pipx` on 2024-11-12 01:42:16
export PATH="$PATH:/Users/apex/Library/Python/3.9/bin"
export PATH="$PATH:/Users/apex/Library/Python/3.9/bin"
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh 

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
