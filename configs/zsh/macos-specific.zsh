# macOS specific
if [[ $OSTYPE != darwin* ]]; then; return; fi

alias python=python3

#export JAVA_8_HOME=$(/usr/libexec/java_home -v1.8)
#export JAVA_11_HOME=$(/usr/libexec/java_home -v11)

#alias java8='export JAVA_HOME=$JAVA_8_HOME'
#alias java11='export JAVA_HOME=$JAVA_11_HOME'

podman machine list --format "{{range .}}{{.Name}}\t{{.VMType}}\t{{.LastUp}}\n{{end -}}" | rg running
