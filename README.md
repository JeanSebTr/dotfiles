# My config files of all kinds

```bash
git clone git://github.com/JeanSebTr/dotfiles.git ~/.dotfiles
```

## Using bash config

Link ~/.bash_profile to ~/.dotfiles/.bash_profile
```bash
ln -s ~/.dotfiles/.bash_profile ~/.bash_profile
```

It will load all scripts from ~/.dotfiles/bash_config/ in alphabetical order.
A good idea is to use numbers at the beginning of files' names.

### on-directory-change.sh

Allow to run bash's functions before and after changing directory (cd)

To register a before hookt :
```bash
export BEFORE_DIRECTORY_CHANGE="$BEFORE_DIRECTORY_CHANGE _function_name"
```

To register an after hookt :
```bash
export AFTER_DIRECTORY_CHANGE="$AFTER_DIRECTORY_CHANGE _function_name"
```


## TODO
* take time to organise my dotfiles...
* this README
* do unit tests ?! :)
* more serious TODOs

## TODO seriously
* Add initial OSX settings
* Add SSH config
* Add softwares settings
* Add project name + relative path in Prompt
* http://superuser.com/questions/585713/disable-horizontal-gestures-in-vlc-on-os-x
* ...
