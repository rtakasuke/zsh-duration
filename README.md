# zsh-duration
Display the command duration.
The display is only when the duration exceeds the threshold.

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
