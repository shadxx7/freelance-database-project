# Console SQL App

Console App for running Postgresql queries written in C.

## How to use (Ubuntu)

- Inside of main.c, change the following accordingly:
	```bash
	conn = PQconnectdb("host=host_name user=your_user dbname=your_db password=your_password");
	```
- Run following Commands:
	```bash
	sudo apt install gcc postgresql
	```
- Now inside the code directory, run: 
	```bash
	gcc -o console main.c -I/usr/include/postgresql -lpq -std=c99
	./console
	```
