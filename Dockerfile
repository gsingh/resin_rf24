FROM resin/rpi-raspbian:jessie

# Install OpenJDK 7
# Remove package lists to free up space
RUN apt-get update	&& apt-get install -y openjdk-7-jdk	&& apt-get install -y wget && rm -rf /var/lib/apt/lists/* 

RUN wget http://repo.mosquitto.org/debian/mosquitto-repo.gpg.key && apt-key add mosquitto-repo.gpg.key
RUN rm mosquitto-repo.gpg.key

# RUN cd /etc/apt/sources.list.d/
RUN wget --directory-prefix /cd/apt/sources.list.d/ http://repo.mosquitto.org/debian/mosquitto-wheezy.list  && sudo apt-get update
RUN apt-get install -y mosquitto mosquitto-clients

ADD ./install.sh /tmp/install.sh
RUN /bin/sh /tmp/install.sh
# RUN wget https://github.com/gsingh/resin_openhab/blob/master/install.sh
# RUN chmod +x install.sh
# RUN /bin/bash /install.sh
RUN rm install.sh

RUN wget --directory-prefix /home/rf24libs http://www.homeautomationforgeeks.com/code/hareceiver.cpp
RUN wget --directory-prefix /home/rf24libs http://www.homeautomationforgeeks.com/code/Makefile
RUN /home/rf24libs/make
RUN /home/rf24libs/hareceiver"

ADD . /App/

# Install the UPS Support
RUN dpkg -i /App/ups/upsd_1.2-1.deb
 
# mv /App/start.sh /start.sh

CMD ["bash", "/App/start.sh"]
