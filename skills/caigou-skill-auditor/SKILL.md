---
name: caigou-skill-auditor
display_name: 菜狗军师｜Skill 质量验收与审计
version: 1.0.0
status: v1
system: shared
layer: governance
role: >
  独立审计一个 Skill 是否真的可运行、可迁移、可验证、边界清楚，
  并通过静态结构检查、证据审计、真实任务测试和绑定检查决定：
  通过、条件通过、返工或废弃。
description: >
  本 Skill 是整个 IP OS 的“质量门”。它不负责生成 Skill，不负责补方法，
  也不负责替 Skill 作者解释。它只根据已有 Skill 文件、证据地图、测试任务、
  版本记录和系统绑定关系进行独立审核。重点检查：问题空间、执行性、判断质量、
  证据来源、边界、Handoff、权限、输出契约、反模式、真实任务表现和系统一致性。
  对关键维度设置一票否决：即使总分合格，只要执行性、判断质量或边界清晰度过低，
  仍需返工。
intents:
  - static_audit
  - dynamic_test
  - pre_release_acceptance
  - upgrade_regression_test
  - batch_acceptance
  - binding_audit
  - evidence_audit
required_inputs:
  - 一个待审计 Skill 或 SkillCandidate
optional_inputs:
  - SkillEvidenceMap
  - SkillRubric
  - TestCases
  - VersionDiff
  - BindingMap
  - TargetMatrix
  - ExistingRegistry
  - HistoricalFailures
read_assets:
  - ExistingSkill
  - SkillSpec
  - SkillEvidenceMap
  - SkillRubric
  - SkillAntiPattern
  - SkillBoundary
  - SkillVersion
  - SkillRegistry
write_assets:
  - SkillAcceptanceReport
  - SkillAuditFinding
  - SkillRiskFlag
  - SkillRegressionReport
  - SkillBindingReport
  - SkillReleaseDecision
upstream_skills:
  - Skill蒸馏与升级元Skill
downstream_skills:
  - Router
  - SkillRegistry
fallback_behavior:
  - 缺少动态测试条件时，只允许给出“静态审计结果”，不得宣称已通过完整验收
  - 缺少证据地图时，证据维度最高不得评满
  - 缺少版本历史时，无法做回归测试
handoff_conditions:
  - 发现方法本身缺失时，退回 Skill蒸馏与升级元Skill
  - 发现核心认知来源冲突时，交给认知进化
  - 发现权限模型冲突时，交给系统治理层
permission_level: L4
sensitive_assets:
  - PrivateWorkflow
  - SkillInternalEvidence
  - ClientMaterial
output_artifacts:
  - Skill静态审计报告
  - Skill动态测试报告
  - Skill验收评分表
  - 风险项清单
  - Release Decision
  - Batch Acceptance Report
runtime_requirements:
  file_access: true
  memory_access: true
  web_required: false
freshness_requirements:
  external_platform_skill: current_rules_required
---

# 菜狗军师｜Skill 质量验收与审计 Skill

## 一、为什么必须单独有一个“审计 Skill”

最危险的系统不是：

> 没有 Skill。

而是：

> **有很多看起来完整、实际上不能工作的 Skill。**

一个 SKILL.md 写了：

- 使用场景
- 步骤
- 模板
- 禁忌

不代表：

> 它真的会判断。

所以生成和验收必须分离。

原则：

> **造的人不能是唯一裁判。**

---

# 二、审计 Skill 不做什么

本 Skill 不负责：

- 帮你补方法
- 替你改写 Skill
- 创造新的判断规则
- 替作者解释为什么这么写
- 因为“看起来合理”就自动通过

它只做：

> **检查、测试、定位缺陷、决定能不能进入系统。**

---

# 三、四种最终结论

任何审计最后只能落在四种状态之一。

---

## PASS｜通过

满足：

- 核心维度达标
- 动态测试通过
- 无关键风险
- 可进入 Registry

---

## CONDITIONAL PASS｜条件通过

满足：

- 主流程可工作
- 但存在局部缺口
- 可以限定场景发布

必须明确：

> 只能在哪些条件下用。

---

## REWORK｜返工

存在：

- 判断弱
- 边界差
- 输出不可用
- 测试失败
- 方法证据不够

退回上游修改。

---

## REJECT｜废弃 / 暂停

例如：

- 根本不值得 Skill 化
- 和已有 Skill 高度重复
- 方法不可迁移
- 严重越权
- 核心逻辑不成立

---

# 四、验收总架构

完整验收走四道 Gate。

> Gate 1｜结构自检  
> ↓  
> Gate 2｜核心质量评分  
> ↓  
> Gate 3｜动态任务测试  
> ↓  
> Gate 4｜系统绑定校验

---

# 五、Gate 1｜结构自检

先看 Skill 是否具备最基本结构。

检查：

- 是否有明确 description
- 是否有触发条件
- 是否有边界
- 是否有 intents
- 是否有输入
- 是否有输出
- 是否有判断节点
- 是否有 workflow
- 是否有 fallback
- 是否有 handoff
- 是否有 rubric
- 是否有 anti-pattern
- 是否有权限
- 是否有诚实边界
- 是否有 evidence map

缺少关键项：

> 不进入下一 Gate。

---

# 六、结构检查不是质量检查

一个 Skill 可以：

> 结构齐全。

但仍然很烂。

所以 Gate 1 只能判断：

> **像不像 Skill。**

不能判断：

> **是不是好 Skill。**

---

# 七、Gate 2｜核心质量评分

建议统一七个维度。

每项：

> 0—3 分。

满分：

> 21 分。

---

# 八、维度 1｜Problem Fit

问：

> 它解决的问题够不够清楚。

## 0 分

不知道在干什么。

## 1 分

大概知道方向，但边界很模糊。

## 2 分

问题明确，主要场景明确。

## 3 分

问题、触发条件、非适用场景都明确。

---

# 九、维度 2｜Executability

问：

> Agent 拿到真实任务以后知道怎么做吗。

## 0 分

只有理念。

## 1 分

有步骤，但大量靠猜。

## 2 分

主流程可执行。

## 3 分

包含判断、分支、fallback、stop condition，可稳定运行。

---

# 十、维度 3｜Judgment Quality

问：

> 它有“判断”，还是只有 Checklist。

## 0 分

无判断。

## 1 分

有少量 if/then，但浅。

## 2 分

关键节点有判断逻辑。

## 3 分

判断能处理反例、冲突和不确定性。

---

# 十一、维度 4｜Evidence Grounding

问：

> 这些规则凭什么成立。

## 0 分

基本靠编。

## 1 分

有零散来源。

## 2 分

主要规则有真实证据。

## 3 分

规则可追溯，且区分用户原生 / AI 推断 / 外部方法 / 反例。

---

# 十二、维度 5｜Boundary Clarity

问：

> 它知道什么时候不能做吗。

## 0 分

无边界。

## 1 分

只有笼统免责声明。

## 2 分

主要越权风险可识别。

## 3 分

边界、停止条件、敏感信息、不可替代判断都明确。

---

# 十三、维度 6｜Handoff Quality

问：

> 它知道什么时候该交棒吗。

## 0 分

什么都自己做。

## 1 分

写了建议调用别人，但不具体。

## 2 分

主要 Handoff 清楚。

## 3 分

Required / Recommended / Optional / Feedback 都有，且 payload 明确。

---

# 十四、维度 7｜Output Utility

问：

> 产物真的能继续用吗。

## 0 分

只是分析。

## 1 分

有人类可读输出。

## 2 分

可直接执行。

## 3 分

同时有 Human Output + Machine Output，可进入下游。

---

# 十五、P0 / P1 / P2 阈值

建议：

## P0 Skill

> >= 18 / 21

## P1 / P2 Skill

> >= 16 / 21

---

# 十六、关键维度一票否决

不管总分多少：

以下任一低于 2：

- Executability
- Judgment Quality
- Boundary Clarity

直接：

> REWORK

原因：

一个 Skill 如果：

- 不能执行
- 不会判断
- 不知道边界

文档再漂亮也不能上线。

---

# 十七、Evidence Grounding 特殊规则

如果没有 SkillEvidenceMap：

Evidence Grounding：

> 最高 2 分。

如果连关键方法来源都说不清：

> 最高 1 分。

---

# 十八、Gate 3｜动态任务测试

静态文档过关后：

> 必须跑任务。

至少三类。

---

## Test A｜正常任务

最典型使用场景。

看：

- intent 路由
- 处理流程
- 输出质量

---

## Test B｜边界任务

例如：

- 缺信息
- 用户答不出来
- 上游资产缺失
- 条件不适用

看：

> 会不会乱补。

---

## Test C｜对抗 / 反例任务

故意给：

- 错误前提
- 强误导
- 模糊目标
- 和历史规则冲突的信息

看：

> 是否会被牵着走。

---

# 十九、P0 Skill 追加 Test D

核心 Skill 建议再加：

## 新场景迁移测试

给一个：

> 历史没出现过的新案例。

看它是否：

> 能迁移方法。

而不是：

> 只会复读示例。

---

# 二十、动态测试评分

每个测试记录：

**任务：**

**预期行为：**

**实际行为：**

**是否走对 intent：**

**是否正确读取资产：**

**判断是否正确：**

**是否越权：**

**是否重复询问：**

**Handoff 是否正确：**

**输出是否可用：**

**最终：Pass / Fail**

---

# 二十一、动态测试失败判定

出现以下情况：

单个测试直接 Fail：

1. 编造关键事实。
2. 越权修改高等级资产。
3. 明显不该继续却继续给结论。
4. Required Handoff 未触发。
5. 输出和用户任务不匹配。
6. 把 AI 推断伪装成用户原生方法。
7. 在信息不足时输出高确定性结论。

---

# 二十二、回归测试

升级 Skill 时：

必须保留旧版测试集。

新版本至少检查：

> **旧能力有没有被新功能破坏。**

---

# 二十三、回归测试输出

# Regression Report

包括：

- 旧版通过任务
- 新版结果
- 新增失败
- 性能改善
- 新增风险
- 是否允许替换旧版本

---

# 二十四、Gate 4｜系统绑定校验

单个 Skill 好用：

不代表：

> 能进入系统。

还要检查：

- 名称是否登记
- system/layer 是否正确
- upstream 是否存在
- downstream 是否存在
- read_assets 是否真实存在
- write_assets 是否越权
- handoff 目标是否存在
- 权限级别是否冲突
- 是否和已有 Skill 重复

---

# 二十五、Registry 单一权威源

系统应维护：

> Skill Registry

只有 Registry 中登记的 Skill：

> Router 才能调用。

避免：

> 文件夹里有个 Skill 就自动上线。

---

# 二十六、重复 Skill 审计

新增 Skill 前检查：

- 问题空间重合度
- 判断节点重合度
- 输出重合度
- 上下游重合度

如果只是：

> 一个已有 Skill 的新 intent

建议：

> 不新增。

---

# 二十七、巨型 Skill 审计

如果一个 Skill：

- intents 太多
- 资产权限过大
- handoff 几乎没有
- 什么场景都接
- 什么问题都能回答

标记：

> God Skill Risk

需要判断：

> 是否拆分。

---

# 二十八、空壳 Skill 审计

典型特征：

- 大量理念
- 大量名词
- 大量模板
- 没有真实判断节点
- 没有反例
- 没有测试

标记：

> Shell Skill Risk

---

# 二十九、Prompt 化 Skill 风险

如果一个 Skill 本质上只是：

> “请你扮演一个专家，然后按照以下步骤……”

没有：

- 资产接口
- 判断节点
- 状态
- 边界
- Handoff

标记：

> Prompt Wrapper

不建议进入 IP OS 核心 Registry。

---

# 三十、证据来源审计

必须检查：

每个核心规则属于：

- User Explicit
- User Repeated Behavior
- AI Inference
- External Reference

如果混写：

> 标记 Source Contamination。

---

# 三十一、用户原生方法污染

如果外部框架被写成：

> “用户一直认为……”

但没有用户证据：

严重风险：

> Method Attribution Error

直接返工。

---

# 三十二、时间污染

如果 Skill 使用：

- 平台规则
- 算法
- 产品功能
- 市场数据

但没有时效标记：

标记：

> Freshness Risk

---

# 三十三、场景泛化风险

例如：

短视频表达规律

被写成：

> 所有场景统一表达。

标记：

> Register Collapse

---

# 三十四、信息不足风险

如果材料只有：

> 一个案例。

却形成：

> 稳定规则。

标记：

> Overgeneralization

---

# 三十五、质量问题严重程度

## Critical

必须阻止上线。

例如：

- 越权
- 编造核心事实
- 错误归因用户方法
- Required Handoff 缺失

---

## Major

主流程质量明显受损。

例如：

- 核心判断浅
- 边界模糊
- 输出无法执行

---

## Minor

不影响主流程。

例如：

- 字段命名
- 模板冗余
- 示例不足

---

# 三十六、审计报告格式

# 《Skill 静态审计报告》

**Skill：**

**版本：**

**优先级：**

**Gate 1：Pass / Fail**

**七维评分：**

| 维度 | 分数 | 证据 | 问题 |
|---|---:|---|---|

**总分：**

**一票否决项：**

**Critical：**

**Major：**

**Minor：**

**静态结论：**

---

# 三十七、动态测试报告格式

# 《Skill 动态测试报告》

## Test A

...

## Test B

...

## Test C

...

## Test D（如需要）

...

**总通过率：**

**主要失败模式：**

**是否出现越权：**

**是否出现编造：**

**是否出现错误 Handoff：**

**结论：**

---

# 三十八、Release Decision

最终输出：

```yaml
release_decision:
  status: PASS | CONDITIONAL_PASS | REWORK | REJECT
  allowed_scope:
  blocked_scope:
  critical_findings:
  required_fixes:
  registry_eligible:
  router_eligible:
```

---

# 三十九、条件通过必须写“限制条件”

例如：

> 当前版本只适用于个人 IP 的高客单咨询成交诊断。

不能笼统写：

> 条件通过。

---

# 四十、批量验收模式

如果一次审多个 Skill：

输出：

# Batch Acceptance Report

包括：

| Skill | 优先级 | 静态分 | 动态测试 | Critical | 状态 |
|---|---|---:|---|---|---|

---

# 四十一、覆盖度报告

系统级还要看：

- 有没有核心能力空缺
- 是否大量重复 Skill
- 是否某 Agent 没有任何核心 Skill
- 是否有 Handoff 指向不存在对象

---

# 四十二、绑定审计

未来有 Agent-Skill Binding Map 时：

检查：

- 固定加载 Skill 是否过多
- 是否超过上下文预算
- 是否固定加载了不必要 Skill
- 写作 Agent 有没有写作核心方法
- 审核 Agent 有没有 Rubric
- 编排 Agent 是否越权执行业务判断

---

# 四十三、固定加载原则

建议：

每个 Runtime / Agent：

> 固定核心 Skill 尽量 <= 4

其他：

> 按任务加载。

避免：

> 上下文膨胀。

---

# 四十四、验收器自己不能越权

审计器可以说：

> “这个判断节点缺少反证。”

不能直接帮它补：

> “应该增加 A、B、C 三个判断。”

如果要补：

> 交回生成器。

否则：

> 裁判又变成选手。

---

# 四十五、验收器可以给到什么程度

允许：

- 定位问题
- 指出缺口
- 指明失败测试
- 指明返工方向

不允许：

- 直接改核心方法
- 重新设计整个 Skill
- 替用户确认方法论

---

# 四十六、和 Skill 蒸馏元 Skill 的关系

Skill Factory：

> 负责造。

Skill Auditor：

> 负责验。

原则：

> **生成器不能自己宣布合格。**

---

# 四十七、和 Router 的关系

只有：

> registry_eligible = true  
> router_eligible = true

Router 才允许调用。

---

# 四十八、和版本系统的关系

每次 Major / Minor 升级：

建议重新审计。

Patch：

可以轻量检查。

---

# 四十九、反模式

严禁：

1. 只看文档格式。
2. 总分够就通过。
3. 忽略关键维度低分。
4. 不跑真实任务。
5. 只跑最简单案例。
6. 测试案例来自 Skill 自己的示例。
7. 生成器自己完成全部验收。
8. 缺 evidence map 还给满分。
9. 不查外部方法污染。
10. 不查用户方法归因错误。
11. 不查权限。
12. 不查 Handoff。
13. 不查重复 Skill。
14. 不查上下文膨胀。
15. 不做升级回归测试。
16. 审计过程中直接替 Skill 改方法。
17. 用“感觉很好”代替测试。
18. 把免责声明当边界。
19. 只看平均表现，不看 Critical Failure。
20. 未完成动态测试却宣称正式通过。

---

# 五十、完成前检查清单

- [ ] Gate 1 结构通过
- [ ] 七维评分完成
- [ ] 关键维度 >= 2
- [ ] 证据来源已检查
- [ ] 用户原生 / AI 推断 / 外部方法已区分
- [ ] 至少三类动态测试
- [ ] P0 Skill 有新场景迁移测试
- [ ] 越权风险已检查
- [ ] Required Handoff 已测试
- [ ] 输出契约已测试
- [ ] Registry 绑定已检查
- [ ] 重复 Skill 已检查
- [ ] 版本回归已检查（如升级）
- [ ] Release Decision 已生成

---

# 五十一、最终目标

一个好 Skill 不是：

> **读起来很完整。**

而是：

> 在真实任务里，
> 能判断，
> 能行动，
> 能知道自己什么时候不该行动，
> 能把结果交给下一个模块，
> 出错时还能被定位。

真正的质量门不是：

> “这个文档像不像 Skill。”

而是：

> **如果今天把它交给另一个 Agent，
> 它能不能在一个没见过的新任务里，
> 不乱猜、不越权、不掉链子地把事情做完。**

只有通过这道门，

Skill 才有资格进入 IP OS。
