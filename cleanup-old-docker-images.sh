#!/bin/bash

echo "🧹 Searching for Docker images older than 1 month..."

# List all image IDs with their creation dates, filter those older than 30 days
docker images --format '{{.Repository}}:{{.Tag}} {{.ID}} {{.CreatedSince}}' | while read -r line; do
    IMAGE=$(echo "$line" | awk '{print $1}')
    ID=$(echo "$line" | awk '{print $2}')
    AGE=$(echo "$line" | awk '{$1=$2=""; print $0}' | xargs)

    # Parse age to days (supports formats like "2 weeks ago", "3 months ago", etc.)
    if [[ "$AGE" =~ ^([0-9]+)\ (weeks|months|years) ]]; then
        echo "🗑 Removing $IMAGE ($AGE)"
        docker rmi -f "$ID"
    elif [[ "$AGE" =~ ^([3-9][0-9]+|[1-9][0-9]{2,})\ days ]]; then
        echo "🗑 Removing $IMAGE ($AGE)"
        docker rmi -f "$ID"
    fi
done

echo "✅ Cleanup complete."
