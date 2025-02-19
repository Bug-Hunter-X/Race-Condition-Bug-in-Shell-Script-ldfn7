#!/bin/bash

# This script demonstrates a solution to the race condition bug using flock.

counter=0

# Function to increment the counter using flock for locking
increment_counter() {
  flock -n 200 || exit 1 # acquire lock on counter.txt with file descriptor 200, exit if already locked
  local current_count=$(cat counter.txt)
  local new_count=$((current_count + 1))
  echo $new_count > counter.txt
  flock -u 200 # release lock 
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