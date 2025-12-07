# Linux Business Permissions Lab

This lab simulates a small business file structure on a Linux system. It automatically creates departments as directories, Unix groups, users, and applies correct permissions so each department can only access its own data.

This is a practical demonstration of Linux administration, user management, and Bash automation.

---

## Features

- Creates four Unix groups:
  - mgmt
  - trainers
  - sales
  - it
- Creates users and assigns them to the correct departments:
  - alice → mgmt
  - bob → trainers
  - carol → sales
  - dave → it
- Builds a realistic company directory structure
- Automatically applies secure permissions
- Uses setgid so new files inherit group ownership
- Generates example files in each directory
- Includes a reporting script to show permissions

---

## Directory Structure Created

```
company_data/
├── mgmt/
│   └── strategy.txt
├── trainers/
│   └── clients.txt
├── sales/
│   └── report_q1.txt
├── it/
│   └── infra.txt
└── shared/
    └── handbook.txt
```

---

## How to Run the Lab

Clone the repository using SSH:

```bash
git clone git@github.com:bartpodkowa/linux-business-lab.git
cd linux-business-lab
chmod +x setup_lab.sh report_permissions.sh
sudo ./setup_lab.sh
./report_permissions.sh
```

---

## Skills Demonstrated

- Linux user & group administration  
- Directory permissions & access control (chmod, chown, chgrp)  
- setgid for group inheritance  
- Bash scripting for automation  
- Git & GitHub version control (SSH workflow)  
- Structuring technical projects clearly  

---

## Purpose of This Project

This lab is designed as a hands-on learning exercise to demonstrate confidence with Linux system administration and automation.  
It is suitable for portfolios for IT Support, Junior SysAdmin, and Cybersecurity roles.


