# Console SQL App

Console App (written in C) for running PostgreSQL queries.

## How to use (Ubuntu)

- Inside of main.c, change the following accordingly:

```C
conn = PQconnectdb("host=host_name user=your_user dbname=your_db password=your_password");
```

- Run the following commands:

```bash
sudo apt install gcc postgresql
```

- Now inside the repository, run:

```bash
gcc -o console main.c -I/usr/include/postgresql -lpq -std=c99
```

This will compile the code into a file called `console`

- Finally run the compiled code using:

```bash
./console
```
