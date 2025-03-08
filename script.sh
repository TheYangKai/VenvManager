#!/bin/bash

clear


echo '│###    ###                               ##   ###               ##    │'
echo '│.##:  :##.                               ##   ##                ##    │'
echo '│ ###  ###                                ## :##:                      │'
echo '│  ##::##    :####    ##.####    :###:##  ##.##:     :####     ####    │'
echo '│   ####     ######   #######   .#######  #####      ######    ####    │'
echo '│   ####     #:  :##  ###  :##  ###  ###  #####      #:  :##     ##    │'
echo '│   :##:      :#####  ##    ##  ##.  .##  #####:      :#####     ##    │'
echo '│    ##     .#######  ##    ##  ##    ##  ##::##    .#######     ##    │'
echo '│    ##     ## .  ##  ##    ##  ##.  .##  ##  ##    ## .  ##     ##    │'
echo '│    ##     ##:  ###  ##    ##  ###  ###  ##  :##   ##:  ###     ##    │'
echo '│    ##     ########  ##    ##  .#######  ##   ##   ########  ######## │'
echo '│    ##       ###.##  ##    ##   :###:##  ##   :##    ###.##  ######## │'
echo '│                                #.  :##                               │'
echo '│                                ######                                │'
echo '│                                :####:                                │'


echo "==========================================="
echo "     🛠️ Developed by https://github/TheYangKai 🛠️"
echo "==========================================="
sleep 2

while true; do
    read -p "Enter your virtual environment name: " venv_name
    if [ -d "$venv_name" ]; then
        break
    else
        echo "❌ Virtual environment '$venv_name' not found!"
        read -p "Do you want to create it? (y/n): " create_venv
        if [[ "$create_venv" =~ ^[Yy]$ ]]; then
            python -m venv "$venv_name"
            break
        fi
    fi
done

source "$venv_name/bin/activate"

clear

while true; do
    echo "Select an option:"
    echo "1) Install a library"
    echo "2) Uninstall a library"
    echo "3) View installed libraries"
    echo "4) Update a library or the whole venv"
    echo "5) Exit"
    read -p "Enter your choice: " choice

    clear

    case "$choice" in
        1)
            read -p "Enter your library name to install: " library
            if pip install "$library"; then
                echo "✅ The library '$library' has been installed successfully!"
            else
                echo "❌ Installation failed!"
            fi
            ;;
        2)
            read -p "Enter the name of the library to uninstall: " library
            if pip list | awk '{print $1}' | grep -Fxq "$library"; then
                if pip uninstall -y "$library"; then
                    echo "✅ '$library' has been uninstalled successfully!"
                else
                    echo "❌ Uninstallation failed!"
                fi
            else
                echo "❌ The library '$library' doesn't exist already!"
            fi
            ;;
        3)
            echo -e "\nInstalled libraries:\n"
            pip list --format=columns | tail -n +3 | sort
            echo -e "\nPress Enter to continue..."
            read
            ;;
        4)
            while true; do
                echo "Choose an update option:"
                echo "1) Update a specific library"
                echo "2) Update the whole venv"
                echo "3) Back to main menu"
                read -p "Enter your choice: " update_choice

                clear

                case "$update_choice" in
                    1)
                        read -p "Enter the name of the library: " library
                        if pip install --upgrade "$library"; then
                            echo "✅ '$library' has been updated successfully!"
                        else
                            echo "❌ Update failed!"
                        fi
                        ;;
                    2)
                        if pip list --outdated --format=columns | awk 'NR>2 {print $1}' | xargs -n1 pip install -U; then
                            echo "✅ All outdated libraries have been updated!"
                        else
                            echo "❌ Update failed!"
                        fi
                        ;;
                    3)
                        break
                        ;;
                    *)
                        echo "❌ Invalid choice! Please enter a number between 1 and 3."
                        ;;
                esac

                echo -e "\nPress Enter to go back."
                read
                clear
            done
            ;;
        5)
            break
            ;;
        *)
            echo "❌ Invalid choice! Please enter a number between 1 and 5."
            ;;
    esac

    echo -e "\nPress Enter to continue or type 5 to exit."
    read exit_choice
    if [ "$exit_choice" == "5" ]; then
        break
    fi
    clear
done

deactivate
trap "" SIGPIPE
