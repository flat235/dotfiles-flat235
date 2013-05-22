[[ -f  ~/.Xresources ]] && xrdb -merge ~/.Xresources
setxkbmap -option terminate:ctrl_alt_bksp
setxkbmap gb
stalonetray&
dropbox&
twmnd&
exec notion
