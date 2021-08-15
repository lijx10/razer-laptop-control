# suspend problem of razer blade 14 with nvidia-470 driver
# nvidia-470 doesn't install required files like nvidia-suspend.service, nvidia-resume.service into /lib/systemd/system.
# However, systemd-suspend.service requires the above two service, which crashes the suspend process.
# To check dependencies of systemd-suspend.service:
# systemctl list-dependencies --all systemd-suspend
# To view service detail of systemd-suspend:
# systemctl cat systemd-suspend
#
# Solution 1: Seems to work. Remove dependencies of nvidia-suspend.service and nvidia-resume.service
sudo mv /etc/systemd/system/systemd-suspend.service.requires /etc/systemd/system/systemd-suspend.service.requires.bk
sudo mv /etc/systemd/system/systemd-hibernate.service.requires /etc/systemd/system/systemd-hibernate.service.requires.bk
#
# Optional: check logind configuration. You may change lid open/close behavior
# cat /etc/systemd/logind.conf
#
# Solution 2: Manually install nvidia-suspend.service, nvidia-resume.service and related files
# TODO: get it work...
