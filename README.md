[unmaintained]

# goenv
* Different env for each go project.
* Similiar to virtual env for python.
* Commands like virtualenvwrapper.

## How to install
* Download the install file : `curl -o install.sh https://raw.githubusercontent.com/jinut2/goenv/master/install.sh`.
* Run it : `source install.sh`.
* Add this line to your .bashrc or corresponding file : `source ~/.goenv/goenv.bash`.
* Restart your terminal.

## Commands
* `mkgoenv project-name`                 : creates a go project with goenv in the current directory.
* `rmgoenv project-name`                 : deletes the project goenv.
* `goenv project-name`                   : loads the project goenv.
* `dropgoenv`                            : deactivate/exit the goenv.
* `lsgoenv`                              : list existing goenvs.
* `addtogoenv project-name project-path` : add existing project to goenv.
* `whichgoenv`                           : displays the current goenv.
* `opengoenv`                            : open the goenv project src in the preferred editor.

### Note
* `echo $EDITOR` to see the default editor, if preferred editor is not specified.
* The project-name would be the goenv name.
* Include the whole path while `addtogoenv` for project-path. eg. ~/some/test-project/
