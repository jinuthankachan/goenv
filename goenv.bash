mkgoenv(){
    if [ -z "$1" ]; then
        echo "no valid project name entered."
        echo "eg.   mkgoenv project-name"
    else
        echo "Creating project '$1' at '$PWD/'."
        mkdir -p $1
        cd $1
        mkdir -p bin
        mkdir -p pkg
        mkdir -p src
        mkdir -p src/$1
        export GOPATH=$(pwd)
        cd ..
    fi
}

rmgoenv(){
    if [ -z "$1" ]; then
        echo "no valid project name entered."
        echo "eg.   rmgoenv project-name"
    else
        if [ -d "./$1" ]; then
            echo "Deleting project '$1' at '$PWD/'."
            rm -rf $1/
            export GOPATH=""
        else
            echo "project '$1' not found at '$PWD'."
        fi
    fi
}
