
#initial shell opened                                                                                     
export HISTFILE="$PWD/.dir_bash_history"
#timestamp all history entries                                                                            
export HISTTIMEFORMAT="%h/%d - %H:%M:%S "
export HISTCONTROL=ignoredups:erasedups
export HISTSIZE=1000000
export HISTFILESIZE=1000000
shopt -s histappend ## append, no clearouts                                                               
shopt -s histverify ## edit a recalled history line before executing                                      
shopt -s histreedit ## reedit a history substitution line if it failed                                    
 
## Save the history after each command finishes                                                           
## (and keep any existing PROMPT_COMMAND settings)                                                        
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
