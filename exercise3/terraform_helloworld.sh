#!/bin/bash

# Step 0: Create workspace directory
WORKDIR="terraform_helloworld"
mkdir -p $WORKDIR
cd $WORKDIR || exit 1

# Step 1: Create Terraform configuration file
cat <<EOF > main.tf
terraform {
  required_version = ">= 1.0.0"
  }

  provider "local" {}

  resource "local_file" "helloworld" {
    filename = "\${path.module}/HelloWorld.txt"
      content  = "Hello, World!"
      }
EOF

      echo "Terraform configuration created."

      # Step 2: Initialize Terraform
      echo "Initializing Terraform..."
      terraform init -input=false
      if [ $? -ne 0 ]; then
          echo "Error: Terraform init failed!"
	      exit 1
	      fi

	      # Step 3: Terraform Plan
	      echo "Planning Terraform execution..."
	      terraform plan -out=tfplan -input=false
	      if [ $? -ne 0 ]; then
	          echo "Error: Terraform plan failed!"
		      exit 1
		      fi

		      # Step 4: Apply Terraform
		      echo "Applying Terraform..."
		      terraform apply -input=false -auto-approve tfplan
		      if [ $? -ne 0 ]; then
		          echo "Error: Terraform apply failed!"
			      exit 1
			      fi

			      # Step 5: Verify HelloWorld.txt
			      echo "Verifying HelloWorld.txt..."
			      if [ -f HelloWorld.txt ]; then
			          echo "HelloWorld.txt created successfully!"
				      echo "Contents of HelloWorld.txt:"
				          cat HelloWorld.txt
					  else
					      echo "Error: HelloWorld.txt not found!"
					          exit 1
						  fi

						  echo "Terraform Step 1 completed successfully!"

