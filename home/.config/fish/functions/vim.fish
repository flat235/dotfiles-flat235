function vim --description 'nvim / vim / vi depending on availability'
  if which nvim >> /dev/null
    nvim $argv
  else if which vim >> /dev/null
    vim
  else
    vi
end
