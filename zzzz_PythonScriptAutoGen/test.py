import time
import requests
from bs4 import BeautifulSoup
from InquirerPy import inquirer

exit_time = 5
is_error = False

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
    exit_time = 5
    is_error = True

if not is_error:
    for map_name in selected_maps:
        file_url = url + map_name
        
        try:
            with requests.get(file_url, stream=True) as r:
                r.raise_for_status()
                with open(f"maps/{map_name}", 'wb') as f:
                    for chunk in r.iter_content(chunk_size=8192):
                        f.write(chunk)
            
            print(f"{map_name} downloaded successfully!")
        except requests.exceptions.HTTPError as e:
            print(f"Error: {e}")
            exit_time = 10
        except Exception as e:
            print(f"Error: {e}")
            exit_time = 15

    print("All selected maps downloaded successfully!")

while True:
    for i in range(exit_time):
        print(f"Exiting in {exit_time - i} seconds...", end="\r")

        time.sleep(1)
    break
