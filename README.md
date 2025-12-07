# Linux Business Permissions Lab

This project simulates a small business environment on Linux using Bash scripts to create users, groups, directory structures, permissions, and reporting.

## Features
- Creates mgmt, trainers, sales, and it groups
- Creates users (alice, bob, carol, dave)
- Generates a realistic company_data directory structure
- Applies correct Linux permissions and setgid
- Creates example files
- Includes a permissions reporting script

## How to Run
git clone git@github.com:bartpodkowa/linux-business-lab.git && cd linux-business-lab && chmod +x setup_lab.sh report_permissions.sh && sudo bash ./setup_lab.sh && ./report_permissions.sh

## Skills Demonstrated
- Linux user & group management
- Permission hardening
- Bash scripting for automation
- Git & GitHub workflow
