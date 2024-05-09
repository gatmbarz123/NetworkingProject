#!/bin/bash

cp key old_key
cp key.pub old_key.pub
chmod 600 old_key
rm ~/key
rm ~/key.pub
ssh-keygen -f ~/key -N "" ##no password
sleep 5
scp -i old_key -p key.pub ubuntu@$1:
ssh -i old_key ubuntu@$1 cp ~/key.pub .ssh/authorized_keys
if ssh -i ~/key ubuntu@"$1" true ; then
    echo "New key works."
else
    echo "Server Certificate is invalid"
    exit 5
fi








