

---

```markdown
# 👤🔐 Automated User Account Security Checker

A Bash script that automatically audits user accounts on a Linux system for common security misconfigurations. Helps sysadmins and security-conscious users identify risky account settings, inactive accounts, and password issues.

---

## 🔍 What It Checks

- 🔒 Accounts with no password set
- 👻 Inactive or locked user accounts
- 🧑‍🤝‍🧑 Accounts with UID 0 (superuser privileges)
- 🛑 Shell set to `/bin/false` or `/sbin/nologin`
- ⏳ Users who haven't logged in recently

---

## 🚀 Getting Started

### 🧰 Prerequisites

- Linux (Debian/Ubuntu preferred)
- Bash shell
- Root or sudo access for full results

### 📥 Clone the Repository

```bash
git clone https://github.com/yourusername/user-security-checker.git
cd user-security-checker
```

### 🛠️ Make the Script Executable

```bash
chmod +x user_security_checker.sh
```

---

## ▶️ Usage

```bash
./user_security_checker.sh
```

Run as `root` for best results:

```bash
sudo ./user_security_checker.sh
```

---

## 🧪 Sample Output

```bash
==============================
🔍 Automated User Audit Report
==============================

✅ Total Users: 25
⚠️  Users with no password: 2
⚠️  Users with UID 0 (root-level access): 2
🚫 Inactive/locked users: 4
🚷 Users with nologin shells: 3
⏳ Users not logged in within last 90 days: 5

Recommendation:
- Set strong passwords for users without one.
- Review root-level users: root, devadmin
- Consider removing or archiving inactive accounts.

==============================
Audit complete.
```

---

## ⚠️ Why It Matters

Unused or misconfigured user accounts can pose serious security threats:
- Unauthorized access
- Privilege escalation
- Hidden backdoors

This tool gives system administrators an easy, automated way to detect potential vulnerabilities related to user account settings.

---

## 📌 Features

- 🔎 Quick account audit with no dependencies
- 🧼 Clear, categorized warnings and suggestions
- 🔧 Easy to customize and extend

---

## 📈 Future Improvements

- [ ] Export results to a log or JSON file
- [ ] Email reports to sysadmin
- [ ] Check for expired passwords
- [ ] Add color-coded CLI output

---

## 📄 License

This project is licensed under the [MIT License](LICENSE).

---

## 🤝 Contributing

PRs are welcome! If you have suggestions for improvements or new checks to add, feel free to fork and submit a pull request.

---
