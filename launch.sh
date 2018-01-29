#/bin/bash

#Download and import disk image
mkdir workdir
cd workdir
wget <IMG_URL>

openstack image create --public \
> --disk-format vmdk --container-format bare \
> --file <IMAGE_FILE> --property \
murano_image_info='{"title": "Oracle Linux 7", "type": "linux"}' ol7

#Create 4 instances
for i in 1 2 3 4
    do
        openstack server create --flavor m1.medium --image ol7 \
  --nic net-id=PROVIDER_NET_ID --security-group default \
  --key-name <SSH_KEY_NAME> ol7-$i     
    done

#MISSING: Assign IP addresses: need to figure out what the flat-lan-1 subnet is.
#MISSING: Code to test pinging between instances
