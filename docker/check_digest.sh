#!/bin/bash                                                                                          

# Check if the required parameters are provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <registry_name> <docker_script_file>"
    exit 1
fi

registry_name="$1"
docker_script_file="$2"

# Function to get the digest of the latest image from ECR
get_ecr_digest() {
    aws ecr describe-images --repository-name "$registry_name" | jq -r '[.imageDetails[] | select(.imageTags? and .imageTags[] == "dev-latest")] | sort_by(.imagePushedAt) | .[-1] | .imageDigest'
}

# Function to get the digest of the local image
get_local_digest() {
    docker images --digests | awk '/'"$registry_name"'.*dev-latest/ { print $3 }'
}

# Compare the digests
ecr_digest=$(get_ecr_digest)
local_digest=$(get_local_digest)

if [ "$ecr_digest" = "$local_digest" ]; then
    echo "Digests match. No action needed."
else
    echo "Digests differ. Running $docker_script_file script..."
    ./"$docker_script_file"
fi