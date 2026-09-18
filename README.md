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

---

# 使用指南

任何人都可以免费使用这套 Skill，不需要联系作者，不需要下载额外的压缩包。以下是从零开始的操作步骤。

## 第一步：获取文件

你有两种方式，选其一即可。

### 方式 A：直接下载 ZIP（不需要安装任何工具）

1. 打开仓库页面：https://github.com/lizhi903993904-blip/caigoujunshi-system
2. 点击绿色的 **Code** 按钮
3. 选择 **Download ZIP**
4. 下载后解压到任意位置（比如桌面）

### 方式 B：用 git 克隆（如果你已装 git）

```bash
git clone https://github.com/lizhi903993904-blip/caigoujunshi-system.git
```

两种方式获取的文件完全一样，包含 20 个 Skill 目录 + 参考文档。

---

## 第二步：安装到你的 AI 工具

根据你使用的 AI 工具，选择对应的安装方式。所有方式的原理相同：把 `skills/` 下的 `caigou-*` 文件夹复制到对应工具的 skills 目录。

### WorkBuddy AI（Mac）

```bash
# 1. 确保 skills 目录存在
mkdir -p ~/.workbuddy-ai/skills

# 2. 复制所有 caigou 技能（cd 到你解压/克隆的目录）
cp -R skills/caigou-* ~/.workbuddy-ai/skills/

# 3. 重启 WorkBuddy AI 会话
```

安装后，在 WorkBuddy AI 对话中输入相关关键词（如"选题""用户需求""定位"），对应 Skill 会自动加载。也可以在左侧"专家"面板浏览所有已安装的 Skill。

### WorkBuddy AI（Windows）

```powershell
# 1. 确保 skills 目录存在
mkdir -Force "$env:USERPROFILE\.workbuddy-ai\skills"

# 2. 复制所有 caigou 技能（cd 到你解压/克隆的目录）
Copy-Item -Path "skills\caigou-*" -Destination "$env:USERPROFILE\.workbuddy-ai\skills\" -Recurse

# 3. 重启 WorkBuddy AI 会话
```

### Trae（字节跳动，Mac）

```bash
# 1. 确保 skills 目录存在
mkdir -p ~/.agents/skills

# 2. 复制所有 caigou 技能
cp -R skills/caigou-* ~/.agents/skills/

# 3. 重启 Trae
```

### Trae（Windows）

```powershell
mkdir -Force "$env:USERPROFILE\.agents\skills"
Copy-Item -Path "skills\caigou-*" -Destination "$env:USERPROFILE\.agents\skills\" -Recurse
```

### 豆包 Mac App

豆包 Mac App 与 Trae 共用同一个 skills 目录：

```bash
# Mac
mkdir -p ~/.agents/skills
cp -R skills/caigou-* ~/.agents/skills/
```

```powershell
# Windows
mkdir -Force "$env:USERPROFILE\.agents\skills"
Copy-Item -Path "skills\caigou-*" -Destination "$env:USERPROFILE\.agents\skills\" -Recurse
```

安装后重启豆包 Mac App 即可生效。

### Claude Code

```bash
# Mac
mkdir -p ~/.claude/skills
cp -R skills/caigou-* ~/.claude/skills/
```

```powershell
# Windows
mkdir -Force "$env:USERPROFILE\.claude\skills"
Copy-Item -Path "skills\caigou-*" -Destination "$env:USERPROFILE\.claude\skills\" -Recurse
```

### Codex

```bash
# Mac
mkdir -p ~/.codex/skills
cp -R skills/caigou-* ~/.codex/skills/
```

```powershell
# Windows
mkdir -Force "$env:USERPROFILE\.codex\skills"
Copy-Item -Path "skills\caigou-*" -Destination "$env:USERPROFILE\.codex\skills\" -Recurse
```

### 不想装到任何平台？

每个 `SKILL.md` 都是独立可读的方法论文档。直接在 GitHub 上点开任意一个 Skill 文件，就能阅读其中的方法论、判断框架和反模式清单。当作参考手册用也完全有价值。

---

## 第三步：验证安装

安装后重启你的 AI 工具，然后尝试以下任一方式验证：

| 平台 | 验证方式 |
|---|---|
| WorkBuddy AI | 在对话中输入"帮我做选题"或"分析用户需求"，对应 Skill 应自动加载 |
| Trae / 豆包 | 在 Agent 设置或技能管理页面看到 `caigou-` 开头的技能 |
| Claude Code | 在对话中输入 `/skills` 查看已安装技能列表 |
| Codex | 在技能管理界面查看 |

如果没有出现，检查：
1. 文件夹是否复制到了正确的路径（注意 `~` 代表用户主目录）
2. `caigou-` 开头的文件夹里是否都有 `SKILL.md` 文件
3. 是否重启了 AI 工具

---

## 只安装部分 Skill

如果你不需要全部 20 个 Skill，可以只复制你需要的。每个 Skill 都是独立的，不依赖其他 Skill 即可运行。

```bash
# 例如只安装选题和脚本两个 Skill
cp -R skills/caigou-topic-strategist skills/caigou-script-strategist ~/.workbuddy-ai/skills/
```

---

## 常见问题

**Q: 需要联网吗？**
A: 安装后使用时不需要联网。Skill 是本地文件，AI 工具读取后直接在本地运行。

**Q: 会不会影响我已经安装的其他 Skill？**
A: 不会。每个 Skill 在独立目录中，互不干扰。

**Q: 可以修改 Skill 内容吗？**
A: 可以。MIT 协议允许自由修改。直接编辑对应的 `SKILL.md` 文件即可。

**Q: 支持 Windows 吗？**
A: 支持。上述指南已包含 Windows (PowerShell) 命令。Skill 文件本身是 Markdown 格式，跨平台通用。

**Q: 更新了怎么办？**
A: 重新下载仓库（或 git pull），然后重新执行复制命令即可覆盖更新。

---

## 核心方法论

这套系统不是凭空写的，每个 Skill 内置了经过验证的方法论：

- **三维分析法**：从用户主观痛感出发，追踪情绪背后欲望与恐惧，再匹配内容价值
- **纵向追问**：不问"你想要什么"，而是沿情绪对象与最坏后果继续追问
- **人性四锚点**：恐惧、欲望、认同、控制感——识别用户行为的底层驱动
- **场景显现**：把抽象痛点变成具体可感知的场景
- **母题**：识别创作者反复回到的核心问题
- **数据心理侧写**：从行为数据反推心理状态
- **动态引导协议**：根据回答质量自主切换方法、回退、跳步或停止

---

## 目录结构

```
caigoujunshi-system/
├── README.md                 ← 你正在看的文件
├── LICENSE                   ← MIT 开源协议
├── .gitignore
├── skills/
│   ├── caigou-ai-clone-building/
│   │   └── SKILL.md
│   ├── caigou-cognitive-evolution/
│   │   └── SKILL.md
│   ├── ...（共 20 个 Skill 目录）
│   └── caigou-system-reference/
│       ├── 菜狗军师_IP系统总架构与19个Skill路由说明_V1.md
│       └── 菜狗军师_SkillManifest_资产Schema_Handoff统一规范_V1.md
```

---

## 许可证

MIT License — 你可以自由使用、修改、分发和商业使用，只需保留原始许可证声明。

## 贡献

欢迎提交 Issue 和 PR。如果你在实际使用中发现某个 Skill 的边界需要调整、方法需要补充、或有新的场景需要覆盖，请开 Issue 讨论。
