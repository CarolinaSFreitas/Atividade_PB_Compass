#!/bin/bash

		sudo mount -t efs fs-0d87164e862a3b1c3.efs.us-east-1.amazonaws.com:/ /mnt/efs
		sudo systemctl enable httpd
		sudo systemctl start httpd
		sudo systemctl status httpd