# ansible-demos
ansible demos
- 执行命令
```bash
# 准备工作: 本地安装docker环境, 并下载所需资源
ansible-playbook --ask-sudo-pass local_prepare.yml
# 目标机安装docker
ansible-playbook -i inventory.ini install_docker.yml -e ansible_python_interpreter=/usr/bin/python3
# 检查/安装(所有)
ansible-playbook -i inventory.ini check_all.yml -e ansible_python_interpreter=/usr/bin/python3
# 检查/安装(carrier模块对应的机器)
ansible-playbook -i inventory.ini check_carrier.yml -e ansible_python_interpreter=/usr/bin/python3
# 检查/安装(ice_via模块对应的机器)
ansible-playbook -i inventory.ini check_ice_via.yml -e ansible_python_interpreter=/usr/bin/python3
```

## 问题
- 安装报错

    1.如果"Install aptitude using apt"出现W:GPG error: http://mirrors.aliyun.com/docker-ce/linux/ubuntu bionic InRelease之类的错误，请检查目标机器的镜像源是否有问题，镜像源文件路径：/etc/apt/
   
   2.卸载docker不干净
    ```bash
    sudo apt-get autoremove -y docker docker-ce docker-engine docker.io  containerd runc && sudo apt-get purge -y docker-ce && which docker-compose | sudo xargs rm -rf && sudo rm -rf /var/lib/docker && sudo apt-get autoremove -y docker-ce-* && sudo rm -rf /etc/systemd/system/docker.service.d
    ```
    