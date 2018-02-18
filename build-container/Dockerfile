FROM debian:stretch

RUN apt update && \
	apt install -y git build-essential debhelper dkms docbook-xsl help2man python-all python-dbus python-gobject xsltproc dh-systemd flex autoconf automake dpkg-dev linux-source bash-completion udev && \
	apt-get clean && rm -rf /var/lib/apt/lists/

RUN mkdir -p /build

ADD /assets/build-drbd9.sh /

USER build
WORKDIR /build

CMD "/build-drbd9.sh"
