#!/bin/bash

# Step 2: Docker Compose setup and test

# 1. Create docker-compose.yml if it doesn't exist
if [ ! -f docker-compose.yml ]; then
cat <<EOF > docker-compose.yml
version: '3'
services:
  app1:
      image: hello
          container_name: app1
	      ports:
	            - "8081:80"

		      app2:
		          image: hello
			      container_name: app2
			          ports:
				        - "8082:80"
EOF
					echo "docker-compose.yml created."
					fi

					# 2. Start containers
					echo "Starting containers with docker-compose..."
					docker-compose up -d
					if [ $? -ne 0 ]; then
					    echo "Error: docker-compose failed to start containers."
					        exit 1
						fi

						# 3. Wait a few seconds for containers to start
						sleep 5

						# 4. Test /hello endpoint
						echo "Testing /hello endpoint on app1..."
						curl -s http://localhost:8081/hello || echo "Failed to reach app1"

						echo "Testing /hello endpoint on app2..."
						curl -s http://localhost:8082/hello || echo "Failed to reach app2"

						# 5. Stop and remove containers
						echo "Stopping and removing containers..."
						docker-compose down

						echo "Docker Compose test completed!"

