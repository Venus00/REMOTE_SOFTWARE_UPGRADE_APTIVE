
import yaml
import pandas as pd
import yaml
excel_file_path = 'HMI_Plants_Totale_Installations.xlsx'
sheet_name = 'M3'
ip_column_name = 'Full IP Adresse'
yaml_file_path = 'inventory/inventory.yaml'


def excel_to_yaml(excel_file, sheet, yaml_file):
    
    df = pd.read_excel(excel_file, sheet_name=sheet)
    
    inventory={}
    inventory['all'] = {'hosts': {}, 'vars': {}}
    for i, row in df.iterrows():
        ip = row[ip_column_name]
        user = row.get('ansible_user', 'nextronic')  
        password = row.get('ansible_password', '2899100*-+') 
        
        inventory['all']['hosts']["ihm"+str(i)] = {
            'ansible_host': ip,
            'ansible_user': user,
            'ansible_password': password
        }
    
    with open(yaml_file, 'w') as file:
        yaml.dump(inventory, file, default_flow_style=False)

excel_to_yaml(excel_file_path, sheet_name, yaml_file_path)