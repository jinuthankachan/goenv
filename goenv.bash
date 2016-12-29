lsgoenv(){
    echo "\n >>>> GOENV LIST <<<<"
    ls -1t ~/.goenv/projects/
}

mkgoenv(){
    if [ -z "$1" ]; then
        echo "Add a valid project name."
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
            cd src/$1
        fi
    fi
}

rmgoenv(){
    if [ -z "$1" ]; then
        echo "no valid project name entered."
        echo "eg.   rmgoenv project-name"
        lsgoenv
    else
        if [ -f ~/.goenv/projects/$1 ]; then
            source ~/.goenv/projects/$1
            echo "Deleting project '$PROJECT_PATH'"
            rm -rf $PROJECT_PATH/
            rm -f ~/.goenv/projects/$1
        else
            echo "project '$1' not found."
            lsgoenv
        fi
    fi
}

goenv(){
    if [ -z "$1" ]; then
        echo "Add a valid project name."
        echo "eg.   goenv project-name"
        lsgoenv
    else
        if [ -f ~/.goenv/projects/$1 ]; then
            source ~/.goenv/projects/$1
            echo "Loading project '$PROJECT_PATH'"
            export GOPATH=$PROJECT_PATH/
            cd $GOPATH/
        else
            echo "Project '$1' not found."
            lsgoenv
        fi
    fi
}

dropgoenv(){
    if ! [ -z $GOPATH ]; then
        echo "dropping GOPATH: $GOPATH"
        unset GOPATH
    fi
}

addtogoenv(){
    if [ -z "$1" ] || [ -z "$2" ]; then
        echo "Enter in given format."
        echo "eg.   addtogoenv project-name project-path(GOPATH)"
    else
        echo "Adding project '$2' to goenv."
        echo "PROJECT_PATH='$2'" > ~/.goenv/projects/$1
    fi
}

whichgoenv(){
    if [ -z "$GOPATH" ]; then
        echo "No goenv set."
    else
        echo "GOPATH=$GOPATH"
    fi
}
