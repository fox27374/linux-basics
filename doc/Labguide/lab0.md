# Log file analysis
## Commands
| Command | Description |
| --- | --- |
| cat | debian package manager |
| grep | filter lines containing a string |
| cut | filter columns depending on the delimiter |
| sort | sort based on options |
| uniq | remove duplicates from a sorted list |
| tar | extract / compress files |
---

## Tasks
### 1. Download the provided logfile
**`scp splunk.lab.local:pan_log.tar.gz .`**  

### 2. Extract the file
**`tar -xzf pan_log.tar.gz`**  

### 3. Get the number of lines the file contains
<details>
<summary>Hint</summary>
cat pan.log | wc -l
</details>

### 4. Get the number of lines containing a "drop" statement
<details>
<summary>Hint</summary>
cat pan.log | grep drop | wc -l
</details>

### 5. Get all possible firewall actions like drop, deny, ... and sort it by occurences
<details>
<summary>Hint</summary>
cat pan.log | cut -d ',' -f 5 | sort | uniq -c | sort -rn
</details>

### 6. Get the top 10 destination addresses with a deny action
<details>
<summary>Hint</summary>
cat pan.log | grep deny | cut -d ',' -f 9 | sort | uniq -c | sort -rn | head -10
</details>

### 7. Get the policy with the highest drops
<details>
<summary>Hint</summary>
cat pan.log | grep drop | cut -d ',' -f 12 | sort | uniq -c
</details>

