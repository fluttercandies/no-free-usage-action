# 禁 止 白 嫖 action
![GitHub release (latest by date)](https://img.shields.io/github/v/release/fluttercandies/no-free-usage-action?label=%E5%8F%91%E8%A1%8C%E7%89%88%E6%9C%AC&logo=github)

语言: [English](README.md) | 中文简体

一个禁止白嫖的 GitHub Action。 (只能配合 GitHub Action 使用。)

# 简介
有些时候你会不想给予某些人给你开 issue 的权利，尤其当TA在白嫖你时更为如此。
如果你总是需要手动操作进行关闭，那简直是在浪费时间。
所以我们突发奇想，做了一个通过检查是否 star 或 fork 的 action，
将白嫖怪拒之门外。

![image](https://tva1.sinaimg.cn/large/007S8ZIlgy1gii1f98s2jj30lt07jgmv.jpg)

# 如何使用？
* 在 `.github/workflow/` 目录下创建一个例如 `checker.yml` 的文件。
* 蹲一个白嫖怪。

## 简单用法
```yaml
on:
  issues:
    types: [opened, reopened]

jobs:
  build:

    runs-on: ubuntu-latest
    
    steps:
    - uses: actions/checkout@v2
    - name: Check issue actor
      uses: fluttercandies/no-free-usage-action@v1.0.1
      with:
        token: ${{ secrets.GITHUB_TOKEN }}
```

## 参数列表
| 名字        | 描述                                           | 必需     | 默认值                       | 支持的值                     |
| ---------- | ---------------------------------------------- | -------- | --------------------------- | --------------------------- |
| token      | 用于 issue 操作鉴权的 GitHub token。             | true     | ${{ secrets.GITHUB_TOKEN }} | *************************** |
| forked     | 操作者是否已经 fork 了仓库。                      | false    | -f                          | -f / --no-forked            |
| starred    | 操作者是否已经 star 了仓库。                      | false    | -s                          | -s / --no-starred           |
| event_path | GitHub 工作流的原始文件。                        | false    | /github/workflow/event.json | *************************** |
| words      | 关闭 issue 时，发送的文字内容。（可以是 Markdown） | false    | Please file the issue after you starred and forked the repo. Thanks! 🙂 | 任意字符 |