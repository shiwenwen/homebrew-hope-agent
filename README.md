# homebrew-hope-agent

Homebrew tap for [**Hope Agent**](https://github.com/shiwenwen/hope-agent) · Hope Agent 的 Homebrew tap。

## Install · 安装

```bash
brew tap shiwenwen/hope-agent
brew install --cask hope-agent
```

> Already have `Hope Agent.app` installed manually? Append `--adopt` (take over the existing same-version app without re-downloading) or `--force` (overwrite).
>
> 已经手动装过 `Hope Agent.app`？在 `brew install` 后面加 `--adopt`（接管同版本现有应用不重新下载）或 `--force`（强制重下覆盖）。

After install · 装完后：

- **Desktop GUI** · 桌面 GUI: Launchpad / Applications folder (click the icon), or `open -a "Hope Agent"`
- **Headless server** · 后台服务: `hope-agent server start`
- **ACP** (IDE integration · IDE 集成): `hope-agent acp`

Apple Silicon only; Intel Macs run under Rosetta 2. · 当前仅 Apple Silicon 构建，Intel Mac 走 Rosetta 2 自动兼容。

## Links · 链接

- Main repo · 主仓库: https://github.com/shiwenwen/hope-agent
- Releases: https://github.com/shiwenwen/hope-agent/releases
- Issues: https://github.com/shiwenwen/hope-agent/issues

## Note · 说明

`Casks/hope-agent.rb` is **auto-generated** by CI from the main repo's template ([`homebrew/hope-agent.rb.tmpl`](https://github.com/shiwenwen/hope-agent/blob/main/homebrew/hope-agent.rb.tmpl)). Please file bugs or formula tweaks against [shiwenwen/hope-agent](https://github.com/shiwenwen/hope-agent), not here.

`Casks/hope-agent.rb` 由主仓 CI 自动从模板渲染生成。Bug 反馈或 formula 调整请去主仓 [shiwenwen/hope-agent](https://github.com/shiwenwen/hope-agent) 提，不要直接改这里。
