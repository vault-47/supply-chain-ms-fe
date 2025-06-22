#!/bin/bash
API_SERVER="${API_SERVER:-http://localhost:8080/api-json}"  # If variable not set or null, use default.

ADMIN_OUTPUT_FOLDER="./apps/admin/client"
WEBAPP_OUTPUT_FOLDER="./apps/webapp/client"

rm -rf $ADMIN_OUTPUT_FOLDER
rm -rf $WEBAPP_OUTPUT_FOLDER

# Install from homebrew https://formulae.brew.sh/formula/openapi-generator

openapi-generator generate -i $API_SERVER \
-g typescript-axios \
-o $ADMIN_OUTPUT_FOLDER \
--skip-validate-spec


openapi-generator generate -i $API_SERVER \
-g typescript-axios \
-o $WEBAPP_OUTPUT_FOLDER \
--skip-validate-spec


# Run lint after to make it easy to see changes after script
pnpm format:fix
