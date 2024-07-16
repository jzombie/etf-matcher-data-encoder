#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Ensure we're in a Docker container
/app/docker_build_helpers/./validate_docker_env.sh

# Source the .env file
if [ -f .env ]; then
    export $(cat /app/.env | xargs)
fi

# Auto-append generated build info (this should come before
# the encryption process)
/app/docker_build_helpers/./generate_data_build_info.sh

# Build the encryption tool
cd /app/rust/encrypt_tool
cargo build

mkdir -p /tmp/output-build

# Loop over all files in the /app/in directory and its subdirectories
find /app/in -type f | while read -r file; do
    # Remove the base directory path and file extension
    relative_path="${file#/app/data/}"
    output_path="${relative_path%.*}.enc"
    
    # Create the necessary subdirectories in the output directory
    mkdir -p "/tmp/out-build/$(dirname "$output_path")"
    
    # Run the encryption tool with the input and output file arguments
    ./target/debug/encrypt_tool "$file" "/tmp/out-build/$output_path"
done

# Zip the contents of /tmp/out-build
cd /tmp/out-build
zip -r /build_artifacts/out/datapack.zip .

echo "Data has been encrypted and zipped to /build_artifacts/out/datapack.zip"
