FROM r-base:4.0.4
RUN rm /etc/apt/sources.list \
 && rm /etc/apt/sources.list.d/debian-unstable.list \
 && sh -c 'echo "deb http://mirrors.tuna.tsinghua.edu.cn/debian/ bullseye main contrib non-free" > /etc/apt/sources.list' \
 && sh -c 'echo "deb http://mirrors.tuna.tsinghua.edu.cn/debian/ bullseye-updates main contrib non-free" >> /etc/apt/sources.list' \
 && sh -c 'echo "deb http://mirrors.tuna.tsinghua.edu.cn/debian/ bullseye-backports main contrib non-free" >> /etc/apt/sources.list' \
 && sh -c 'echo "deb http://mirrors.tuna.tsinghua.edu.cn/debian-security bullseye-security main contrib non-free" >> /etc/apt/sources.list'
RUN apt-get update \
 && apt install -y apt-transport-https
 
RUN wget https://packages.microsoft.com/config/debian/10/packages-microsoft-prod.deb -O packages-microsoft-prod.deb \
    && dpkg -i packages-microsoft-prod.deb \
 && apt update \
 && apt install -y aspnetcore-runtime-3.1

ENV PATH=/usr/bin:usr/lib/R/lib:$PATH  LD_LIBRARY_PATH=usr/lib:usr/lib/R/lib:/usr/local/lib:$LD_LIBRARY_PATH R_HOME=/usr/lib/R
