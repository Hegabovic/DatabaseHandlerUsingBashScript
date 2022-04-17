#########################################################
############ exit code
###               0 success
###               10 can not connect to database

USER=hegabovic
PASS=password
DB=DB_Bash

####################################### Exist Code Checker ##############################################
function existCodeChecker {
  if [ $? -ne 0 ]; then
    return 10
  fi
  return 0
}

####################################### Database Checker ##############################################

function database_checker {
  local dbs="create database if not exists ${DB};"
  mysql -u $USER -p$PASS -e "$dbs"
  existCodeChecker
}

function createTables {
  local createTable="create table if not exists DB_Bash.invoice_master
                     (
                         invID    int primary key auto_increment,
                         Custname varchar(100),
                         invdate  date,
                         invtotal float
                     );
                     create table if not exists DB_Bash.invoice_detail
                     (

                         id        int primary key auto_increment,
                         invID     int,
                         itemname  varchar(50),
                         unitprice int,
                         quantity  int,
                         FOREIGN KEY (invID) REFERENCES invoice_master (invID)
                     );"
  mysql -u $USER -p$PASS -e "$createTable"
  existCodeChecker
}







