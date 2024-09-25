# Python script to create an Arma 3 SQF file
import os

import ScriptStorage as script_storage

# Set the current working directory to the script folder
os.chdir(os.path.dirname(os.path.abspath(__file__)))

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

# Run the function
if __name__ == "__main__":
    filename, script = script_storage.on_player_respawn_sqf
    # Check if the file name contains a folder
    filename = check_file_name_has_folder(filename)
    script = script.replace("||||heals||||", "1")
    create_sqf_file(filename, script)

    filename, script = script_storage.description_ext
    # Check if the file name contains a folder
    filename = check_file_name_has_folder(filename)
    script = script.replace("||||onLoadMission||||", "Placeholder, replace this with your mission type, e.g. Main Operations, Side Operations, etc.")
    script = script.replace("||||onLoadName||||", "Placeholder, replace this with your mission name, e.g. Operation Name")
    script = script.replace("||||author||||", "Placeholder, replace this with your name")
    create_sqf_file(filename, script)

    filename, script = script_storage.init_player_local_sqf
    # Check if the file name contains a folder
    filename = check_file_name_has_folder(filename)
    create_sqf_file(filename, script)

    filename, script = script_storage.init_server_sqf
    # Check if the file name contains a folder
    filename = check_file_name_has_folder(filename)
    script = script.replace("||||playerside||||", "west")
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