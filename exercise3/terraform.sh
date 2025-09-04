#!/bin/bash

# Navigate to your Terraform workspace
WORKDIR="terraform_helloworld"
cd $WORKDIR || { echo "Workspace not found!"; exit 1; }

echo "Running Terraform Step 2..."

# 1. Initialize Terraform
echo "Initializing Terraform..."
terraform init -input=false
if [ $? -ne 0 ]; then
    echo "Error: Terraform init failed!"
        exit 1
	fi

	# 2. Plan Terraform execution
	echo "Planning Terraform..."
	terraform plan -out=tfplan -input=false
	if [ $? -ne 0 ]; then
	    echo "Error: Terraform plan failed!"
	        exit 1
		fi

		# 3. Apply Terraform changes
		echo "Applying Terraform..."
		terraform apply -input=false -auto-approve tfplan
		if [ $? -ne 0 ]; then
		    echo "Error: Terraform apply failed!"
		        exit 1
			fi

			# 4. Verify HelloWorld.txt
			if [ -f HelloWorld.txt ]; then
			    echo "HelloWorld.txt generated successfully!"
			        echo "Contents of HelloWorld.txt:"
				    echo "---------------------------"
				        cat HelloWorld.txt
					    echo "---------------------------"
					    else
					        echo "Error: HelloWorld.txt not found!"
						    exit 1
						    fi

						    echo "Terraform Step 2 completed successfully!"

