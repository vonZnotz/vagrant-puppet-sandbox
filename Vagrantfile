nodes = [
  {
   :hostname => 'sandbox',
   :ip => '192.168.56.211',
   :box => 'ubuntu/xenial64',
   :ram => 1024
  }
]

Vagrant.configure("2") do |config|
  nodes.each do |node|
    config.vm.define node[:hostname] do |nodeconfig|
      nodeconfig.vm.box = node[:box]
      nodeconfig.vm.hostname = node[:hostname] + ".box"
      nodeconfig.vm.network :private_network, ip: node[:ip]

      memory = node[:ram] ? node[:ram] : 256;
      nodeconfig.vm.provider :virtualbox do |vb|
        vb.customize [
          "modifyvm", :id,
          "--cpuexecutioncap", "50",
          "--memory", memory.to_s,
        ]
      end

      nodeconfig.vm.provider :virtualbox do |vb|
        vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      end

      nodeconfig.vm.provision "shell", inline: "apt-get update && apt-get install puppet -y"

      nodeconfig.vm.provision :puppet do |puppet|
        puppet.environment = "dev"
        puppet.environment_path = "environments"
      end

    end
  end
end
