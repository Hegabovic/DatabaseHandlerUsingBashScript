source databaseChecker.sh
####################################### INSERT DATA ##############################################
function insertData {
  local sqlStatment_invoice_master="INSERT INTO DB_Bash.invoice_master (Custname,invdate, invtotal) VALUES (\"$1\",\"$2\", $3);"
#  local sqlStatment_invoice_detail="INSERT INTO DB_Bash.invoice_detail (invID, itemname, unitprice, quantity)VALUES (1,'wood',500,22);"

  mysql -u $USER -p$PASS -e "$sqlStatment_invoice_master"
#  mysql -u $USER -p$PASS -e "$sqlStatment_invoice_detail"
  existCodeChecker
}
function insertData_UI {
  echo "enter customer name : "
  read customer_name
  echo "enter invoice date : "
  read invdate
  echo "enter invoice total : "
  read invtotal
  insertData $customer_name $invdate $invtotal

}

####################################### Display Invoices #########################################
function display_Invoices {
  local sqlStatment_invoice_detail="select * from DB_Bash.invoice_detail;"
  local sqlStatment_invoice_master="select * from DB_Bash.invoice_master;"
  mysql -u $USER -p$PASS -e "$sqlStatment_invoice_detail"
  mysql -u $USER -p$PASS -e "$sqlStatment_invoice_master"
  existCodeChecker
}

####################################### Delete Invoices ##########################################
function delete_Invoices {
  local sqlStatment_invoice_detail="DELETE FROM DB_Bash.invoice_master WHERE invID=$1;"
  local sqlStatment_invoice_master="DELETE FROM DB_Bash.invoice_detail WHERE id=$1;"
  mysql -u $USER -p$PASS -e "$sqlStatment_invoice_detail"
  mysql -u $USER -p$PASS -e "$sqlStatment_invoice_master"
  existCodeChecker
}


function delete_Invoices_UI {
  echo "enter ID"
  read id
  delete_Invoices $id
}