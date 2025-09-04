#!/bin/bash

# Step 1: Initialize Workspace and Build Container

# 1. Build Docker image named 'hello'
echo "Building Docker image 'hello'..."
docker build -t hello .
if [ $? -ne 0 ]; then
    echo "Error: Docker image build failed!"
        exit 1
	fi

	# 2. Run the Docker container interactively
	echo "Starting Docker container 'hello_container'..."
	docker run -dit --name hello_container hello
	if [ $? -ne 0 ]; then
	    echo "Error: Docker container failed to start!"
	        exit 1
		fi

		# 3. Enter the container and create test.sh
		echo "Creating test.sh inside the container..."
		docker exec hello_container bash -c "cd ~ && echo 'echo hello' > test.sh && chmod +x test.sh"

		# 4. Run the test.sh script inside the container
		echo "Running test.sh inside the container..."
		docker exec hello_container bash -c "cd ~ && ./test.sh"

		# 5. Stop and remove the container
		echo "Stopping and removing container..."
		docker stop hello_container
		docker rm hello_container

		echo "Step 1 completed successfully!"

