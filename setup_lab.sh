#!/bin/bash
set -e

# Simple Linux business permissions lab setup

COMPANY_ROOT="${PWD}/company_data"

echo "== Linux Business Lab =="
echo "Root directory: ${COMPANY_ROOT}"
echo

# 1. Create groups (simple loop, no arrays needed)
for g in mgmt trainers sales it; do
    if getent group "$g" > /dev/null; then
        echo "Group '$g' already exists, skipping"
    else
        echo "Creating group '$g'"
        sudo groupadd "$g"
    fi
done

echo

# 2. Create users and assign them to groups
# Format: username:group
for pair in "alice:mgmt" "bob:trainers" "carol:sales" "dave:it"; do
    user="${pair%%:*}"
    grp="${pair##*:}"

    if id "$user" > /dev/null 2>&1; then
        echo "User '$user' already exists, adding them to group '$grp'"
        sudo usermod -a -G "$grp" "$user"
    else
        echo "Creating user '$user' in group '$grp'"
        sudo useradd -m -s /bin/bash -G "$grp" "$user"
    fi
done

echo

# 3. Create directory structure
echo "Creating company directory structure under ${COMPANY_ROOT}"
mkdir -p "${COMPANY_ROOT}"/mgmt \
         "${COMPANY_ROOT}"/trainers \
         "${COMPANY_ROOT}"/sales \
         "${COMPANY_ROOT}"/it \
         "${COMPANY_ROOT}"/shared

# 4. Set ownership and permissions
echo "Setting ownership and permissions"

sudo chown root:mgmt      "${COMPANY_ROOT}/mgmt"
sudo chown root:trainers  "${COMPANY_ROOT}/trainers"
sudo chown root:sales     "${COMPANY_ROOT}/sales"
sudo chown root:it        "${COMPANY_ROOT}/it"
sudo chown root:it        "${COMPANY_ROOT}/shared"

sudo chmod 770 "${COMPANY_ROOT}/mgmt" \
               "${COMPANY_ROOT}/trainers" \
               "${COMPANY_ROOT}/sales" \
               "${COMPANY_ROOT}/it"

sudo chmod 775 "${COMPANY_ROOT}/shared"

# setgid bit so new files inherit group
sudo chmod g+s "${COMPANY_ROOT}"/mgmt \
               "${COMPANY_ROOT}"/trainers \
               "${COMPANY_ROOT}"/sales \
               "${COMPANY_ROOT}"/it \
               "${COMPANY_ROOT}"/shared

echo
echo "Creating example files"

echo "Confidential management plan" | sudo tee "${COMPANY_ROOT}/mgmt/strategy.txt" >/dev/null
echo "Trainer client notes"        | sudo tee "${COMPANY_ROOT}/trainers/clients.txt" >/dev/null
echo "Quarterly sales report"      | sudo tee "${COMPANY_ROOT}/sales/report_q1.txt" >/dev/null
echo "IT infrastructure notes"     | sudo tee "${COMPANY_ROOT}/it/infra.txt" >/dev/null
echo "Company handbook"            | sudo tee "${COMPANY_ROOT}/shared/handbook.txt" >/dev/null

echo
echo "Setup complete!"
echo "Company data created at: ${COMPANY_ROOT}"
