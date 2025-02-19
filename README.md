# Race Condition Bug in Shell Script

This repository demonstrates a race condition bug in a simple shell script. The script attempts to increment a counter using multiple concurrent processes. However, due to the race condition, the final counter value is often less than expected.

## Bug Description

A race condition occurs when multiple processes access and modify shared resources (in this case, the 'counter.txt' file) concurrently. The outcome depends on the unpredictable order in which processes execute, leading to unexpected results. In this script, multiple processes try to read the counter, increment it, and write it back simultaneously, leading to lost increments.

## Bug Solution

The solution involves using appropriate locking mechanisms to ensure exclusive access to the shared resource. This prevents multiple processes from modifying the counter simultaneously.