# 菜狗军师 IP 系统 | 20 个 Agent Skill 开源仓库

> 一套完整的个人 IP（知识型创作者 / 知识付费 / 顾问型业务）全生命周期 Skill 系统，覆盖从输入资产化、IP 自我蒸馏、定位人设、选题脚本、投流放大、直播复盘到高客单成交的完整闭环。

## 这是什么

这不是一堆"提示词模板"。这是一套有架构、有边界、有资产层、有 Handoff 协议的可运行 Skill 系统。

每个 Skill 是一个独立处理器，解决 IP 生命周期中一个具体环节的问题。所有 Skill 共享同一套资产底座和方法论基座，通过统一的 Handoff 规范互相协作。

## 系统架构

```
外部世界 / 用户 / 自己
        ↓
  输入资产化（原料→候选→已验证→稳定资产/废弃）
        ↓
  IP 进化系统 ←→ 内容创作系统 ←→ 商业闭环系统
        ↓
  能力训练层（把判断方法变成可复用的肌肉记忆）
        ↓
  AI 分身层（把已验证的资产组装成可执行的 AI 配置）
```

## Skill 清单

### 编排层
| Skill | 目录 | 用途 |
|---|---|---|
| IP 自我蒸馏总控 | `caigou-self-distillation-orchestrator` | 多源材料收集→分流→跨场景验证→写回共享资产层 |

### 元能力层
| Skill | 目录 | 用途 |
|---|---|---|
| Skill 蒸馏与升级元 | `caigou-skill-distiller` | 从反复执行的工作方法中蒸馏可运行 Skill |
| Skill 质量验收与审计 | `caigou-skill-auditor` | 独立审计 Skill 是否可运行、可迁移、边界清楚 |

### 资产层
| Skill | 目录 | 用途 |
|---|---|---|
| 输入资产化 | `caigou-input-assetization` | 把原始输入转化为结构化可复用资产 |
| 内容资产回流再造 | `caigou-content-asset-recycling` | 把已发布内容+数据+反馈拆解为可复用资产 |

### IP 进化层
| Skill | 目录 | 用途 |
|---|---|---|
| 自我了解 | `caigou-self-understanding` | 从行为和决策中建立动态 Self Model |
| 认知进化 | `caigou-cognitive-evolution` | 处理新知识/反馈进入后判断是否改变现有认知 |
| 决策进步 | `caigou-decision-improvement` | 把关键决策复盘为可复用的判断规则 |

### 用户层
| Skill | 目录 | 用途 |
|---|---|---|
| 用户需求洞察 | `caigou-user-demand-insight` | 从表面表达还原真实需求（纵向追问+人性四锚点） |
| 用户调研 V1 | `caigou-user-research-v1` | 通过访谈、评论、行为数据理解用户处境 |
| 用户思维训练 | `caigou-user-thinking-trainer` | 训练创作者从"我想讲什么"切换到"用户为什么在意" |

### 定位人设层
| Skill | 目录 | 用途 |
|---|---|---|
| 定位诊断 | `caigou-positioning-diagnosis` | 从产品/自我/人群三入口推导可验证的定位方向 |
| 人设诊断与优化 | `caigou-persona-diagnosis` | 判断创作者适合什么用户关系和身份姿态 |

### 内容层
| Skill | 目录 | 用途 |
|---|---|---|
| 选题生成与改造 | `caigou-topic-strategist` | 从模糊话题逼近"真需求+能供给+话题"成立的选题 |
| 脚本生成与结构设计 | `caigou-script-strategist` | 把成立的选题转化为可拍摄的短视频脚本 |

### 商业闭环层
| Skill | 目录 | 用途 |
|---|---|---|
| 投流诊断与放大 | `caigou-paid-traffic-diagnosis` | 诊断 DOU+/内容加热/精准人群投放 |
| 直播运营与复盘 | `caigou-live-ops-review` | 知识型/IP 型直播策划、辅助、复盘 |
| 高客单成交优化 V1 | `caigou-high-ticket-conversion-v1` | 诊断高客单知识服务的成交问题 |
| 舆情洞察 | `caigou-public-opinion-insight` | 从热点事件簇识别群体心理变化和内容机会 |

### AI 分身层
| Skill | 目录 | 用途 |
|---|---|---|
| AI 分身搭建与调试 | `caigou-ai-clone-building` | 把已验证资产组装成可执行的 AI 分身配置 |

### 参考文档
| 目录 | 内容 |
|---|---|
| `caigou-system-reference` | IP 系统总架构与路由说明、资产 Schema 与 Handoff 统一规范 |

## 安装方式

### 方式一：WorkBuddy AI（原生支持）

```bash
# 把 skills 目录下的所有文件夹复制到 WorkBuddy AI 的用户级 skills 目录
cp -R skills/caigou-* ~/.workbuddy-ai/skills/
```

重启 WorkBuddy AI 会话后，所有 Skill 自动出现在 Skill 列表中。

### 方式二：Claude Code / Codex / 通用 Agents

这些 Skill 的文件格式为标准 Markdown + YAML frontmatter，兼容主流 Agent 平台。把对应目录放入你的 Agent skills 路径即可。

### 方式三：直接使用

每个 `SKILL.md` 都是独立可读的方法论文档。即使不安装到任何平台，也可以直接阅读使用其中的方法论和判断框架。

## 核心方法论

这套系统不是凭空写的，每个 Skill 内置了经过验证的方法论：

- **三维分析法**：从用户主观痛感出发，追踪情绪背后欲望与恐惧，再匹配内容价值
- **纵向追问**：不问"你想要什么"，而是沿情绪对象与最坏后果继续追问
- **人性四锚点**：恐惧、欲望、认同、控制感——识别用户行为的底层驱动
- **场景显现**：把抽象痛点变成具体可感知的场景
- **母题**：识别创作者反复回到的核心问题
- **数据心理侧写**：从行为数据反推心理状态
- **动态引导协议**：根据回答质量自主切换方法、回退、跳步或停止

## 目录结构

```
caigou-skills/
├── README.md                 ← 你正在看的文件
├── LICENSE                   ← MIT 开源协议
├── .gitignore
└── skills/
    ├── caigou-ai-clone-building/
    │   └── SKILL.md
    ├── caigou-cognitive-evolution/
    │   └── SKILL.md
    ├── ...（共 20 个 Skill 目录）
    └── caigou-system-reference/
        ├── 菜狗军师_IP系统总架构与19个Skill路由说明_V1.md
        └── 菜狗军师_SkillManifest_资产Schema_Handoff统一规范_V1.md
```

## 许可证

MIT License — 你可以自由使用、修改、分发和商业使用，只需保留原始许可证声明。

## 贡献

欢迎提交 Issue 和 PR。如果你在实际使用中发现某个 Skill 的边界需要调整、方法需要补充、或有新的场景需要覆盖，请开 Issue 讨论。
