#!/bin/bash

source menu.sh

database_checker
createTables

while [ 1 ]; do
      menu
done
