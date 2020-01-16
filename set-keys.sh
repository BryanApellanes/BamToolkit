#!/bin/bash

mkdir -p ~/.ssh
cp ./docker/_ssh/id_rsa ~/.ssh/id_rsa
cp ./docker/_ssh/id_rsa.pub ~/.ssh/id_rsa.pub

chmod 600 ~/.ssh/id_rsa
chmod 644 ~/.ssh/id_rsa.pub