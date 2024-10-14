import subprocess
import sys
import os
import shutil

def install_package(package):
    try:
        # Check if the package is installed
        __import__(package)
        print(f"'{package}' is already installed.")
    except ImportError:
        # If the package is not installed, install it
        print(f"'{package}' is not installed. Installing now...")
        subprocess.check_call([sys.executable, "-m", "pip", "install", package])

install_package('requests')
install_package('beautifulsoup4')
install_package('inquirerpy')
install_package('py7zr')
install_package('rarfile')
install_package('tqdm')

for i in range(5):
    print("\n")

import requests
import zipfile
import py7zr
import rarfile
from tqdm import tqdm
from bs4 import BeautifulSoup
from InquirerPy import inquirer

# Set the current working directory to the script folder
os.chdir(os.path.dirname(os.path.abspath(__file__)))

def move_folder_up_one_level(folder_path):
    # Get the parent directory of the folder to move
    parent_dir = os.path.dirname(folder_path)
    grandparent_dir = os.path.dirname(parent_dir)

    # Move the folder up one level
    new_location = os.path.join(grandparent_dir, os.path.basename(folder_path))
    
    # Move the folder
    shutil.move(folder_path, new_location)
    print(f"Moved folder {folder_path} to {new_location}")

# Decompress the downloaded map files
def decompress_map_files(map_name: str) -> None:
    # Check if the file is a 7z, zip, or rar file
    extension = map_name.split('.')[-1]
    if extension == "7z":
        with py7zr.SevenZipFile(map_name, mode='r') as z:
            z.extractall(f"{map_name.split('.')[0]}_extracted")
    elif extension == "zip":
        with zipfile.ZipFile(map_name, 'r') as zip_ref:
            zip_ref.extractall(f"{map_name.split('.')[0]}_extracted")
    elif extension == "rar":
        with rarfile.RarFile(map_name, 'r') as z:
            z.extractall(f"{map_name.split('.')[0]}_extracted")
    else:
        print(f"Unsupported file format: {extension}")

    move_folder_up_one_level(f"{map_name.split('.')[0]}_extracted\\{map_name.split('.')[0]}")

    # Remove the extracted folder
    shutil.rmtree(f"{map_name.split('.')[0]}_extracted")

    # Remove the compressed file
    os.remove(map_name)
    
    print(f"{map_name} decompressed successfully!")

# URL to the directory listing
url = "http://revoluxiant.io.vn:8888/rev_storage/arma3files/maps/"

# Fetch the HTML content of the URL
response = requests.get(url)
soup = BeautifulSoup(response.text, 'html.parser')

# Create a list of map names (skipping directories)
map_names = [link.get('href') for link in soup.find_all('a') if not link.get('href').endswith('/')]

# Use InquirerPy to show the list and allow user to select one or multiple maps
selected_maps = inquirer.checkbox(
    message="Select map(s) to download",
    choices=map_names,
    instruction="Use arrow keys to navigate, space to select, and enter to confirm."
).execute()

# Check if any maps were selected
if not selected_maps:
    print("No maps selected. Exiting.")
    exit()

try:
    for map_name in selected_maps:
        file_url = url + map_name
    
        response = requests.get(file_url, stream=True)
        total_size = int(response.headers.get('content-length', 0))
        block_size = 8192

        with tqdm(total=total_size, unit='B', unit_scale=True, unit_divisor=1024, desc=map_name, ascii=True) as pbar:
            with open(f"{map_name}", 'wb') as f:
                for data in response.iter_content(block_size):
                    pbar.update(len(data))
                    f.write(data)
        print(f"{map_name} downloaded successfully!")
    print("All selected maps downloaded successfully!")

    print("Decompressing map files...")
    # Decompress all downloaded map files
    for map_name in selected_maps:
        print(f"Decompressing {map_name}...")
        decompress_map_files(map_name)

except requests.exceptions.HTTPError as e:
    print(f"Error: {e}")
    exit()
except Exception as e:
    print(f"Error: {e}")
    exit()
