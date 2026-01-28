#!/bin/bash
LOG_FILE="./logs/user_management.log"

function create_user() {
read -p "enter new username: " username
read -p "enter password for $username: " password
sudo useradd -m -s /bin/bash $username
echo "$username:$password" | sudo chpasswd 
echo "$(date): created user $username" >> $LOG_FILE
echo "user $username created successfully!"
}

function delete_user() {
read -p "enter username to delete:" username
sudo userdel -r $username
echo "$(date): deleted user $username" >> $LOG_FILE
echo "user $username deleted successfully"
}

function create_group() {
read -p "enter new group name:" groupname
sudo groupadd $groupname
echo "$(date): created group $groupname" >> $LOG_FILE
echo "group $groupname is created successfully!"
}

function add_user_to_group() {
read -p "enter the username to be added to group:" username
read -p "enter the groupname:" groupname
sudo usermod -aG $groupname $username
echo "$(date): added $username to $groupname" >> $LOG_FILE
echo "user $username is added to group $groupname successfully!"
}

while true; do
echo "1. create_user"
echo "2. delete_user"
echo "3. create_group"
echo "4. add_user_to_group"
echo "5. exit"
read -p "enter your choice:" choice

case $choice in
1) create_user ;;
2) delete_user ;;
3) create_group ;;
4) add_user_to_group ;;
5) exit ;;
*) echo "invalid choice" ;;
esac
done
