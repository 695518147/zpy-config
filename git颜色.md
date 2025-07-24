# Git颜色配置说明

## Git全局颜色配置
- **基本颜色**: `color.ui=auto` - 启用自动颜色检测
- **状态颜色**: 
  - 新增文件: 绿色 
  - 修改文件: 蓝色
  - 未跟踪文件: 洋红色
- **分支颜色**:
  - 当前分支: 黄色反转
  - 本地分支: 黄色
  - 远程分支: 绿色
- **差异颜色**:
  - 元信息: 黄色粗体
  - 行号: 洋红色粗体
  - 删除内容: 红色粗体
  - 新增内容: 绿色粗体

## VS Code Git颜色配置
- **文件装饰颜色**: 新增(绿色)、修改(蓝色)、删除(红色)、未跟踪(洋红色)
- **差异编辑器**: 插入和删除行的背景色
- **合并冲突**: 当前更改和传入更改的颜色区分
- **概览标尺**: 在编辑器右侧显示Git状态的颜色指示

## 修改内容
**VS Code Git颜色配置**：
- **修改文件**: 蓝色 `#17a2b8`
- **新增文件**: 绿色 `#28a745`
- **删除文件**: 红色 `#dc3545`
- **未跟踪文件**: 洋红色 `#ff00ff` (magenta)

**Git全局配置**：
- **修改文件**: 蓝色 (`color.status.changed=blue`)
- **新增文件**: 绿色
- **未跟踪文件**: 洋红色 (`color.status.untracked=magenta`)

## 现在的颜色区分
- **警告**: 黄色（VS Code默认）
- **Git修改文件**: 蓝色
- **Git新增文件**: 绿色
- **Git删除文件**: 红色
- **Git未跟踪文件**: 洋红色 

这些配置使VS Code能够与Git的通用颜色标准保持一致，提供更好的视觉体验。重启VS Code后，您就能看到新的Git颜色配置生效了。


```
  "workbench.colorCustomizations": {
    "[Default Dark Modern]": {
      "tab.activeBorderTop": "#00FF00",
      "tab.unfocusedActiveBorderTop": "#00FF0088",
      "textCodeBlock.background": "#00000055"
    },
    "editor.wordHighlightStrongBorder": "#FF6347",
    "editor.wordHighlightBorder": "#FFD700",
    "editor.selectionHighlightBorder": "#A9A9A9",
    // Git 文件状态颜色（按文档规范配置）
    "gitDecoration.modifiedResourceForeground": "#17a2b8",          // 修改文件 - 蓝色
    "gitDecoration.deletedResourceForeground": "#dc3545",           // 删除的文件 - 红色 
    "gitDecoration.untrackedResourceForeground": "#ff00ff",         // 未跟踪文件 - 洋红色 (magenta)
    "gitDecoration.addedResourceForeground": "#28a745",             // 新增已跟踪文件 - 绿色
    "gitDecoration.renamedResourceForeground": "#17a2b8",           // 重命名文件 - 蓝色
    "gitDecoration.stageModifiedResourceForeground": "#28a745",     // 已暂存修改 - 绿色
    "gitDecoration.stageDeletedResourceForeground": "#28a745",      // 已暂存删除 - 绿色
    "gitDecoration.ignoredResourceForeground": "#6c757d",           // 忽略文件 - 灰色
    "gitDecoration.conflictingResourceForeground": "#dc3545",       // 冲突文件 - 红色
    "gitDecoration.submoduleResourceForeground": "#9876AA",         // 子模块 - 紫色
    
    // Git diff 编辑器颜色配置
    "diffEditor.insertedTextBackground": "#28a74520",               // 新增内容背景 - 淡绿色
    "diffEditor.removedTextBackground": "#dc354520",                // 删除内容背景 - 淡红色
    "diffEditor.insertedLineBackground": "#28a74510",               // 新增行背景
    "diffEditor.removedLineBackground": "#dc354510",                // 删除行背景
    
    // Git merge 冲突颜色配置
    "merge.currentHeaderBackground": "#17a2b8",                     // 当前更改标题背景 - 蓝色
    "merge.currentContentBackground": "#17a2b820",                  // 当前更改内容背景 - 淡蓝色
    "merge.incomingHeaderBackground": "#28a745",                    // 传入更改标题背景 - 绿色
    "merge.incomingContentBackground": "#28a74520",                 // 传入更改内容背景 - 淡绿色
    "merge.border": "#6c757d",                                      // 合并边框 - 灰色
    
    // Git 概览标尺颜色
    "editorOverviewRuler.addedForeground": "#28a745",               // 新增内容 - 绿色
    "editorOverviewRuler.modifiedForeground": "#17a2b8",            // 修改内容 - 蓝色
    "editorOverviewRuler.deletedForeground": "#dc3545"              // 删除内容 - 红色
  },
```