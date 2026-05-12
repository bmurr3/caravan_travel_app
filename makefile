
setup:
	sudo dnf -y update
	sudo dnf -y install dnf-plugins-core

	-sudo dnf config-manager --set-enabled crb
	-sudo subscription-manager repos --enable codeready-builder-for-rhel-9-x86_64-rpms

	sudo dnf -y install vim curl wget unzip xz zip libGLU \
		mesa-libGLU-devel libstdc++-devel

	sudo mkdir /installs || true
	sudo chmod 777 /installs
	wget https://www.kernel.org/pub/software/scm/git/git-2.9.5.tar.gz
	mv git-2.9.5.tar.gz /installs
	cd /installs && tar -xvf git-2.9.5.tar.gz
	cd /installs/git-2.9.5 && make configure && ./configure --prefix=/usr/local
	cd /installs/git-2.9.5 && make all
	cd /installs/git-2.9.5 && sudo make install

	git --version

	wget https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.41.9-stable.tar.xz
	mv flutter_linux_3.41.9-stable.tar.xz /installs
	cd /installs && tar -xvf flutter_linux_3.41.9-stable.tar

