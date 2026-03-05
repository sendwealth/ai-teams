#!/bin/bash
# AI Teams 监控脚本

echo "🤖 AI Teams 监控面板"
echo "===================="
echo ""

# 检查进程
if pgrep -f "engine.py" > /dev/null; then
    echo "✅ 引擎运行中"
    echo "PID: $(pgrep -f 'engine.py')"
else
    echo "❌ 引擎未运行"
fi

echo ""

# 检查最近的日志
if [ -f "logs/ai-teams-$(date +%Y%m%d).log" ]; then
    echo "📋 最近日志（最后10行）:"
    tail -10 "logs/ai-teams-$(date +%Y%m%d).log"
else
    echo "⚠️  暂无今日日志"
fi

echo ""

# 检查任务队列
if [ -f "data/tasks/queue.json" ]; then
    TASKS=$(cat data/tasks/queue.json | python3 -c "import sys, json; data=json.load(sys.stdin); print(len(data))")
    echo "📊 任务队列: $TASKS 个任务"
else
    echo "📊 任务队列: 0 个任务"
fi

echo ""

# 检查知识库
if [ -d "data/knowledge" ]; then
    KNOWLEDGE_FILES=$(find data/knowledge -name "*.json" | wc -l)
    echo "📚 知识库: $KNOWLEDGE_FILES 条记录"
else
    echo "📚 知识库: 0 条记录"
fi

echo ""
echo "===================="
