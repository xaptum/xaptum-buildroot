Vagrant.configure(2) do |config|
  config.vm.box = "bento/debian-9"

  config.vm.box_check_update = false
  config.vm.network "public_network"

  config.ssh.forward_agent = true

  config.vm.provider :virtualbox do |vb|
    vb.memory = 4096
    vb.cpus = 4

    vb.customize ["modifyvm", :id, "--usb", "on", "--usbehci", "on"]
    vb.customize ["usbfilter", "add", "0", "--target", :id,
                  "--name", "SAMA5D2 Xplained",
                  "--vendorid", "0x03eb", "--productid", "0x6124"]
  end

  config.vm.provision "shell", inline: <<-SHELL
    apt-get update
    apt-get install -y gcc make                          \
                       bc ncurses-dev unzip              \
                       git                               \
                       dpkg-dev usbutils
  SHELL

end
