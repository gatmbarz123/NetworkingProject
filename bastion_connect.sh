#!/bin/bash


ssh -i $KEY_PATH ubuntu@$1  ssh -i new-key.pem ubuntu@$2 

 
