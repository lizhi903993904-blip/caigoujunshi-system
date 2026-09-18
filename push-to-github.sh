#!/bin/bash
set -e

# ============================================================
#  菜狗军师 IP 系统 → GitHub 一键发布脚本
#  用法: bash push-to-github.sh
# ============================================================

REPO_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_NAME="caigou-skills"
REPO_DESC="菜狗军师 IP 系统 — 20 个 Agent Skill，覆盖个人 IP 全生命周期：输入资产化、IP 进化、定位人设、选题脚本、投流放大、直播复盘、高客单成交"

echo "=========================================="
echo "  菜狗军师 IP 系统 → GitHub 发布"
echo "=========================================="
echo ""

# 1. 检查 git
if ! command -v git &>/dev/null; then
    echo "[!] git 未安装。请先安装 Xcode Command Line Tools："
    echo "    xcode-select --install"
    echo "    安装完成后重新运行本脚本。"
    exit 1
fi

# 2. 检查 gh CLI
GH_AVAILABLE=false
if command -v gh &>/dev/null; then
    GH_AVAILABLE=true
fi

# 3. 配置 git（如果还没配置）
if [ -z "$(git config --global user.name)" ]; then
    echo "[*] 需要配置 git 用户信息"
    read -p "    你的 GitHub 用户名: " GH_USER
    read -p "    你的邮箱: " GH_EMAIL
    git config --global user.name "$GH_USER"
    git config --global user.email "$GH_EMAIL"
fi

# 4. 初始化仓库
cd "$REPO_DIR"
if [ ! -d ".git" ]; then
    echo "[1/5] 初始化 git 仓库..."
    git init
    git branch -M main
else
    echo "[1/5] git 仓库已存在，跳过初始化"
fi

# 5. 添加文件并提交
echo "[2/5] 添加文件..."
git add -A
git commit -m "feat: 菜狗军师 IP 系统 V1 — 20 个 Agent Skill 完整开源

系统架构：
- 编排层：自我蒸馏总控
- 元能力层：Skill 蒸馏器、质量审计
- 资产层：输入资产化、内容资产回流
- IP进化层：自我了解、认知进化、决策进步
- 用户层：需求洞察、用户调研、思维训练
- 定位人设层：定位诊断、人设诊断
- 内容层：选题生成、脚本设计
- 商业闭环层：投流诊断、直播复盘、高客单成交、舆情洞察
- AI分身层：AI 分身搭建" || echo "    (无新改动，跳过提交)"

# 6. 创建 GitHub 仓库并推送
echo ""
if [ "$GH_AVAILABLE" = true ]; then
    echo "[3/5] 检查 gh 登录状态..."
    if ! gh auth status &>/dev/null; then
        echo "    需要登录 GitHub。正在打开浏览器..."
        gh auth login -w
    fi

    echo "[4/5] 创建 GitHub 仓库..."
    if gh repo view "$REPO_NAME" &>/dev/null 2>&1; then
        echo "    仓库已存在，直接推送"
    else
        gh repo create "$REPO_NAME" --public --description "$REPO_DESC" --source=. --remote=origin
    fi

    echo "[5/5] 推送到 GitHub..."
    git remote remove origin 2>/dev/null || true
    gh repo set-default "$REPO_NAME"
    git remote add origin "https://github.com/$(gh api user --jq .login)/$REPO_NAME.git"
    git push -u origin main

    echo ""
    echo "=========================================="
    echo "  发布成功!"
    echo "  仓库地址: https://github.com/$(gh api user --jq .login)/$REPO_NAME"
    echo "=========================================="
else
    echo "[!] gh CLI 未安装。请手动操作："
    echo ""
    echo "    方式 A — 安装 gh CLI（推荐）："
    echo "      curl -fsSL https://cli.github.com/packages/githubcli-archive-keyword.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg"
    echo "      echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main' | sudo tee /etc/apt/sources.list.d/github-cli.list"
    echo "      (macOS: brew install gh)"
    echo "      gh auth login"
    echo "      bash push-to-github.sh"
    echo ""
    echo "    方式 B — 手动创建仓库："
    echo "      1. 打开 https://github.com/new"
    echo "      2. 仓库名: $REPO_NAME"
    echo "      3. 描述: $REPO_DESC"
    echo "      4. 选择 Public，不要勾选任何初始化选项"
    echo "      5. 创建后运行以下命令："
    echo ""
    GH_USER=$(git config --global user.name)
    echo "         git remote add origin https://github.com/${GH_USER:-YOUR_USERNAME}/$REPO_NAME.git"
    echo "         git branch -M main"
    echo "         git push -u origin main"
    echo "=========================================="
fi
