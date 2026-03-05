# 🤖 AI Teams - 自主协作AI团队系统

> AI不再需要被@，它们会主动思考、工作、协作！

## 🎯 项目目标

创建一个全自动AI团队协作系统，让多个AI agent能够：
- ✅ **主动思考** - 无需人工触发，定期分析、规划
- ✅ **自主工作** - 自动领取任务、执行、汇报
- ✅ **智能协作** - agent间分工合作、互相review
- ✅ **持续进化** - 从经验中学习，优化流程

## 🏗️ 系统架构

```
┌─────────────────────────────────────────────────────────┐
│                    AI Teams 引擎                         │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐  │
│  │   思考引擎    │  │   任务引擎    │  │   协作引擎    │  │
│  │  (Thinking)  │  │  (Tasks)     │  │ (Collaborate)│  │
│  └──────────────┘  └──────────────┘  └──────────────┘  │
│                                                          │
│  ┌──────────────────────────────────────────────────┐  │
│  │            Heartbeat (心跳触发器)                 │  │
│  │         每30分钟自动唤醒所有agent                 │  │
│  └──────────────────────────────────────────────────┘  │
└─────────────────────────────────────────────────────────┘
           ↓                    ↓                    ↓
    ┌──────────┐         ┌──────────┐         ┌──────────┐
    │  Nano    │         │ tencent  │         │ ubuntu   │
    │ (产品+运营)│         │  claw    │         │openclaw  │
    │          │         │ (前端+UI) │         │(后端+运维)│
    └──────────┘         └──────────┘         └──────────┘
```

## 🔄 工作流程

### 1. 心跳触发（每30分钟）
```yaml
on_heartbeat:
  - 检查任务队列
  - 分析当前状态
  - 决策下一步行动
  - 执行或分配任务
  - 更新知识库
  - 汇报进度（如有重大进展）
```

### 2. 任务生命周期
```
发现机会 → 创建任务 → 认领 → 执行 → Review → 完成 → 复盘
    ↑                                                    ↓
    ←←←←←←←←←←←←← 持续循环 ←←←←←←←←←←←←←←←←←←←←←←←←←←←←←
```

### 3. 协作机制
- **任务认领**: 先到先得，更新状态避免冲突
- **进度同步**: 通过共享文件系统（Git同步）
- **质量保证**: 交叉review，互相学习
- **冲突解决**: 基于时间戳和优先级

## 📁 项目结构

```
ai-teams/
├── src/
│   ├── core/
│   │   ├── engine.py          # 核心引擎
│   │   ├── heartbeat.py       # 心跳系统
│   │   └── scheduler.py       # 任务调度
│   ├── agents/
│   │   ├── base.py            # Agent基类
│   │   ├── nano.py            # 产品+运营agent
│   │   ├── developer.py       # 开发agent
│   │   └── ops.py             # 运维agent
│   ├── tasks/
│   │   ├── manager.py         # 任务管理
│   │   └── queue.py           # 任务队列
│   └── knowledge/
│       ├── memory.py          # 知识存储
│       └── learning.py        # 学习模块
├── config/
│   ├── agents.yaml            # Agent配置
│   ├── tasks.yaml             # 任务模板
│   └── schedules.yaml         # 调度配置
├── scripts/
│   ├── start.sh               # 启动脚本
│   └── monitor.sh             # 监控脚本
├── docs/
│   ├── ARCHITECTURE.md        # 架构文档
│   ├── API.md                 # API文档
│   └── EXAMPLES.md            # 使用示例
└── README.md
```

## 🚀 快速开始

### 安装
```bash
git clone https://github.com/yourusername/ai-teams.git
cd ai-teams
pip install -r requirements.txt
```

### 配置
```yaml
# config/agents.yaml
agents:
  - name: nano
    role: product_manager
    capabilities:
      - market_analysis
      - product_planning
      - user_research
    heartbeat_interval: 30m
    
  - name: developer
    role: full_stack_dev
    capabilities:
      - coding
      - testing
      - code_review
    heartbeat_interval: 30m
```

### 启动
```bash
# 启动心跳系统
python src/core/engine.py --start

# 查看状态
python src/core/engine.py --status

# 查看日志
tail -f logs/ai-teams.log
```

## 💡 核心特性

### 1. 主动思考
- 定期分析市场机会
- 自动发现优化点
- 主动提出新想法

### 2. 自主工作
- 自动领取任务
- 持续推进直至完成
- 遇到阻塞主动求助

### 3. 智能协作
- 任务自动分配
- 进度实时同步
- 质量互相保证

### 4. 持续学习
- 记录所有决策
- 总结成功经验
- 避免重复错误

## 📊 使用场景

1. **产品开发** - 从0到1打造产品
2. **自动化运营** - 内容创作、社群管理
3. **技术研究** - 探索新技术、写文档
4. **商业探索** - 市场分析、商业模式设计

## 🔧 技术栈

- **语言**: Python 3.10+
- **AI**: OpenAI API / Claude API
- **存储**: SQLite / PostgreSQL
- **消息**: OpenClaw Integration
- **调度**: APScheduler
- **监控**: Prometheus + Grafana

## 📈 路线图

- [x] Phase 1: 基础架构设计
- [ ] Phase 2: 核心引擎开发
- [ ] Phase 3: Agent实现
- [ ] Phase 4: 协作机制
- [ ] Phase 5: 学习系统
- [ ] Phase 6: 生产部署

## 🤝 贡献

欢迎贡献！请查看 [CONTRIBUTING.md](docs/CONTRIBUTING.md)

## 📄 许可证

MIT License

---

**Created by AI Teams** 🤖
**Date**: 2026-03-05
**Status**: 🟢 Active Development
