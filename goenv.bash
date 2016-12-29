lsgoenv(){
    echo "\n >>>> GOENV LIST <<<<"
    ls -1t ~/.goenv/projects/
}

__seteditor(){
    echo "Enter your preferred editor:"
    read editor
    if ! [ -z "$editor" ]; then
        echo "\n EDITOR='$editor'" >> ~/.goenv/projects/$1
    fi
}

mkgoenv(){
    if [ -z "$1" ]; then
        echo "Enter a valid project name ."
        echo "eg.   mkgoenv project-name"
    else
        if [ -f ~/.goenv/projects/$1 ]; then
            source ~/.goenv/projects/$1
            echo "Project $1 exists at '$PROJECT_PATH'."
        else
            echo "PROJECT_PATH='$PWD/$1'" > ~/.goenv/projects/$1
            echo "Creating project '$1' at '$PWD/'."
            mkdir $1
            mkdir $1/bin
            mkdir $1/pkg
            mkdir $1/src
            mkdir $1/src/$1
            touch $1/src/$1/main.go
            export GOENV="$1"
            export GOPATH="$PWD/$GOENV"
            __seteditor $1
            if ! [ -z "$editor" ]; then
                cd $1/src/$1
                $editor .
            fi
        fi
    fi
}

rmgoenv(){
    if [ -z "$1" ]; then
        echo "Enter a valid project name."
        echo "eg.   rmgoenv project-name"
        lsgoenv
    else
        if [ -f ~/.goenv/projects/$1 ]; then
            source ~/.goenv/projects/$1
            echo "Do you wish to delete project files from drive [y/n]? (n)"
            read yn
            case $yn in
                [Yy] )
                    source ~/.goenv/projects/$1
                    echo "Deleting project '$PROJECT_PATH'."
                    rm -rf $PROJECT_PATH/
                    ;;
                * ) echo "Removing goenv '$1'."
                    echo "Project files still at '$PROJECT_PATH'."
                    ;;
            esac
            rm -f ~/.goenv/projects/$1
            if [ $1=$GOENV ]; then
                unset GOENV
                unset GOPATH
            fi
        else
            echo "'$1' not found."
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
            echo "Activating goenv for '$PROJECT_PATH'"
            export GOENV=$1
            export GOPATH=$PROJECT_PATH/
        else
            echo "'$1' not found."
            lsgoenv
        fi
    fi
}

dropgoenv(){
    if ! [ -z $GOENV ]; then
        echo "Dropping GOENV: '$GOENV'"
        unset GOENV
        unset GOPATH
    fi
}

addtogoenv(){
    if [ -z "$1" ] || [ -z "$2" ]; then
        echo "Enter in given format."
        echo "eg.   addtogoenv project-name project-path(GOPATH)"
    else
        if [ -f ~/.goenv/projects/$1 ]; then
            source ~/.goenv/projects/$1
            echo "goenv '$1' exists."
            echo "Project exists at '$PROJECT_PATH'."
        else
            echo "Adding project '$2' to goenv '$1'."
            echo "PROJECT_PATH='$2'" > ~/.goenv/projects/$1
            __seteditor $1
        fi
    fi
}

whichgoenv(){
    if [ -z "$GOENV" ]; then
        echo "No goenv set."
    else
        echo "GOENV: $GOENV"
        echo "GOPATH: $GOPATH"
    fi
}

opengoenv(){
    goenv $1
    if ! [ -z "$1" ]; then
        cd $GOPATH/src/$1
        if ! [ -z $EDITOR ]; then
            $EDITOR .
        fi
    fi
}
