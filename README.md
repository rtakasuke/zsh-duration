![Lint](https://github.com/rtakasuke/docker-duration/workflows/Lint/badge.svg)

# zsh-duration
Zsh plugin for displays command duration when exceeds threshold.

<img width="170" alt="capt" src="https://user-images.githubusercontent.com/1833985/95013194-abea4a80-0679-11eb-9710-14fd29d5fec3.png">


## Installation
#### Using zplug
If you use [zplug](https://github.com/zplug/zplug), add the following to your `.zshrc`:
```
zplug "rtakasuke/zsh-duration"
```

#### Manual installation
```
git clone https://github.com/rtakasuke/zsh-duration.git
source ./zsh-duration/duration.plugin.zsh
```

## Configuration
You can change the display threshold with environment variables.
(Default: 10 seconds)
```
export ZSH_DURATION_THRESHOLD=10
```
