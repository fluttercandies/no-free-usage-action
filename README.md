# NO-FREE-USAGE action
![GitHub release (latest by date)](https://img.shields.io/github/v/release/fluttercandies/no-free-usage-action?logo=github)

Language: English | [中文简体](README-ZH.md)

A NO-FREE-USAGE action for github. (Only worked with github action.)

# TL;DR
Sometimes you don't want some own the permission to file an issue on your repository, especially when you are being volunteered by this person to do a free bang job for him/her.
It's wasting time if you always close them manually. So here we provide an action to detect whether the user starred or forked or both done, then close & lock the issue if they don't.

![image](https://tva1.sinaimg.cn/large/007S8ZIlgy1gii1f98s2jj30lt07jgmv.jpg)

# How to use it?
* Create a yml file, such as *checker.yml*, under `.github/workflow/` directory.
* Waiting for someone to file an issue.

## Simple usage
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

## Parameters list
| Name       | Description                                    | Required | Default value               | Supported value             |
| ---------- | ---------------------------------------------- | -------- | --------------------------- | --------------------------- |
| token      | GitHub token for issue handling authorization. | true     | *************************** | ${{ secrets.GITHUB_TOKEN }} |
| forked     | Whether required user forked the repository.   | false    | -f                          | -f / --no-forked            |
| starred    | Whether required user starred the repository.  | false    | -s                          | -s / --no-starred           |
| event_path | Event original file path for github workflow.  | false    | *************************** | /github/workflow/event.json |
| words      | Reply content when closing. (Can be Markdown)  | false    | Please file the issue after you starred and forked the repo. Thanks! 🙂 | Any strings |