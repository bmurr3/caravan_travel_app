
setup:
	sudo dnf -y update
	sudo dnf -y install dnf-plugins-core epel-release
	sudo dnf -y install snapd

	sudo systemctl enable --now snapd.socket
	sudo ln -s /var/lib/snapd/snap /snap

	-sudo dnf config-manager --set-enabled crb

	sudo dnf -y install vim curl wget unzip xz zip mesa-libGLU \
		mesa-libGLU-devel libstdc++-devel git java-latest-openjdk-devel

	sudo mkdir /installs || true
	sudo chmod 777 /installs

	git --version

	flutter --version 1>/dev/null 2>&1; \
	if [ $$? -ne 0 ]; then \
		wget https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.41.9-stable.tar.xz; \
		mv flutter_linux_3.41.9-stable.tar.xz /installs/.; \
		cd /installs && tar -xvf flutter_linux_3.41.9-stable.tar.xz; \
		if [ -z "$(grep -E 'export PATH="\$$PATH:/installs/flutter/bin"' ~/.bashrc)" ]; then \
			echo 'export PATH="$$PATH:/installs/flutter/bin"' >> ~/.bashrc; \
			bash -c "source ~/.bashrc"; \
		fi; \
		flutter --version; \
		dart --version; \
	fi

	sudo snap install android-studio --classic
