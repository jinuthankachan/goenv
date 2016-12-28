# goenv
* Different env for each go project.
* Similiar to virtual env for python.
* Commands like virtualenvwrapper.

## How to install
* Download the install file : `curl -o install.bash https://raw.githubusercontent.com/jinut2/goenv/master/install.bash`.
* Run it : `source install.sh`.
* Add this line to your .bashrc or corresponding file : `source ~/.goenv/goenv.bash`.
* Restart your terminal.

## Commands
* `mkgoenv project-name` : creates a go project in the current directory.
* `rmgoenv project-name` : deletes the project.
* `goenv project-name`   : load the project and its env.
* `dropgoenv`            : unset the GOPATH.
