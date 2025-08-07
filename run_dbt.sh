#!/bin/bash

# A script to load .env variables and run dbt commands.
# This bypasses environment variable inheritance issues.

# Load variables from .env file
if [ -f .env ]; then
  export $(grep -v '^#' .env | xargs)
fi

# Pass all arguments to the dbt command
dbt "$@"