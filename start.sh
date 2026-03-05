#!/bin/bash
# AI Teams 启动脚本

set -e

echo "🤖 AI Teams - 自主协作AI团队系统"
echo "=================================="

# 颜色定义
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

# 检查 Python
if ! command -v python3 &> /dev/null; then
    echo -e "${RED}❌ Python3 未安装${NC}"
    exit 1
fi

echo -e "${GREEN}✅ Python3 已安装${NC}"

# 创建虚拟环境
if [ ! -d "venv" ]; then
    echo -e "${YELLOW}📦 创建虚拟环境...${NC}"
    python3 -m venv venv
fi

# 激活虚拟环境
source venv/bin/activate

# 安装依赖
if [ -f "requirements.txt" ]; then
    echo -e "${YELLOW}📦 安装依赖...${NC}"
    pip install -q -r requirements.txt
fi

# 创建必要目录
mkdir -p data/tasks data/knowledge logs reports/daily reports/weekly

echo -e "${GREEN}✅ 环境准备完成${NC}"
echo ""

# 启动引擎
echo -e "${BLUE}🚀 启动 AI Teams 引擎...${NC}"
echo "心跳间隔: 30分钟"
echo "Agent 列表:"
echo "  - ⚡ nano (产品+运营)"
echo "  - 🎨 tencent_claw (前端开发)"
echo "  - 🔧 ubuntu_openclaw (后端+运维)"
echo ""

python3 src/core/engine.py
