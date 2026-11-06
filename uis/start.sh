#!/bin/sh
set -e

echo "Starting talent-pipeline-tracker in production on port 3000..."
npm --prefix /app/talent-pipeline-tracker run start -- --hostname 0.0.0.0 --port 3000 &
WEBSITE_PID=$!

echo "Starting backoffice in production on port 3001..."
npm --prefix /app/backoffice run start -- --hostname 0.0.0.0 --port 3001 &
BACKOFFICE_PID=$!

trap 'kill $WEBSITE_PID $BACKOFFICE_PID' INT TERM

wait