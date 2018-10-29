#!/bin/sh

yum install -y https://github.com/akutz/cloud-init-vmware-guestinfo/releases/download/v1.1.0/cloud-init-vmware-guestinfo-1.1.0-1.el7.noarch.rpm \
               cloud-utils-growpart && \
service rsyslog stop && \
service auditd stop && \
package-cleanup -y --oldkernels --count=1 && \
yum clean -y all && \
logrotate -f /etc/logrotate.conf && \
printf '' >/etc/machine-id && \
rm -fr /var/lib/cloud/instances && \
rm -fr /root/.ssh/authorized_keys && \
rm -f /var/log/*-???????? /var/log/*.gz && \
rm -f /var/log/dmesg.old && \
rm -rf /var/log/anaconda && \
cat /dev/null > /var/log/audit/audit.log && \
cat /dev/null > /var/log/wtmp && \
cat /dev/null > /var/log/lastlog && \
cat /dev/null > /var/log/grubby && \
rm -f /etc/udev/rules.d/70* && \
sed -i '/^(HWADDR|UUID)=/d' /etc/sysconfig/network-scripts/ifcfg-e* && \
rm -rf /tmp/* && \
rm -rf /var/tmp/* && \
rm -f /etc/ssh/*key* && \
rm -f /root/.bash_history && \
rm -rf /root/.ssh/ && \
rm -f /root/anaconda-ks.cfg && \
rm -rf /var/log && mkdir -p /var/log && \
echo 'clearing history & sealing the VM...' && \
unset HISTFILE && history -c && rm -fr /root/.bash_history && \
sys-unconfig
