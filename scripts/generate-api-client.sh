#!/bin/bash
API_SERVER="${API_SERVER:-http://localhost:8080/api-json}"  # If variable not set or null, use default.

OUTPUT_FOLDER="./client"

rm -rf $OUTPUT_FOLDER

# Install from homebrew https://formulae.brew.sh/formula/openapi-generator

openapi-generator generate -i $API_SERVER \
-g typescript-axios \
-o $OUTPUT_FOLDER \
--skip-validate-spec

# Run lint after to make it easy to see changes after script
pnpm format
