source CRUD.sh

function menu() {
    echo -ne "
MAIN MENU
1) Insert Invoices
2) Delete Invoices
3) Display Invoices
4) Exit
Choose an option:  "
    read -r ans
    case $ans in
    1)
        insertData_UI
        menu
        ;;
    2)
        delete_Invoices_UI
        menu
        ;;
    3)
        display_Invoices
        menu
        ;;
    4)
        echo "Bye bye."
        exit 0
        ;;
    *)
        echo "Wrong option."
        exit 1
        ;;
    esac
}