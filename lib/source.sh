#!/usr/bin/env bash
install_source_packages ()
{
  packages=("$@")
  WORK_DIR="/tmp/$(cat /proc/sys/kernel/random/uuid)"
  
  mkdir $WORK_DIR
  pushd $WORK_DIR
  
  for package in "${source_packages[@]}"; do
    source $SRC_DIR/lib/source_packages/$package.sh
    
    install_apt_packages
    install_rust_packages
    install_node_packages
    install_pip_packages
        
    # Skip if already installed
    if command -v $command &> /dev/null; then
	continue
    fi
    
    downloadFile="./$srcDir.tar.gz"
    curl -s -L $url | tee $downloadFile | sha256sum --quiet -c <(echo "$checksum  -") || \
        { echo "Checksum invalid for $package."; exit 1; }
    tar -xf $downloadFile

    # Build and install
    pushd $srcDir
    install
    popd

    echo "Installed $package."
  done
  
  popd
  rm -rf $WORK_DIR
}
