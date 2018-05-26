# dotfiles

My configuration files.

## Example Usage:

```bash
#stow -d <platform> -t <target> <package 1> [package 2]...[package n]
stow -d All -t ~ bash X11 vim
stow -d Desktop -t ~ X11 i3 polybar
```

If you `stow redshift` make sure to edit [redshift.conf](redshift/.config/redshift.conf) to suit your needs!
