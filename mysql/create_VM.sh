echo "kva-vm"
yc compute instance create --name kva-vm\
 --zone ru-central1-a\
 --network-interface subnet-name=default-ru-central1-a,nat-ip-version=ipv4\
 --create-boot-disk image-folder-id=standard-images,image-family=ubuntu-2204-lts,size=20\
 --memory 2\
 --cores 2\
 --metadata-from-file user-data=cloud-init.yaml
