# AI Teams 快速开始

## 🎯 5分钟快速体验

### 1. 克隆项目
```bash
git clone https://github.com/yourusername/ai-teams.git
cd ai-teams
```

### 2. 安装依赖
```bash
pip install -r requirements.txt
```

### 3. 配置API密钥
```bash
export OPENAI_API_KEY="your-api-key"
# 或
export ANTHROPIC_API_KEY="your-api-key"
```

### 4. 启动系统
```bash
python src/core/engine.py --start
```

### 5. 查看状态
```bash
python src/core/engine.py --status
```

## 📝 创建第一个任务

### 方式1: 通过文件
创建 `data/tasks/new-task.json`:
```json
{
  "title": "我的第一个任务",
  "description": "让AI团队帮我分析一个市场机会",
  "priority": "medium",
  "type": "analysis"
}
```

### 方式2: 通过API
```bash
curl -X POST http://localhost:8080/tasks \
  -H "Content-Type: application/json" \
  -d '{
    "title": "分析竞品",
    "description": "分析GitHub Copilot的竞争策略"
  }'
```

### 方式3: 通过飞书（推荐）
在飞书群里发送:
```
@ai-teams 新任务：帮我写一个Landing Page
```

## 🤖 等待AI工作

启动后，AI团队会：
- ✅ 每30分钟自动检查任务
- ✅ 自动认领并执行任务
- ✅ 完成后通知你

你不需要再次@它们！

## 📊 监控进度

### 查看日志
```bash
tail -f logs/ai-teams.log
```

### 查看任务队列
```bash
cat data/tasks/queue.json | jq
```

### 查看知识库
```bash
ls -la data/knowledge/
```

## 🎨 自定义Agent

编辑 `config/agents.yaml`:
```yaml
agents:
  - name: my_agent
    role: custom_role
    capabilities:
      - capability_1
      - capability_2
    heartbeat_interval: 15m
```

## 🔧 高级配置

### 调整心跳频率
```yaml
# config/agents.yaml
heartbeat:
  interval: 15m  # 改为15分钟
```

### 添加通知渠道
```yaml
communication:
  channels:
    - type: slack
      webhook: "${SLACK_WEBHOOK}"
    - type: email
      smtp: "smtp.example.com"
```

### 自定义任务优先级
```yaml
tasks:
  priority_rules:
    - condition: "tags contains 'urgent'"
      priority: "critical"
    - condition: "created_at > 7d ago"
      priority: "low"
```

## 🐛 常见问题

### Q: AI没有自动执行任务？
A: 检查心跳是否正常运行：
```bash
ps aux | grep engine
```

### Q: 如何暂停系统？
A: 
```bash
python src/core/engine.py --stop
```

### Q: 如何重置任务队列？
A:
```bash
rm data/tasks/queue.json
```

### Q: 如何查看Agent的思考过程？
A:
```bash
cat logs/thinking/nano-2026-03-05.log
```

## 📚 下一步

- [阅读架构文档](ARCHITECTURE.md)
- [查看API文档](API.md)
- [浏览示例](EXAMPLES.md)
- [加入社区](https://discord.gg/ai-teams)

---

**需要帮助？** 在GitHub上提Issue或在Discord社区提问！
