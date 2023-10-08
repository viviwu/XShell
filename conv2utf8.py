#!/usr/bin/env python3
import os
import shutil
import codecs

def convert_encoding(file_path):
    try:
        with open(file_path, 'r', encoding='utf-8') as f:
            content = f.read()
        
        # 若文件编码不是UTF-8，则尝试以GB18030编码读取
        if codecs.encode(content, 'gb18030').decode('gb18030') == content:
            print(f"Converting file: {file_path}")
            backup_path = file_path + '.bak'
            shutil.copy2(file_path, backup_path)  # 备份原文件
            
            # 重新打开文件并以UTF-8编码保存
            with open(file_path, 'w', encoding='utf-8') as f:
                f.write(content)
            
            print(f"Converted successfully. Backup file: {backup_path}")
        else:
            print(f"Ignoring file: {file_path} (Unsupported encoding)")

    except UnicodeDecodeError:
        print(f"Ignoring file: {file_path} (UnicodeDecodeError)")

def traverse_directory(directory):
    for root, dirs, files in os.walk(directory):
        for file in files:
            file_path = os.path.join(root, file)
            if file.endswith(('.txt', '.h', '.cpp', '.c')):
                convert_encoding(file_path)

# 当前路径
current_path = os.getcwd()

# 递归遍历当前路径下的文本文件
traverse_directory(current_path)
