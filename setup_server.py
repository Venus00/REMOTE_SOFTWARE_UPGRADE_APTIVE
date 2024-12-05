import re
import sys
import os

def replace_ip_in_files(ip_address):
    ip_pattern = r"\b\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\b"
    
    files = [
        "/home/aptive/remote_upgrade_project/playbook_22.yaml",
        "/home/aptive/remote_upgrade_project/scripts_files/meta-release",
        "/var/www/html/ubuntu/upgrade/meta-release",
        "/var/www/html/ubuntu/upgrade/meta-release-lts",
        "/home/aptive/remote_upgrade_project/scripts_files/sources.list",
        "/home/aptive/remote_upgrade_project/scripts_files/wifi_fix.sh"
    ]
    
    for file_path in files:
        if not os.path.isfile(file_path):
            print(f"File not found: {file_path}")
            continue

        with open(file_path, 'r') as file:
            content = file.read()

        modified_content = re.sub(ip_pattern, ip_address, content)

        with open(file_path, 'w') as file:
            file.write(modified_content)

        print(f"Replaced IPs in {file_path} with {ip_address}")

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python setup_server.py <ip_address>")
        sys.exit(1)

    new_ip_address = sys.argv[1]

    replace_ip_in_files(new_ip_address)