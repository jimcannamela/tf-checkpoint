#!/bin/bash
yum update -y
yum install -y java-11-amazon-corretto-headless
aws s3api get-object --bucket "jimc-tf-bucket" --key "g-hello.jar" "g-hello.jar"
java -jar g-hello.jar