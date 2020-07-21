#!/bin/bash
if [ ! -f $HOME/.bash_profile ]; then
  touch $HOME/.bash_profile
  /bin/chmod 0700 $HOME/.bash_profile
  /usr/sbin/chown $USER $HOME/.bash_profile
  if [ -f $HOME/.profile ]; then
    if [ ! -n "$(/usr/bin/grep '. ~/.profile' $HOME/.bash_profile)" ]; then
      echo '[ -r ~/.profile ] && . ~/.profile' >> $HOME/.bash_profile
    fi
  fi
fi
if [ ! -n "$(/usr/bin/grep '^export PATH="@PREFIX@/bin:@PREFIX@/sbin:' $HOME/.bash_profile)" ]; then
  echo 'export PATH="@PREFIX@/bin:@PREFIX@/sbin:$PATH"' >> $HOME/.bash_profile
fi
if [ ! -f $HOME/.zshenv ]; then
  touch $HOME/.zshenv
  /bin/chmod 0700 $HOME/.zshenv
  /usr/sbin/chown $USER $HOME/.zshenv
fi
if [ ! -n "$(/usr/bin/grep '^export PATH="@PREFIX@/bin:@PREFIX@/sbin:' $HOME/.zshenv)" ]; then
  echo 'export PATH="@PREFIX@/bin:@PREFIX@/sbin:$PATH"' >> $HOME/.zshenv
fi
exit 0
