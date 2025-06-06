# ANSI 颜色定义
# 主要颜色
PRIMARY='\033[38;5;75m'    # 柔和的蓝色，用于主要信息
SECONDARY='\033[38;5;147m' # 淡紫色，用于次要信息
ACCENT='\033[38;5;178m'    # 暖黄色，用于强调
INFO='\033[38;5;109m'      # 青灰色，用于普通信息
PURPLE='\033[38;5;183m'    # 优雅的紫色，用于一言

# 文本样式
BOLD='\033[1m'
DIM='\033[2m'
ITALIC='\033[3m'
NC='\033[0m'              # 重置所有属性

# 系统信息函数
function system_info() {
    local os_info=$(sw_vers -productName)
    local os_version=$(sw_vers -productVersion)
    local cpu_info=$(sysctl -n machdep.cpu.brand_string)
    local memory_info=$(echo "scale=1; $(sysctl -n hw.memsize) / 1024 / 1024 / 1024" | bc)
    echo -e "${PRIMARY}${BOLD}🖥  系统:    ${NC}${ITALIC}${os_info} ${os_version}${NC}"
    echo -e "${PRIMARY}${BOLD}💻 处理器:  ${NC}${ITALIC}${cpu_info}${NC}"
    echo -e "${PRIMARY}${BOLD}🧠 内存:    ${NC}${ITALIC}${memory_info} GB${NC}"
}

function ip() {
    echo -e "\n${BOLD}${SECONDARY}📡 网络信息:${NC}"
    echo -e "${DIM}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    # 获取本地IP
    local local_ip=$(ifconfig | grep "inet " | grep -v 127.0.0.1 | awk '{print $2}' | head -n 1)
    echo -e "${BOLD}${INFO}🏠 本地IP: ${NC}${ITALIC}${local_ip}${NC}"
    echo "${local_ip}" | tr -d "[:space:]" | pbcopy
    # 获取公网IP
    local public_ip=$(curl -s "http://myip.ipip.net" | awk -F '：' '{print $2}' | awk '{print $1}')
    echo -e "${BOLD}${INFO}🌐 公网IP: ${NC}${ITALIC}${public_ip}${NC}"
}

# 开发环境信息函数
function dev_env_info() {
    echo -e "\n${BOLD}${SECONDARY}🛠  开发环境:${NC}"
    echo -e "${DIM}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${PRIMARY}${BOLD}☕️ Java:    ${NC}${INFO}$(which java)${NC} ${DIM}(${ACCENT}$(jenv version | cut -d ' ' -f1)[jenv]${NC}${DIM})${NC}"
    echo -e "${PRIMARY}${BOLD}⬡ Node.js: ${NC}${INFO}$(which node)${NC} ${DIM}(${ACCENT}$(node -v | sed 's/v//')[fnm]${NC}${DIM})${NC}"
    echo -e "${PRIMARY}${BOLD}🐍 Python:  ${NC}${INFO}$(which python3)${NC} ${DIM}(${ACCENT}$(python3 -V | cut -d ' ' -f2)[pyenv]${NC}${DIM})${NC}"
}

# 获取一言
HITOKOTO=$(curl -s "https://v1.hitokoto.cn/" | jq -r '.hitokoto')

# 计算字符串显示宽度的函数
get_string_width() {
    local string="$1"
    local width=0
    for (( i=0; i<${#string}; i++ )); do
        char="${string:$i:1}"
        if [[ $char =~ [[:print:]] ]]; then
            if [[ $char =~ [一-龥！：，。？、；（）【】《》""''] ]]; then
                width=$((width + 2))
            else
                width=$((width + 1))
            fi
        fi
    done
    echo $width
}

# 计算边框长度和填充
CONTENT_WIDTH=$(get_string_width "$HITOKOTO")
TITLE="每日一句"
TITLE_WIDTH=$(get_string_width "$TITLE")

# 计算合适的宽度
MIN_PADDING=1  # 最小内边距
CONTENT_MIN_WIDTH=$(( CONTENT_WIDTH + MIN_PADDING * 2 ))
TITLE_MIN_WIDTH=$(( TITLE_WIDTH + 4 ))  # 标题两侧各留2个字符
TOTAL_WIDTH=$(( CONTENT_MIN_WIDTH > TITLE_MIN_WIDTH ? CONTENT_MIN_WIDTH : TITLE_MIN_WIDTH ))

# 生成边框
BORDER=$(printf "─%.0s" $(seq 1 $TOTAL_WIDTH))

# 计算标题的填充以确保对称性
TITLE_SPACES=$(( (TOTAL_WIDTH - TITLE_WIDTH) / 2 ))
TITLE_PADDING=$((TITLE_SPACES - 2))  # 减去装饰符的宽度
TITLE_LEFT=$(printf "─%.0s" $(seq 1 $TITLE_PADDING))
TITLE_RIGHT=$(printf "─%.0s" $(seq 1 $(( TOTAL_WIDTH - TITLE_WIDTH - TITLE_PADDING - 4 ))))  # 4是两个装饰符的总宽度

# 计算内容的填充
CONTENT_SPACES=$(( (TOTAL_WIDTH - CONTENT_WIDTH) / 2 ))
CONTENT_LEFT=$(printf " %.0s" $(seq 1 $CONTENT_SPACES))
CONTENT_RIGHT=$(printf " %.0s" $(seq 1 $(( TOTAL_WIDTH - CONTENT_WIDTH - CONTENT_SPACES ))))

# 主函数
system_info
ip
dev_env_info

# 输出一言
echo -e "\n${PURPLE}${BOLD}┌${TITLE_LEFT}❨ ${TITLE} ❩${TITLE_RIGHT}┐${NC}"
echo -e "${PURPLE}${BOLD}│${NC}${CONTENT_LEFT}${PURPLE}${ITALIC}${HITOKOTO}${NC}${CONTENT_RIGHT}${PURPLE}${BOLD}│${NC}"
echo -e "${PURPLE}${BOLD}└${BORDER}┘${NC}\n"