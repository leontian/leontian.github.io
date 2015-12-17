---
layout: post
title: "Linux Shell"
---

1. What's sticky bit and what is it used for?
  
	saves information about permisssion. can be set by chmod

2. How to check content at a certain location in gdb?

	x

3. Find all files whose name start with "Hello".

	find /path/ -name "Hello*"

4. What is phony target in make file?

	A phony target is one that is not really the name of a file; rather it is just a name for a recipe to be executed when you make an explicit request. There are two reasons to use a phony target: to avoid a conflict with a file of the same name, and to improve performance.

5. Find all files in the current directory and subdirectories whose name contains "good" ignoring case.

6. How to check file type?

	file

7. Change default permission.

	umask, usage similar to chmod

8. Check dependencies of a excutable.

	ldd
	
	"objdump -p" is better

9. List the files in a directory and total their sizes.

	print file names and sizes 
	
	ls -ltr | awk '{print $9, $5}'
	
	get total size in one line
	
	ls -ltr | awk '{print $9, $5}' | awk '{total = total + $2}END{print total}'
