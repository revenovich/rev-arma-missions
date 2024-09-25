import requests

with requests.get("http://revoluxiant.io.vn:8888/arma3_files/dist/main.exe", stream=True) as r:
    r.raise_for_status()
    with open("main.exe", 'wb') as f:
        for chunk in r.iter_content(chunk_size=8192):
            f.write(chunk)

print("main.exe downloaded successfully!")