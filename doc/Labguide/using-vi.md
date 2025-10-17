# Using vi
## Commands
| Command | Description |
| ---| --- |
| ESC | change to command mode |
| i | start typing before the current character |
| u | undo last action |
| dd | cut the current line |
| yy | copy the current line |
| p | paste after the current line |
| /string | search string in file (n next, N previous) |
| :num | jump to line number |
| :w | write file |
| :q | quit |
---

## Tasks
### 1. Create a new file and add content
Open the file with vi  
**`vi testfile`**  
Change to insert mode  
**`i`**  
Write something
**`This is my first vi experience`**  
Change to command mode  
**`[ESC]`**  
Write the file and quit vi  
**`:wq [ENTER]`**  
Check the file content  
**`cat testfile`**  

### 2. Add some more content to the file
Use cat and file redirect to insert some more content  
**`cat /etc/resolv.conf >> testfile`**  
Check the file content  
**`cat testfile`**  

### 3. Modify the file
Open the file with vi  
**`vi testfile`**  
Search for nameserver  
**`/server [ENTER]`**  
Press n until you reach the nameserver entry  
**`n`**  
Copy the line  
**`yyp`**  
Change the IP from 127.0.0.53 to 8.8.8.8  
Move the cursor to the end of the line and change the IP accordingly  
**`i`**  
Change to command mode  
**`[ESC]`**  
Write the file and quit vi  
**`:wq [ENTER]`**  

### 4. Delete something from the file
Open the file with vi  
**`vi testfile`**  
Go to line number 10 and delete it  
**`:10 [ENTER]`**  
Delete the line  
**`dd`**  
Change to command mode  
**`[ESC]`**  
Write the file and quit vi  
**`:wq [ENTER]`**