#!/bin/bash

# Enable debugging (prints each command as it's executed)
#set -x

API_REGISTRY="ghcr.io/akashnetwork/console-api"
WEB_REGISTRY="ghcr.io/akashnetwork/console-web"
API_WORKSPACE="apps/api"
WEB_WORKSPACE="apps/deploy-web"

FULL_TAG="${GITHUB_REF#refs/tags/}"
IFS='/' read -r scope version <<< "$FULL_TAG"
prerelease_type=$(echo "$version" | sed -n 's/.*-\([a-zA-Z]*\).*/\1/p')
app="${scope#console-}"

registry_var="$(echo "$app" | tr '[:lower:]' '[:upper:]')_REGISTRY"
registry="${!registry_var}"

workspace_var="$(echo "$app" | tr '[:lower:]' '[:upper:]')_WORKSPACE"
workspace="${!workspace_var}"

app="${scope#console-}-${prerelease_type:-stable}"
version="${version#v}"

# Print the final results
echo "App: $app"
echo "workspace: $workspace"
echo "Version: $version"
echo "Registry: $registry"