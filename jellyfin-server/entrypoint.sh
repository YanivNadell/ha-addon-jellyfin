#!/bin/bash

CONFIG_PATH="/share/jellyfin/config/system.xml"
CUSTOM_PATH="/share/jellyfin/custom-web"

# Inject WebRootPath if it's missing
if ! grep -q "<WebRootPath>" "$CONFIG_PATH"; then
  sed -i "/<ServerConfiguration>/a \ \ \ \ <WebRootPath>$CUSTOM_PATH</WebRootPath>" "$CONFIG_PATH"
fi

# Launch Jellyfin
exec ./jellyfin/jellyfin --webdir=/share/jellyfin/custom-web