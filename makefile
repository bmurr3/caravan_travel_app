
setup:
	sudo dnf -y update
	sudo dnf -y install dnf-plugins-core epel-release
	sudo dnf -y install snapd

	sudo systemctl enable --now snapd.socket
	-sudo ln -s /var/lib/snapd/snap /snap

	-sudo dnf config-manager --set-enabled crb
	sudo dnf module list nodejs
	sudo dnf module enable nodejs:20 -y

	sudo dnf -y install vim curl wget unzip xz zip mesa-libGLU \
		mesa-libGLU-devel libstdc++-devel git java-latest-openjdk-devel \
		nodejs npm

	-sudo mkdir /installs
	sudo chmod 777 /installs

	git --version

# 	sudo npm install -g npm
	sudo npm install -g create-vite

# 	flutter --version 1>/dev/null 2>&1; \
# 	if [ $$? -ne 0 ]; then \
# 		wget https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.41.9-stable.tar.xz; \
# 		mv flutter_linux_3.41.9-stable.tar.xz /installs/.; \
# 		cd /installs && tar -xvf flutter_linux_3.41.9-stable.tar.xz; \
# 		if [ -z "$(grep -E 'export PATH="\$$PATH:/installs/flutter/bin"' ~/.bashrc)" ]; then \
# 			echo 'export PATH="$$PATH:/installs/flutter/bin"' >> ~/.bashrc; \
# 			bash -c "source ~/.bashrc"; \
# 		fi; \
# 		flutter --version; \
# 		dart --version; \
# 	fi

# 	sudo dnf config-manager --add-repo https://developer.download.nvidia.com/compute/cuda/repos/rhel8/x86_64/cuda-rhel8.repo
# 	sudo dnf -y install sdkmanager
