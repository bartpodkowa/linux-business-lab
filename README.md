# Linux Business Permissions Lab

This lab simulates a small business file structure on a Linux system.
It creates departments as directories, Unix groups, and users, then assigns
permissions so that each department can only access its own data.

What it shows:
- Creating groups and users
- Creating a directory structure for departments
- Setting ownership and permissions
- Simple reporting of permissions

How to run:

```bash
chmod +x setup_lab.sh report_permissions.sh
sudo ./setup_lab.sh
./report_permissions.sh
