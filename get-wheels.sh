#!/bin/bash

# Get binary python wheels from latest github release of llama-cpp-python

# Get the latest release
latest_release=$(curl -s https://api.github.com/repos/abetlen/llama-cpp-python/releases/latest | jq -r .tag_name)

# Get the latest release's assets
assets=$(curl -s https://api.github.com/repos/abetlen/llama-cpp-python/releases/latest | jq -r .assets)

# Create an index html file
echo "<DOCTYPE html>"
echo "<html>"
echo "<body>"

# for each asset. if it's a wheel, echo an anchor tag with the download url
for asset in $(echo $assets | jq -r .[].browser_download_url); do
    if [[ $asset == *".whl" ]]; then
        echo "    <a href=\"$asset\">$asset</a><br>"
    fi
done

echo "</body>"
echo "</html>"