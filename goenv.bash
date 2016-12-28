mkgoenv(){
    if [ -z "$1" ]; then
        echo "no valid project name."
        echo "eg.   mkgoenv project-name"
    else
        if [ -f ~/.goenv/projects/$1 ]; then
            echo "$1 already exists."
        else
            echo "PROJECT_PATH='$PWD/$1'" > ~/.goenv/projects/$1
            echo "Creating project '$1' at '$PWD/'."
            mkdir -p $1 && cd $1
            mkdir -p bin
            mkdir -p pkg
            mkdir -p src
            mkdir -p src/$1
            export GOPATH=$(pwd)
            cd ..
        fi
    fi
}

rmgoenv(){
    if [ -z "$1" ]; then
        echo "no valid project name entered."
        echo "eg.   rmgoenv project-name"
    else
        if [ -f ~/.goenv/projects/$1 ]; then
            source ~/.goenv/projects/$1
            echo "Deleting project '$PROJECT_PATH'"
            rm -rf $PROJECT_PATH/
            rm -f ~/.goenv/projects/$1
            export GOPATH=""
        else
            echo "project '$1' not found."
        fi
    fi
}
