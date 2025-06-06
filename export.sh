# 禁用 Oh My Zsh 的自动补全修复
ZSH_DISABLE_COMPFIX="true"
export HOMEBREW_NO_AUTO_UPDATE=true
export PYTHONHTTPSVERIFY=0

# 加载 p10k 配置
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
# 设置终端默认编辑器
export editor=code
# 设置 Homebrew 镜像源
# export HOMEBREW_API_DOMAIN="https://mirrors.aliyun.com/homebrew-bottles/api"
# export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.aliyun.com/homebrew/brew.git"
# export HOMEBREW_CORE_GIT_REMOTE="https://mirrors.aliyun.com/homebrew/homebrew-core.git"
# export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.aliyun.com/homebrew/homebrew-bottles"

export ORACLE_HOME=/Users/kuangbendewoniu/instantclient_19_8
export PATH=$PATH:$ORACLE_HOME
export DYLD_LIBRARY_PATH=$ORACLE_HOME:$DYLD_LIBRARY_PATH

