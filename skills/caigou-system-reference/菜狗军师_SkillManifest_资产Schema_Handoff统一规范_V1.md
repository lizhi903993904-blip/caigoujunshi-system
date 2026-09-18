# 菜狗军师｜Skill Manifest、资产 Schema 与 Handoff 统一规范 V1

## 0. 这份规范解决什么

目前 19 个 Skill 已经有清晰的方法论和业务边界，但如果没有统一技术接口，会出现四个问题：

1. 每个 Skill 用自己的字段命名，无法稳定互读；
2. 同一类资产被重复创建，形成资产孤岛；
3. Skill 不知道什么时候应该自己处理、什么时候应该交给别的 Skill；
4. 权限无法精确控制，单 Skill 授权和整套系统授权会混在一起。

所以这份文档定义四层统一规范：

> **Skill Manifest**
> +
> **Asset Schema**
> +
> **Handoff Protocol**
> +
> **Permission Model**

目标不是为了“工程感”。

而是为了让：

> **同一份 IP 大脑，能被不同 Skill 稳定调用。**

---

# 一、统一设计原则

## 1. Skill 不保存长期记忆

Skill 是处理器。

长期信息进入：

> Asset Layer。

例如：

选题 Skill 发现了一个新的用户需求，

不应该只留在选题对话里。

应该生成：

> UserInsight Candidate

再写回资产库。

---

## 2. 资产不绑定单一 Skill

一条 UserInsight 可以被：

- 选题
- 定位
- 人设
- 产品
- 销售

共同读取。

资产属于：

> **整个 IP 系统。**

不是属于：

> “产生它的那个 Skill”。

---

## 3. Skill 之间不直接复制能力

如果脚本 Skill 缺 UserInsight：

允许：

> 轻量追问。

不允许：

> 在脚本 Skill 内复制完整用户需求洞察流程。

如果任务明显需要更深判断：

> Handoff。

---

## 4. 上游产物是“优先输入”，不是绝对前置

系统必须支持单 Skill 售卖。

所以：

> 有上游资产 → 直接读取  
> 没有上游资产 → graceful degradation

不能因为用户没买定位 Skill：

> 选题 Skill 就完全不能工作。

---

## 5. 核心高风险更新保留本人确认权

以下资产不能被普通 Skill 自动升级为 Stable / Principle：

- 核心价值观
- Self Model 核心变化
- 原则级 JudgmentRule
- 长期定位
- 核心人设关系
- 重要旧规则废弃

AI 可以提出：

> change proposal。

本人确认以后再写入稳定层。

---

# 二、统一 Skill Manifest

建议所有 Skill 文件顶部统一增加以下 metadata。

```yaml
---
name:
display_name:
version:
status:
system:
layer:
role:
description:

intents:
required_inputs:
optional_inputs:

read_assets:
write_assets:

upstream_skills:
downstream_skills:

fallback_behavior:
handoff_conditions:

permission_level:
sensitive_assets:

output_artifacts:
runtime_requirements:
freshness_requirements:
---
```

---

# 三、Manifest 字段说明

## name

机器唯一 ID。

格式建议：

> caigou-{skill-name}

例如：

> caigou-topic-generation

不可频繁改名。

---

## display_name

用户看到的中文名。

例如：

> 菜狗军师｜选题生成与改造

---

## version

例如：

> 1.0.0

建议遵循：

- Major：方法论发生结构变化
- Minor：增加能力 / 新输出
- Patch：修正表达和小逻辑

---

## status

统一枚举：

- draft
- v1
- stable
- deprecated

---

## system

允许：

- shared
- evolution
- content_creation
- commercialization
- runtime
- training

---

## layer

用于说明技术层级。

例如：

- infrastructure
- cognitive
- production
- feedback
- execution
- runtime
- enablement

---

## role

一句话说明它在整个系统里干什么。

例如：

> “把用户真实材料下钻为需求模型。”

---

## description

用于路由器理解：

- 什么时候调用
- 不处理什么
- 和邻近 Skill 的区别

---

# 四、统一 Intent

Skill 内部不要只靠自然语言猜任务。

每个 Skill 建议定义明确 intents。

例如选题：

```yaml
intents:
  - generate_topic
  - diagnose_topic
  - optimize_topic
  - transform_topic
  - learn_from_topic
```

脚本：

```yaml
intents:
  - create_outline
  - generate_script
  - diagnose_script
  - optimize_script
  - analyze_script
```

用户调研：

```yaml
intents:
  - prepare_interview
  - analyze_interview
  - analyze_comments
  - analyze_purchase_journey
  - synthesize_research
```

这样路由器不会把：

> “帮我看这个选题哪里有问题”

错误理解成：

> “重新生成十个选题”。

---

# 五、Input Contract

## required_inputs

只有缺失就完全无法工作的输入。

应尽量少。

例如脚本：

> Topic / User Intent

不要把：

- PositioningCard
- PersonaCard
- ExpressionProfile

都写成 Required。

否则单独使用会失效。

---

## optional_inputs

有则增强。

例如：

- SelfModel
- UserInsight
- JudgmentRule
- ExpressionProfile
- CaseAsset

---

# 六、Asset Schema 总体结构

所有资产统一使用一个“外壳”。

```yaml
asset_id:
asset_type:
title:

owner_id:
workspace_id:

source:
context:

content:
evidence:

status:
confidence:
version:

relations:
tags:

permissions:
created_at:
updated_at:
last_verified_at:
```

这样不同资产虽然内容不同，

但基础管理逻辑一致。

---

# 七、Asset ID

建议格式：

> `{asset_type}-{date}-{random}`

例如：

> UI-20260918-A3F7

不要依赖标题作为 ID。

标题会改。

ID 不改。

---

# 八、Asset Type 命名体系

建议统一英文机器名 + 中文显示名。

---

## A. Knowledge 类

### KnowledgeAtom

知识原子。

### CaseAsset

案例。

### MarketSignal

市场信号。

### PublicMood

大众情绪候选 / 稳定信号。

---

## B. Cognition 类

### JudgmentCandidate

候选判断。

### JudgmentRule

稳定判断规则。

### Principle

原则级认知。

### CognitiveConflict

认知冲突。

### DecisionRecord

决策记录。

### DecisionErrorPattern

决策错误模式。

---

## C. Self 类

### SelfInsight

自我洞察候选。

### SelfModel

动态自我模型。

### ValueTradeoff

价值取舍。

### MotherTheme

母题。

### InternalTension

稳定矛盾。

---

## D. User 类

### UserResearchEvidence

用户调研证据。

### UserInsight

用户洞察。

### UserLanguageAsset

用户语言。

### NeedHypothesis

需求假设。

### AudienceModel

目标人群模型。

---

## E. Position 类

### PositioningCard

定位。

### PersonaCard

人设。

### PersonaEvidence

人设证据。

---

## F. Content 类

### TopicAsset

选题资产。

### ScriptAsset

脚本资产。

### HookAsset

钩子。

### ViewpointAsset

观点。

### StoryAsset

故事。

### ExpressionAsset

表达资产。

### SeriesAsset

系列资产。

### FailureAsset

失败资产。

---

## G. Expression 类

### ExpressionProfile

表达档案。

### ExpressionPattern

表达规律。

### RegisterRule

场景语域规则。

### NegativeExample

反例。

---

## H. Commercial 类

### ProductHypothesis

产品假设。

### ObjectionAsset

销售异议。

### ProductBoundary

产品边界。

### ConversionInsight

成交洞察。

### PaidTrafficModel

投流模型。

### LiveBaseline

直播基线。

---

# 九、Source Schema

所有资产必须保留来源。

```yaml
source:
  source_type:
  source_ref:
  author:
  speaker:
  timestamp:
  original_excerpt:
```

source_type 示例：

- user_message
- interview
- consultation
- livestream
- published_content
- article
- book
- web
- analytics
- sales_chat
- decision_review

---

# 十、Context Schema

防止资产脱离场景后被错误泛化。

```yaml
context:
  scene:
  channel:
  target_user:
  objective:
  time_period:
  constraints:
```

例如：

> “强判断更有传播力”

如果来自：

> 短视频拉新场景

不能自动推广成：

> 一对一咨询也应该强判断。

---

# 十一、Evidence Schema

```yaml
evidence:
  evidence_count:
  evidence_refs:
  counterexamples:
  evidence_strength:
```

evidence_strength：

- low
- medium
- high

---

# 十二、统一状态机

所有“会进化的认知类资产”优先使用：

> raw → candidate → verified → stable → principle

如果失效：

> deprecated

不是所有资产都需要到 principle。

例如：

- UserLanguage
- CaseAsset
- HookAsset

通常只需要：

> raw / verified / deprecated

---

# 十三、Confidence 和 Status 不一样

Status 回答：

> 被验证到什么阶段。

Confidence 回答：

> 当前系统对它有多大把握。

例如：

一条规则可能：

> stable

但因为环境变化：

> confidence = medium

两个字段不要合并。

---

# 十四、Relations Schema

```yaml
relations:
  - relation_type:
    target_asset_id:
```

relation_type 推荐：

- supports
- contradicts
- refines
- derived_from
- example_of
- applies_to
- tested_by
- replaced_by
- inspired_by
- used_in
- generated_from
- invalidates

---

# 十五、Tag 不代替 Relation

Tag 用于：

> 搜索和聚类。

Relation 用于：

> 明确逻辑关系。

不要都塞进 tag。

---

# 十六、统一 Permission Schema

```yaml
permissions:
  privacy_level:
  shareable:
  readable_by:
  writable_by:
```

privacy_level：

- private
- team
- client_safe
- public

---

# 十七、Permission 的基本原则

## private

只有本人和最高权限 Runtime 可读。

例如：

- 私人决策
- 未公开经历
- 客户隐私
- 财务
- 重要关系

---

## team

内部团队可读。

---

## client_safe

允许在服务客户时使用，

但不一定公开发布。

---

## public

可进入公开内容。

---

# 十八、Skill 权限级别

建议：

## L0｜无用户资产

只能运行通用方法。

---

## L1｜当前任务材料

只能读当前用户主动提供的信息。

---

## L2｜业务资产

可以读：

- Positioning
- UserInsight
- Expression
- ContentAsset

---

## L3｜深层人格资产

可以读：

- SelfModel
- ValueTradeoff
- DecisionRecord
- Private JudgmentRule

---

## L4｜全系统

IP 本人 / 核心 Runtime。

---

# 十九、Write Permission

“能读”不代表“能改”。

例如：

脚本 Skill 可以读：

> SelfModel

但不能：

> 修改 SelfModel。

只有：

- 自我了解
- 经本人确认的认知更新流程

才拥有写权限。

---

# 二十、推荐 Read / Write 权限示例

## 选题 Skill

read：

- UserInsight
- PositioningCard
- JudgmentRule
- MotherTheme
- MarketSignal

write：

- TopicAsset
- JudgmentCandidate（只能 candidate）
- NeedHypothesis（只能 candidate）

不能写：

- SelfModel
- PositioningCard

---

## 脚本 Skill

read：

- TopicAsset
- PersonaCard
- ExpressionProfile
- JudgmentRule
- CaseAsset

write：

- ScriptAsset
- ExpressionPattern candidate
- FailureAsset

---

## 自我了解

read：

- DecisionRecord
- JudgmentRule
- ContentAsset
- PersonaEvidence

write：

- SelfInsight
- SelfModel
- ValueTradeoff
- MotherTheme

高等级更新需要本人确认。

---

# 二十一、Handoff Protocol

每个 Skill 都应该明确：

> **什么时候停止自己处理，交给谁。**

统一 handoff 对象：

```yaml
handoff:
  from_skill:
  to_skill:
  reason:
  payload:
  urgency:
  return_expected:
```

---

# 二十二、Handoff 的四种类型

## 1. Required Handoff

当前 Skill 无法继续。

例如：

脚本任务里用户根本没有选题。

→ Topic Skill

---

## 2. Recommended Handoff

可以继续，但质量会明显下降。

例如：

选题方向成立，但目标用户非常模糊。

→ User Demand Insight

---

## 3. Optional Handoff

属于增强功能。

例如：

一个普通选题也可以不调用舆情。

---

## 4. Feedback Handoff

任务完成后，把新信息回流。

例如：

内容发布后：

→ Content Recycling

---

# 二十三、Graceful Degradation

单 Skill 授权的核心机制。

当缺上游资产时：

### Level A

直接使用现有资产。

### Level B

做轻量追问补足。

### Level C

输出候选结论并标注：

> “未经过完整上游验证。”

### Level D

如果继续会严重误导：

> 建议 Handoff。

---

# 二十四、Handoff Payload

交接时不要把整段聊天扔给下游。

应传标准化 payload。

例如：

```yaml
handoff_payload:
  user_goal:
  current_problem:
  known_facts:
  current_hypothesis:
  unresolved_questions:
  relevant_assets:
  previous_skill_output:
```

这样下游不会重新问一遍。

---

# 二十五、禁止重复询问原则

只要上游已经确认：

- 用户是谁
- 目标是什么
- 当前产品是什么
- 核心需求是什么

下游默认读取。

不要重新问：

> “你的目标用户是谁？”

除非：

> 当前信息冲突或过期。

---

# 二十六、Asset Promotion Protocol

任何 Skill 可以：

> 创建 candidate。

但稳定升级必须由对应资产 Owner Skill 负责。

例如：

### 脚本 Skill

发现一个表达规律：

> ExpressionPattern candidate

交给：

> Expression Skill

判断是否升级。

---

### 内容数据 Skill

发现新用户心理：

> UserInsight candidate

交给：

> User Demand Insight

---

### 决策进步

发现 JudgmentCandidate：

交给：

> Cognitive Evolution

---

# 二十七、Asset Owner

推荐明确资产 Owner。

| Asset | Owner Skill |
|---|---|
| SelfModel | 自我了解 |
| JudgmentRule | 认知进化 |
| DecisionRecord | 决策进步 |
| UserInsight | 用户需求洞察 |
| UserResearchEvidence | 用户调研 |
| PositioningCard | 定位 |
| PersonaCard | 人设 |
| ExpressionProfile | 表达提炼 |
| TopicAsset | 选题 |
| ScriptAsset | 脚本 |
| ContentDiagnosis | 内容数据分析 |
| MarketSignal/PublicMood | 舆情洞察 |
| PaidTrafficModel | 投流 |
| LiveBaseline | 直播运营 |
| ObjectionAsset | 高客单成交优化 |

Owner 不代表独占读取。

只代表：

> 谁负责最终版本。

---

# 二十八、Freshness 机制

某些资产会过期。

建议字段：

```yaml
freshness:
  volatility:
  refresh_policy:
  expires_at:
```

---

## low volatility

例如：

- SelfModel
- 核心价值
- 稳定方法论

长期有效。

---

## medium volatility

例如：

- Positioning
- Persona
- AudienceModel
- ProductBoundary

需要周期复查。

---

## high volatility

例如：

- MarketSignal
- 平台规则
- DOU+ 功能
- 舆情
- 热点
- 价格
- 活动规则

使用时应优先实时验证。

---

# 二十九、Runtime Requirements

Skill Manifest 可以声明：

```yaml
runtime_requirements:
  web_required:
  file_access:
  memory_access:
  database_access:
```

例如：

舆情 Skill：

> web_required: true（当前舆情任务）

投流 Skill：

> current_platform_rules → web_required

自我了解：

> web_required: false

---

# 三十、Output Artifact 统一格式

每个 Skill 应同时提供：

## Human-readable

给用户看。

## Machine-readable

供下游 Skill 调用。

例如：

选题 Skill 输出：

### 用户版

《选题卡》

### 系统版

```yaml
topic_asset:
  topic:
  audience:
  need:
  supply:
  angle:
  evidence:
  status:
```

---

# 三十一、Router 的输入

未来 Router 只需要判断：

- 用户任务是什么
- 当前 intent
- 是否已有上游资产
- 当前权限
- 是否需要实时信息
- 是否存在冲突

然后选择：

> Skill + Intent

---

# 三十二、Router 不负责方法论

Router 只负责：

> 分流。

不要让 Router 本身承担：

- 用户洞察
- 脚本诊断
- 成交判断

否则它又会变成巨型 Agent。

---

# 三十三、典型路由示例一

用户说：

> “我想拍一条为什么越专业越没流量。”

Router：

1. 判断为 Content Creation
2. intent = topic_diagnosis / topic_generation
3. 调用 Topic Skill
4. Topic Skill 读取 UserInsight + JudgmentRule
5. 如果用户需求不清：
   - 轻量追问
   - 或推荐 Handoff → User Demand Insight
6. Topic Card 成立后
7. 用户说“出稿”
8. Handoff → Script Skill

---

# 三十四、典型路由示例二

用户说：

> “最近韩红、某品牌、某博主怎么都被骂？”

Router：

1. 当前事件时效性高
2. 调用 Public Opinion Skill
3. web_required = true
4. 输出 PublicMoodCandidate
5. 用户问“能做什么视频”
6. Handoff → Topic Skill
7. 用户要求写
8. Handoff → Script Skill

---

# 三十五、典型路由示例三

用户说：

> “有个客户咨询完说再考虑一下，两天没回复。”

Router：

1. commercialization
2. intent = diagnose_conversion
3. 调用 High-ticket Conversion Skill
4. 发现需求证据不足
5. 读取 UserResearch / Sales Chat
6. 如果仍不足：
   - 生成轻量追问方向
7. 输出 Follow-up Card
8. 新异议回流：
   - ObjectionAsset candidate
   - UserResearch Evidence

---

# 三十六、典型路由示例四

用户说：

> “这条视频爆了，我以后应该照着什么复制？”

Router：

1. Content Data Analysis
2. 找异常指标和可能原因
3. Content Recycling
4. 拆：
   - TopicAsset
   - HookAsset
   - ViewpointAsset
   - UserLanguage
5. Input Assetization
6. 候选判断进入 Cognitive Evolution

这才算：

> 一条爆款真正进入系统。

---

# 三十七、系统冲突处理

如果两个 Skill 输出冲突：

不要由 Router 直接裁决。

例如：

内容数据说：

> 强冲突有效。

Self Model 说：

> IP 本人长期不愿使用高攻击表达。

这不是谁错。

交给：

> Decision / Positioning / Cognitive Evolution

根据：

- 目标
- 代价
- 价值
- 场景

裁决。

---

# 三十八、版本机制

每个 Skill 和核心 Asset 都需要版本。

Skill 版本和资产版本分开。

例如：

> Topic Skill v2.1

不意味着：

> UserInsight v2.1

---

# 三十九、Deprecated 不删除

过期 Skill / Asset：

保留：

- 为什么废弃
- 替代版本
- 历史使用范围

原因：

> AI 需要知道过去为什么这么判断。

---

# 四十、十九个 Skill Manifest 推荐系统归属

| Skill | system | layer |
|---|---|---|
| 输入资产化 | shared | infrastructure |
| 表达提炼 | shared | infrastructure |
| 认知进化 | evolution | cognitive |
| 决策进步 | evolution | cognitive |
| 自我了解 | evolution | cognitive |
| 用户需求洞察 | evolution | cognitive |
| 选题生成与改造 | content_creation | production |
| 脚本生成与结构设计 | content_creation | production |
| 内容资产回流再造 | content_creation | feedback |
| 定位诊断 | commercialization | strategy |
| 人设诊断与优化 | commercialization | strategy |
| 内容数据分析 | commercialization | feedback |
| 舆情洞察 | commercialization | market_intelligence |
| 投流诊断与放大 | commercialization | distribution |
| 直播运营与复盘 | commercialization | channel_ops |
| 用户调研 | commercialization | research |
| 高客单成交优化 | commercialization | conversion |
| AI 分身搭建与调试 | runtime | runtime |
| 用户思维训练 | training | enablement |

---

# 四十一、下一步技术改造顺序

完成这份规范后，不要一次性重写 19 个 Skill。

建议：

## Phase 1

先改 5 个核心枢纽：

- 输入资产化
- 用户需求洞察
- 选题
- 脚本
- AI 分身

验证 Manifest + Schema 是否好用。

---

## Phase 2

再改：

- 认知进化
- 自我了解
- 定位
- 人设
- 数据分析

---

## Phase 3

最后改：

- 舆情
- 投流
- 直播
- 用户调研
- 成交
- 训练

避免：

> 规范没验证就全量返工。

---

# 四十二、这套技术规范的核心判断

Skill 系统真正难的不是：

> **每一个 Skill 写得多复杂。**

而是：

> **十九个 Skill 能不能共享同一份事实，
> 使用同一套资产，
> 知道自己的边界，
> 知道什么时候交棒，
> 也知道哪些东西自己没有资格修改。**

如果这四件事成立，

系统才从：

> “Prompt 集合”

进入：

> **IP Operating System。**
