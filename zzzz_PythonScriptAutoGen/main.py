# Python script to create an Arma 3 SQF file
import os
import sys
from colorama import Fore, Style

import ScriptStorage as script_storage

def get_working_directory() -> str:
    # If the script is compiled, use the directory of the compiled executable
    if getattr(sys, 'frozen', False):
        return os.path.dirname(sys.executable)
    # If the script is not compiled, use the directory of the script
    else:
        return os.path.dirname(os.path.abspath(__file__))

# Set the current working directory to the script folder
os.chdir(get_working_directory())

def check_file_name_has_folder(file_name: str) -> str:
    # Check if the file name contains a folder
    if "\\" in file_name:
        splited_array = file_name.split("\\")
        
        # Pop the last element to get the file name
        file_name = splited_array.pop()

        # Join the folder name
        folder_name = "\\".join(splited_array)

        # Create the folder
        create_folder(folder_name)

        # Join back the file name
        file_name = os.path.join(folder_name, file_name)

    return file_name

def create_folder(folder_name: str) -> None:
    # Create an folder with exist_ok=True to avoid errors if the folder already exists
    os.makedirs(folder_name, exist_ok=True)
    print(f"{folder_name} created successfully!")

def create_sqf_file(file_name: str, sqf_script: str = "") -> None:
    # SQF script content
    sqf_script = sqf_script or """ // Example SQF script content """
    
    # Write the SQF script to a file
    with open(file_name, 'w') as file:
        file.write(sqf_script)

    print(f"{file_name} created successfully!")

def main(heals: str, onloadmission: str, onloadname: str, author: str, playerside: str) -> None:
    filename, script = script_storage.on_player_respawn_sqf
    # Check if the file name contains a folder
    filename = check_file_name_has_folder(filename)
    script = script.replace("||||heals||||", heals)
    create_sqf_file(filename, script)

    filename, script = script_storage.description_ext
    # Check if the file name contains a folder
    filename = check_file_name_has_folder(filename)
    script = script.replace("||||onLoadMission||||", onloadmission)
    script = script.replace("||||onLoadName||||", onloadname)
    script = script.replace("||||author||||", author)
    create_sqf_file(filename, script)

    filename, script = script_storage.init_player_local_sqf
    # Check if the file name contains a folder
    filename = check_file_name_has_folder(filename)
    create_sqf_file(filename, script)

    filename, script = script_storage.init_server_sqf
    # Check if the file name contains a folder
    filename = check_file_name_has_folder(filename)
    script = script.replace("||||playerside||||", playerside)
    create_sqf_file(filename, script)

    filename, script = script_storage.custom_sqf
    # Check if the file name contains a folder
    filename = check_file_name_has_folder(filename)
    create_sqf_file(filename, script)

    for fnc_var in script_storage.function_array:
        filename, script = fnc_var
        # Check if the file name contains a folder
        filename = check_file_name_has_folder(filename)
        create_sqf_file(filename, script)

def get_user_input() -> tuple:
    is_config = input("Do you want to use the default values? [y/n]: ") or "y"
    if is_config.lower() == "y":
        print(f"{Fore.GREEN}Using default values, please change the values in the script if needed!{Style.RESET_ALL}")
        return "1", "Main Operations", "Operation Name", "Author", "west"

    heal = input("Enter the heal value, default is 1: ") or "1"
    onloadmission = input("Enter the mission type, default is Main Operations: ") or "Main Operations"
    onloadname = input("Enter the mission name, default is Operation Name: ") or "Operation Name"
    author = input("Enter your name, default is Author: ") or "Author"

    playerside = input("Enter the player side, [west, east, guer, civ], default is west: ") or "west"
    while playerside not in ["west", "east", "guer", "civ"]:
        print(f"{Fore.RED}Invalid player side, please enter a valid player side!{Style.RESET_ALL}")
        playerside = input("Enter the player side, [west, east, guer, civ], default is west: ") or "west"

    return heal, onloadmission, onloadname, author, playerside

# Run the function
if __name__ == "__main__":
    heal, onloadmission, onloadname, author, playerside = get_user_input()
    main(heal, onloadmission, onloadname, author, playerside)

    print(f"{Fore.GREEN}All files created successfully!{Style.RESET_ALL}")
    input("Press any key to exit... ")