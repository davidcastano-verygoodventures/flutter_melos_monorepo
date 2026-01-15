#!/bin/bash
set -e

# Usage: ./setup.sh <tag_name>
# Example: ./setup.sh v1.1.0

TAG=$1
if [ -z "$TAG" ]; then
    echo "Usage: ./setup.sh <tag_name>"
    exit 1
fi

if ! command -v gh &> /dev/null; then
    echo "Error: GitHub CLI (gh) is not installed."
    exit 1
fi

echo "Cleaning up old artifacts..."
rm -rf libs
rm -f android_maven_repo.zip

echo "Downloading artifacts for $TAG..."
gh release download $TAG -p "android_maven_repo.zip" --clobber

echo "Unzipping Maven Repo..."
mkdir -p libs
unzip -o android_maven_repo.zip -d libs

echo "Done! If you have Java installed, you can now run './gradlew build'"
