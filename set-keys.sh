#!/bin/bash

mkdir -p ~/.ssh
cp ./docker/_ssh/id_rsa ~/.ssh/id_rsa
cp ./docker/_ssh/id_rsa ~/.ssh/id_rsa.pub
chmod 700 ~/.ssh/id_rsa.pub
chmod 644 ~/.ssh/id_rsa.pub
chmod 600 ~/.ssh/id_rsa