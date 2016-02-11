sudo apt-get update
sudo apt-get install -y software-properties-common

sudo add-apt-repository -y ppa:ansible/ansible
sudo apt-get update
sudo apt-get install -y ansible

sudo ansible-playbook -i /usr/local/ansible/inventories/hosts /usr/local/ansible/playbook.yml -e hostname=$1 --connection=local
