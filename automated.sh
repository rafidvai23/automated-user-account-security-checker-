#!/bin/bash

# Set the output file
REPORT="user_audit_$(date +%F).txt"

echo "User Account Security Audit - $(date)" > $REPORT
echo "--------------------------------------" >> $REPORT

# 1. Users with UID 0 (should only be root)
echo -e "\n[1] Users with UID 0 (root privileges):" >> $REPORT
awk -F: '$3 == 0 { print $1 }' /etc/passwd >> $REPORT

# 2. Users with empty passwords
echo -e "\n[2] Users with empty passwords:" >> $REPORT
sudo awk -F: '($2 == "") { print $1 }' /etc/shadow >> $REPORT

# 3. Users who never logged in
echo -e "\n[3] Users who never logged in:" >> $REPORT
lastlog | grep "Never" >> $REPORT

# 4. Users with a home directory that's world-writable
echo -e "\n[4] Users with world-writable home directories:" >> $REPORT
cut -d: -f1,6 /etc/passwd | while IFS=: read user home; do
  if [ -d "$home" ] && [ -w "$home" ] && [ -o "$home" ]; then
    echo "$user: $home" >> $REPORT
  fi
done

# 5. Users not in /etc/shadow
echo -e "\n[5] Users missing from /etc/shadow:" >> $REPORT
cut -d: -f1 /etc/passwd | while read user; do
  if ! grep -q "^$user:" /etc/shadow; then
    echo "$user" >> $REPORT
  fi
done

echo -e "\nAudit complete. Report saved to: $REPORT"
