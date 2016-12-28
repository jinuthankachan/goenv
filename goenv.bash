mkgoenv(){
    if [ -z "$1" ]; then
        echo "no valid project name entered."
        echo "eg.   mkgoenv project-name"
    else
        echo "Creating project '$1' at '$PWD'."
        mkdir -p $1
        cd $1
        mkdir bin
        mkdir pkg
        mkdir src
        mkdir src/$1
        export GOPATH=$(pwd)
    fi
}
