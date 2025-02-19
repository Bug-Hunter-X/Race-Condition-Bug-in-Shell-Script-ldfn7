#!/bin/bash

# This script demonstrates a race condition bug.

counter=0

# Function to increment the counter
increment_counter() {
  local current_count=$(cat counter.txt)
  local new_count=$((current_count + 1))
  echo $new_count > counter.txt
}

# Create a counter file
echo 0 > counter.txt

# Run increment_counter multiple times concurrently
for i in {1..10}; do
  increment_counter &
done

# Wait for all processes to finish
wait

# Print the final counter value
final_count=$(cat counter.txt)
echo "Final counter value: $final_count"