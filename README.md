# VenvManager

A simple yet powerful script for managing Python virtual environments effortlessly!

📌 Introduction

Managing Python virtual environments (venv) can be tedious, especially if you have to type multiple commands repeatedly. VenvMaster automates the process and provides a user-friendly interactive menu to handle everything with ease.

With this script, you can:
✅ Create or activate a virtual environment automatically
✅ Install, uninstall, and update Python packages effortlessly
✅ View installed libraries in a structured format
✅ Update a single library or upgrade all outdated libraries
✅ Avoid manually typing long and repetitive pip commands

This tool is ideal for beginners and experienced developers who want a faster and more efficient way to manage their virtual environments.

⚠️ Note: This script is designed for Unix-based systems. If you're using Windows without WSL, you may need to modify it slightly for compatibility.

---

🚀 Features

Auto-detect or create a virtual environment (No more manual venv setup!)

Simple menu-driven interface (No need to remember commands)

One-click package installation & uninstallation

Full control over library updates (Update one or all libraries)

Lightweight & dependency-free (Works with any Bash shell)

---
📥 Installation & Usage

> there are 2 way to install the script. first 1(Recommended): is that you pick the script from the github and copying it in your System in /home location, beacuse there is the location where all your Venvs exist(if not, move the script where your Venvs are.)

> the second way:

🔹 1. Clone the repository

git clone https://github.com/TheYangKai/VenvManager.git
cd VenvMaster

🔹 2. Make the script executable

chmod +x venvmaster.sh

🔹 3. Run the script

./venvmaster.sh

---

## lets run it :)

![image](https://github.com/user-attachments/assets/e9813d11-511e-4d17-a065-2857392c7847)

here, if you give it an unvalid Venv name (in this case 'a'), the script will stop and telling you "do you want to create a venv with 'a' name?", and you know what to do.

here, i gave it a valid Venv that is exist in my system, and the script now gave me these Options :

![image](https://github.com/user-attachments/assets/7c65f356-8dfb-4299-85b5-d0de41eb2eea)

## 📜 Menu Options

| Option  | Description |
|-------|----------|
| install a library | enter a package nameand it will install it in the current Venv |
| Uninstall | Remove a package from the current Venv |
| View installed libraries | see a sorted list of installed packages in the current Venv |
| Update a library or the whole venv  | Update a specific library or alloutdated packages in the current Venv |

---

## 🛠 Requirements

Python 3.x (Make sure it's installed)

Bash Shell (Linux, macOS, or WSL on Windows)

---

## 💡 Contributions & Issues

Want to improve VenvMaster? Pull requests and issues are welcome!

Report bugs → Open an issue

Suggest new features → Let’s make this tool even better!
