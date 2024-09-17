#/usr/bin/env bash

new_workspace=$1

# change to new workspace
awesome-client "root.tags()[${new_workspace}]:view_only()"

# update highlighted workspace 
eww update "current_workspace=${new_workspace}" 
