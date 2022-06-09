# ansible-demos
ansible demos
- 执行命令
```bash
# 安装
ansible-playbook -i inventory.ini install_docker.yml -e ansible_python_interpreter=/usr/bin/python3
# 检查安装
ansible-playbook -i inventory.ini check_docker.yml -e ansible_python_interpreter=/usr/bin/python3
```