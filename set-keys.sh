#!/bin/bash

mkdir -p ~/.ssh
cp -R ./docker/_ssh/ ~/.ssh 
chmod 700 ~/.ssh
chmod 644 ~/.ssh/id_rsa.pub
chmod 600 ~/.ssh/id_rsa