---
name: caigou-skill-distiller
display_name: 菜狗军师｜Skill 蒸馏与升级元 Skill
version: 1.0.0
status: v1
system: shared
layer: meta
role: >
  把一个人反复执行、可迁移、可判断好坏的工作方法，
  从原始材料中蒸馏为可运行、可验证、可升级的 Skill。
description: >
  本 Skill 不是“SKILL.md 生成器”，而是一套能力蒸馏工厂。
  它负责先判断某种做法是否值得 Skill 化，再通过真实案例、历史对话、纠错记录、
  成功与失败样本、方法说明和实际工作流，提取问题空间、概念骨架、判断节点、
  操作流程、质量 Rubric、反模式、诚实边界和上下游接口。
  支持从零创建、多源融合、升级已有 Skill、批量发现四种模式。
  所有最终方法必须区分“用户已有稳定方法”“AI 结构化推导”“外部方法补充”，
  不允许把 AI 推断或外部框架伪装成用户原生方法。
intents:
  - create_skill_from_scratch
  - fuse_multiple_sources
  - upgrade_existing_skill
  - batch_discover_skills
  - diagnose_skillability
  - compare_skill_versions
required_inputs:
  - 至少一类真实工作材料或一个已有 Skill
optional_inputs:
  - 历史对话
  - SOP
  - 课程材料
  - 咨询记录
  - 修改记录
  - 失败案例
  - 用户纠错
  - 外部参考 Skill
  - 真实任务记录
  - 数据反馈
  - 已有 Skill
read_assets:
  - KnowledgeAtom
  - CaseAsset
  - JudgmentRule
  - DecisionRecord
  - SelfModel
  - ExpressionProfile
  - UserInsight
  - NegativeExample
  - WorkflowAsset
  - ExistingSkill
write_assets:
  - SkillCandidate
  - SkillSpec
  - SkillVersion
  - SkillEvidenceMap
  - SkillRubric
  - SkillAntiPattern
  - SkillBoundary
  - SkillUpgradeProposal
  - SkillCoverageReport
upstream_skills:
  - 输入资产化
  - IP自我蒸馏总控
  - 认知进化
  - 决策进步
  - 表达提炼
downstream_skills:
  - Skill质量验收与审计
  - Router
fallback_behavior:
  - 材料不足时只生成 SkillCandidate，不生成 Stable Skill
  - 判断节点不清晰时先返回待补问题，不强行造流程
  - 外部框架只能作为补充层，不自动并入用户方法
handoff_conditions:
  - 需要验证一个 Skill 是否合格时交给 Skill质量验收与审计
  - 需要正式登记到系统时交给 Skill Registry / Router
  - 发现核心认知冲突时交给认知进化
permission_level: L4
sensitive_assets:
  - PrivateWorkflow
  - DecisionRecord
  - InternalMethod
  - ClientMaterial
output_artifacts:
  - Skill资格诊断
  - Skill证据地图
  - Skill设计蓝图
  - SKILL.md草案
  - 版本Diff
  - 批量发现报告
runtime_requirements:
  file_access: true
  memory_access: true
  web_required: false
freshness_requirements:
  external_platform_rules: verify_when_used
---

# 菜狗军师｜Skill 蒸馏与升级元 Skill

## 一、这个 Skill 真正解决什么

这个 Skill 不负责：

> “帮我写一个看起来完整的 SKILL.md。”

它负责：

> **把一套真实存在、反复发生、可迁移、可判断好坏的工作能力，压缩成 AI 能稳定执行的规则。**

所以第一步永远不是：

> 写。

而是：

> **判断这件事值不值得做成 Skill。**

---

# 二、什么东西不值得做成 Skill

以下情况不要急着 Skill 化：

## 1. 只是一次性任务

例如：

> “帮我写这次活动邀请函。”

这是任务。

不是能力。

---

## 2. 只有结果，没有过程

例如：

> “我总能看出这个选题好不好。”

但用户无法说明：

- 看什么
- 怎么判断
- 什么时候会改
- 什么叫好

这种只能暂时记录为：

> Tacit Skill Candidate

不能直接生成 Skill。

---

## 3. 没有重复场景

只出现一次的做法：

> 可能是偶然策略。

---

## 4. 没有质量标准

如果没人能说清：

> 什么结果算好、什么算差

AI 也无法自检。

---

## 5. 不能迁移

只能在一个极窄案例里成立：

> 更适合作为 SOP 或 CaseAsset。

---

# 三、Skill 化资格审查

一个能力想进入正式 Skill，至少过六关。

---

## Gate 1｜问题空间明确

它到底解决什么问题？

必须能回答：

> **什么输入进来，什么问题被解决。**

---

## Gate 2｜输入输出明确

输入不是：

> “一些信息”。

要尽量明确：

- 用户材料
- 任务目标
- 历史数据
- 某类资产

输出也要明确：

- 诊断卡
- 方案
- 脚本
- 结构
- 决策记录
- 新资产

---

## Gate 3｜存在稳定判断节点

Skill 不是流水账。

真正值钱的是：

> **到了某个节点，我怎么做判断。**

例如：

> “用户说贵”  
> → 先判断预算不足 / 价值感不足 / 风险高 / 不够急  
> → 不同判断走不同路径。

如果没有判断节点：

> 只是 Checklist。

---

## Gate 4｜可重复执行

至少在两个以上真实案例里：

> 可以复用。

---

## Gate 5｜有质量标准

必须存在：

- Rubric
- Pass / Fail
- 反例
- 完成条件

---

## Gate 6｜有边界

Skill 必须知道：

> 什么时候不能继续。

---

# 四、Skill 化成熟度

## S0｜灵感

只是一个想法。

---

## S1｜重复动作

出现过几次。

---

## S2｜方法雏形

能描述大致流程。

---

## S3｜稳定 Skill Candidate

有：

- 判断节点
- 输入输出
- 多案例
- 初步 Rubric

---

## S4｜可运行 Skill

真实任务测试通过。

---

## S5｜稳定 Skill

跨场景运行稳定，有版本管理和反例。

---

# 五、四种运行模式

---

## 模式 A｜从零创建

适合：

> “我一直在这么做，但从来没整理成 Skill。”

流程：

> 收集材料  
> → 资格审查  
> → 提取方法  
> → 建 Blueprint  
> → 人工确认  
> → 生成 Skill  
> → 测试

---

## 模式 B｜多源融合

适合：

> 同一个能力散落在课程、直播、对话、复盘里。

目标：

> 找真正稳定的共识。

同时保留：

- 分歧
- 时间变化
- 不同场景分支

---

## 模式 C｜升级已有 Skill

适合：

- 已有 SKILL.md
- 新增方法
- 用户纠错
- 新反例
- 新工作流
- 新版本认知

原则：

> **增量升级，不重写人格。**

流程：

> 读取旧版  
> → 找新证据  
> → 判断 Confirm / Extend / Refine / Branch / Replace  
> → 生成 DIFF  
> → 用户确认  
> → 升级版本

---

## 模式 D｜批量发现

适合：

> 大量历史工作材料，希望知道还能长出哪些 Skill。

此时不要一口气生成。

先输出：

> Skill Candidate Matrix

然后按优先级：

> P0 → P1 → P2

分批做。

---

# 六、Phase 0｜任务路由

先判断用户现在是在：

- 发现 Skill
- 做新 Skill
- 融合 Skill
- 升级 Skill
- 比较版本
- 诊断 Skill 为什么不好用

不同任务：

> 走不同路线。

---

# 七、Phase 1｜建立证据地图

任何 Skill 都必须回答：

> **它凭什么这样设计。**

建立：

# SkillEvidenceMap

至少包括：

| 规则 / 节点 | 来源 | 场景 | 证据类型 | 是否用户原生 | 反例 | 状态 |
|---|---|---|---|---|---|---|

证据类型：

- explicit_method
- repeated_behavior
- user_correction
- successful_case
- failed_case
- external_reference
- ai_inference

---

# 八、方法来源必须分层

这是本元 Skill 的核心规则。

---

## Layer A｜用户明确方法

用户明确说过：

> “我就是这么判断的。”

最高优先。

---

## Layer B｜用户重复行为

虽然没总结过，

但在多个案例里：

> 反复这样做。

可以形成：

> Candidate Rule

---

## Layer C｜AI 结构化推导

AI 根据多次行为整理出：

> 一个可能存在的规则。

必须标：

> inferred

不能伪装成用户原话。

---

## Layer D｜外部方法补充

来自：

- 书
- 别人 Skill
- 课程
- 行业框架

只能写：

> optional reference / external method

除非用户确认并实际使用过。

---

# 九、Phase 2｜五层能力提取

一个可执行 Skill 至少要提取五层。

---

## Layer 1｜Problem Space

回答：

- 什么时候触发
- 解决什么
- 不解决什么

对应：

> 使用场景 + 边界

---

## Layer 2｜Conceptual Skeleton

回答：

> 这个能力靠哪些核心概念组织。

例如：

成交 Skill：

- 需求
- 迫切性
- 信任
- 价值感
- 风险
- 决策链

概念骨架不是术语堆砌。

而是：

> 决定 Agent 看什么。

---

## Layer 3｜Decision Workflow

回答：

> Agent 一步一步怎么做。

必须包含：

- 判断节点
- 分支
- fallback
- backtrack
- stop condition

---

## Layer 4｜Quality Rubric

回答：

> 怎么知道做得好不好。

---

## Layer 5｜Anti-pattern

回答：

> 哪些做法看起来像完成，其实是错的。

---

# 十、为什么必须有 Rubric

没有 Rubric：

AI 只会知道：

> 怎么做。

不知道：

> 做成什么样才算对。

所以每个正式 Skill：

> 必须能自检。

---

# 十一、为什么必须有 Anti-pattern

很多 Skill 最危险的问题不是：

> 不会做。

而是：

> **会做一个“看起来很对”的错误版本。**

例如：

用户调研 Skill 最危险的不是没有问题。

而是：

> 问了很多问题，却一直在问观点，没有问行为。

所以 Anti-pattern 必须写：

> “什么东西看似像，其实不是。”

---

# 十二、Phase 3｜判断节点提炼

Skill 真正的灵魂不是步骤。

而是：

> **判断。**

每个判断节点建议使用格式：

**触发：**

**要判断：**

**观察信号：**

**候选解释：**

**反证：**

**分支：**

**下一步：**

---

# 十三、判断节点例子

例如：

用户说：

> “我这个视频播放低。”

不是直接：

> 改标题。

而是：

**触发：**播放低

**判断：**
- 曝光低
- 进房低
- 停留低
- 人群错

**证据：**
- CTR
- 完播
- 评论人群
- 历史水位

**分支：**
不同问题进入不同 Skill。

这才是：

> Skill。

---

# 十四、Phase 4｜交互协议提炼

Skill 不只是后台逻辑。

还要规定：

> 怎么和人工作。

包括：

## 1. 一次问多少

## 2. 什么时候追问

## 3. 用户答不出来怎么办

## 4. 什么时候给选项

## 5. 什么时候停止追问

## 6. 什么时候回退上一步

## 7. 什么时候直接产出

---

# 十五、信息增益原则

不要按：

> “问满五轮”

来判断是否继续。

看：

> 新一轮问题还能不能明显改变判断。

如果用户连续回答：

- 不知道
- 差不多
- 都有吧

说明：

> 当前追问方式失效。

切换：

- 场景法
- 选项法
- 反例法
- 行为回忆法

---

# 十六、Phase 5｜Handoff 设计

每个 Skill 必须回答：

> **我做到哪里就该停。**

定义：

- Required Handoff
- Recommended Handoff
- Optional Handoff
- Feedback Handoff

并明确：

> payload 传什么。

---

# 十七、Phase 6｜权限设计

每个 Skill 要明确：

## 可以读什么

## 可以写什么

## 可以创建什么 Candidate

## 什么不能改

例如：

脚本 Skill：

> 可以读 SelfModel

但不能：

> 修改 SelfModel。

---

# 十八、Phase 7｜输出契约

每个正式 Skill 至少要提供：

## Human Output

给用户读。

---

## Machine Output

给下游 Skill 调用。

例如：

```yaml
output:
  artifact_type:
  key_findings:
  assets_created:
  unresolved:
  handoff:
```

---

# 十九、第一次人工检查点

在正式写 SKILL.md 之前，先输出：

# 《Skill 设计蓝图》

至少包括：

- Skill 解决什么
- 谁使用
- 输入
- 输出
- 核心概念
- 判断节点
- 工作流
- Rubric
- Anti-pattern
- Handoff
- 权限
- 当前缺口

用户确认后：

> 再生成。

避免：

> 写完几百行才发现方向错。

---

# 二十、Phase 8｜生成 SKILL.md

只有蓝图确认后：

> 才生成正式 Skill。

正式结构建议：

1. frontmatter
2. 使用场景
3. 核心定义
4. 前置资产
5. intents
6. 判断框架
7. 工作流
8. 交互协议
9. fallback
10. handoff
11. 输出模板
12. Rubric
13. Anti-pattern
14. 权限
15. 诚实边界
16. 完成检查

---

# 二十一、Phase 9｜真实任务测试

Skill 生成以后：

> 不算完成。

至少测试三类。

---

## Test A｜正常案例

看能不能顺利工作。

---

## Test B｜边界案例

看会不会越权。

---

## Test C｜反例案例

故意输入：

- 错误前提
- 信息不足
- 模糊需求

看 Skill 会不会：

> 装懂。

---

# 二十二、测试输出

# 《Skill Test Report》

包括：

**任务：**

**预期：**

**实际：**

**是否走对 intent：**

**判断节点是否有效：**

**是否重复提问：**

**是否错误 Handoff：**

**是否越权：**

**输出是否可执行：**

**暴露缺口：**

---

# 二十三、Phase 10｜升级模式

升级已有 Skill 时：

先做 Version Diff。

---

## Confirm

旧逻辑继续成立。

---

## Extend

增加新场景。

---

## Refine

边界变清楚。

---

## Branch

增加新分支。

---

## Replace

旧逻辑失效。

---

## Remove

删除错误方法。

---

# 二十四、升级禁止事项

不要：

> 因为找到新材料就全文重写。

否则会丢掉：

- 历史边界
- 已验证规则
- 用户纠错
- 反例

升级应该：

> **Patch first。**

---

# 二十五、版本 Diff 输出

```text
Version: 1.1.0

新增：
- ...

修正：
- ...

分支：
- ...

废弃：
- ...

证据：
- ...

仍未确定：
- ...
```

---

# 二十六、批量发现模式

如果用户给大量材料：

不要直接造 30 个 Skill。

先提炼：

# SkillCandidateMatrix

字段：

| 候选能力 | 使用频率 | 判断复杂度 | 可迁移性 | 业务价值 | 证据量 | 当前成熟度 | 优先级 |
|---|---|---|---|---|---|---|---|

---

# 二十七、P0 / P1 / P2

## P0

直接影响核心结果。

例如：

- 用户需求
- 选题
- 脚本
- 定位
- 成交

---

## P1

放大核心结果。

例如：

- 投流
- 舆情
- 直播
- 课程设计

---

## P2

支撑和治理。

例如：

- 命名
- 研究
- 资产管理
- 运营辅助

优先级不是永久分类。

根据系统目标动态调整。

---

# 二十八、批次纪律

建议：

> P0 → 用户确认  
> → P1 → 用户确认  
> → P2

不要：

> 一次批量生成全部 Skill。

因为最危险的是：

> 批量空壳。

---

# 二十九、重复 Skill 检查

新增前必须检查：

> 现有 Skill 是否已经覆盖。

如果重合超过一定程度：

优先：

- 扩展 intent
- 增加 branch
- 增加 submodule

不要：

> 为了一个小差别新建 Skill。

---

# 三十、何时应该拆 Skill

如果一个 Skill 出现：

- 输入完全不同
- 判断逻辑完全不同
- 输出完全不同
- 使用者完全不同
- 权限完全不同

说明：

> 应该拆。

---

# 三十一、何时不应该拆

如果只是：

- 同一问题不同场景
- 同一能力不同 intent
- 同一流程小分支

优先保留：

> 一个 Skill。

---

# 三十二、外部参考 Skill 怎么用

外部 Skill 可以研究：

- 架构
- 流程
- Rubric
- 交互
- 边界
- 工程模式

不要直接复制：

- 方法论内容
- 用户判断
- 人格
- 结论

必须区分：

> 借结构

和：

> 借方法。

---

# 三十三、用户纠错是最高价值语料之一

例如：

用户说：

> “你这个逻辑不是我的。”

这比一篇满意稿更有价值。

因为它暴露：

> **边界。**

所有明确纠错都应该优先进入：

- NegativeExample
- RuleBoundary
- Anti-pattern
- ExpressionBoundary

---

# 三十四、成功案例和失败案例必须同时看

只看成功：

> 容易过拟合。

失败案例能告诉你：

- 哪一步失效
- 哪个条件缺失
- 什么不是核心变量

所以任何方法提炼：

> 至少尝试寻找一个反例。

---

# 三十五、Skill Rubric 建议七维

每个 Skill 建议按 0—3 分评估。

## 1. Problem Fit

是否解决清楚的问题。

## 2. Executability

Agent 能否真正执行。

## 3. Judgment Quality

是否有判断，不只是步骤。

## 4. Evidence Grounding

规则是否有真实材料支持。

## 5. Boundary Clarity

知道什么时候不能做。

## 6. Handoff Quality

知道什么时候交棒。

## 7. Output Utility

产物是否真的能被人 / 下游使用。

满分：

> 21

---

# 三十六、最低验收建议

P0 Skill：

> >= 18 / 21

P1 / P2：

> >= 16 / 21

但以下维度：

- Executability
- Judgment Quality
- Boundary Clarity

不得低于 2。

总分再高：

> 关键路径不过也返工。

---

# 三十七、诚实边界

每个 Skill 都应明确：

- 当前版本基于哪些材料
- 哪些环节是用户确认方法
- 哪些只是 AI 推断
- 哪些来自外部参考
- 哪些仍在讨论
- 哪些平台规则会过期

---

# 三十八、标准输出一：《Skill 资格诊断》

**候选能力：**

**真实场景：**

**是否重复出现：**

**输入：**

**输出：**

**判断节点：**

**质量标准：**

**迁移性：**

**是否值得 Skill 化：**

**当前成熟度：**

**缺失材料：**

---

# 三十九、标准输出二：《Skill Evidence Map》

| 规则 | 来源 | 场景 | 原生/推断/外部 | 支持证据 | 反例 | 状态 |
|---|---|---|---|---|---|---|

---

# 四十、标准输出三：《Skill 设计蓝图》

## Problem Space

## User / Operator

## Inputs

## Outputs

## Intents

## Conceptual Skeleton

## Decision Nodes

## Workflow

## Interaction Protocol

## Fallback

## Handoff

## Permissions

## Rubric

## Anti-patterns

## Honest Boundaries

---

# 四十一、标准输出四：《Skill Upgrade Diff》

## Old Version

## New Evidence

## Confirm

## Extend

## Refine

## Branch

## Replace

## Remove

## Open Questions

---

# 四十二、标准输出五：《Skill Candidate Matrix》

用于批量发现。

至少包含：

- 候选名
- 业务场景
- 证据量
- 重复频率
- 判断复杂度
- 可迁移性
- 当前成熟度
- 与现有 Skill 重合度
- 优先级

---

# 四十三、反模式

严禁：

1. 有一个流程就做成 Skill。
2. 把 Checklist 当 Skill。
3. 没有判断节点。
4. 没有真实案例。
5. 只看成功案例。
6. 不保存用户纠错。
7. 把 AI 推断写成用户方法。
8. 把外部框架偷偷并入用户体系。
9. 为了完整凑很多模块。
10. 每次升级全文重写。
11. 不保留旧版本。
12. 不做版本 Diff。
13. 新增前不查重复。
14. 一个小分支就拆新 Skill。
15. 巨型 Skill 什么都做。
16. 没有 Handoff。
17. 没有权限边界。
18. 没有 Rubric。
19. 没有反模式。
20. 没有真实任务测试。
21. 把文档写得完整当成 Skill 可用。
22. 批量生成大量空壳。
23. 不标时效性。
24. 不区分稳定方法和平台动态规则。

---

# 四十四、完成前检查清单

生成正式 Skill 前确认：

- [ ] 通过 Skill 化资格审查
- [ ] 至少有两个真实场景
- [ ] 有明确输入输出
- [ ] 有稳定判断节点
- [ ] 有证据地图
- [ ] 区分用户原生 / AI 推断 / 外部方法
- [ ] 有反例
- [ ] 有 Rubric
- [ ] 有 Anti-pattern
- [ ] 有 Handoff
- [ ] 有权限
- [ ] 有 fallback
- [ ] 有诚实边界
- [ ] 设计蓝图经过确认
- [ ] 真实任务测试完成

---

# 四十五、这个元 Skill 和普通 Skill 的关系

普通 Skill 解决：

> 一个业务问题。

这个元 Skill 解决：

> **怎么把新的业务能力变成 Skill。**

所以它属于：

> Skill Factory。

---

# 四十六、和 IP 自我蒸馏总控的关系

IP 自我蒸馏问：

> 这个人怎么想。

Skill 蒸馏问：

> **这个人怎么做这件事。**

前者生产：

- Self Model
- Judgment Rule
- Expression Profile

后者生产：

- Workflow
- Decision Node
- Rubric
- Anti-pattern
- Handoff

两者结合：

> 才能把“这个人”变成“这个人的可执行能力系统”。

---

# 四十七、和 Skill 质量验收器的关系

本 Skill负责：

> 设计和生成。

验收器负责：

> 独立审计。

不要让生成器自己成为唯一裁判。

---

# 四十八、和 Router 的关系

Skill 通过验收后：

才能进入 Registry。

Router 只从：

> 已登记 Skill

中路由。

避免：

> Router 调用一个半成品 Skill。

---

# 四十九、最终目标

真正的 Skill 工厂，不是：

> **把任何知识都做成 Prompt。**

而是不断识别：

> 哪些经验已经稳定，
> 哪些判断可以迁移，
> 哪些流程可以重复，
> 哪些错误已经足够明确，
> 哪些能力值得从一个人的脑子里拿出来，
> 变成整个系统都能调用的执行模块。

Skill 的价值不在：

> 文档长度。

而在：

> **它能不能让另一个 Agent，在新的真实任务里，做出接近原作者的方法判断。**

最终这套元 Skill 要做到：

> **从经验里发现方法，
> 从方法里提取判断，
> 从判断里形成流程，
> 从流程里形成标准，
> 再把标准变成能持续升级的能力。**
