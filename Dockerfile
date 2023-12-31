# 底包
FROM ubuntu:latest
# 更新软件源
RUN     apt update -y                                                                   				&& \
        apt upgrade -y                                                                  				&& \
        apt install -y --no-install-recommends openssh-server 	                                                        && \   
        apt install -y --no-install-recommends init vim curl ca-certificates            				&& \
        apt install -y --no-install-recommends python3 python3-pip                      				&& \
        apt autoremove -y                                                               				&& \
        apt clean                                                                       				&& \
        echo "PermitRootLogin yes" >> /etc/ssh/sshd_config                                                              && \
        echo "root:touch123456" | chpasswd                                                                              && \
        mkdir -p /var/run/sshd                                                                                          && \
        ln -sf /bin/bash /bin/sh                                                        				&& \
        rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
# 暴露端口
EXPOSE 22 80 443
# 容器启动时执行启动脚本
ENTRYPOINT /usr/sbin/sshd -D
