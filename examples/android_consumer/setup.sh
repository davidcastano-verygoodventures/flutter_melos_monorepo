#!/bin/bash
set -e

# Usage: ./setup.sh <tag_name>
# Example: ./setup.sh v1.1.0

TAG=$1
if [ -z "$TAG" ]; then
    echo "Usage: ./setup.sh <tag_name>"
    exit 1
fi

echo "Downloading artifacts for $TAG..."
gh release download $TAG -p "android_maven_repo.zip" --clobber

echo "Unzipping Maven Repo..."
mkdir -p libs
unzip -o android_maven_repo.zip -d libs

echo "Done! You can now run './gradlew build'"
