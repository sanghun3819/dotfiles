fish_vi_key_bindings

# CUDA
set -x PATH /usr/local/cuda/bin $PATH
set -x LD_LIBRARY_PATH /usr/local/cuda/lib64 $LD_LIBRARY_PATH
# Mujoco
set -x LD_LIBRARY_PATH $HOME/.mujoco/mujoco200/bin $LD_LIBRARY_PATH
# set -x LD_LIBRARY_PATH $HOME/.mujoco/mjpro150/bin $LD_LIBRARY_PATH

# alias
alias ns="nvidia-smi"
alias wns="watch -n 1 nvidia-smi"
alias sfish="source ~/.config/fish/config.fish"


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval /home/kun/anaconda3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<

