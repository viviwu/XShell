#!/bin/bash

# 函数：将文件转换为UTF-8编码格式
convert_to_utf8() {
    file="$1"

    # 获取文件的原编码
    encoding=$(file -I "$file" | awk -F'charset=' '{print $2}' | tr -d '\n')

    # 检查文件是否为文本文件
    if [[ $encoding == "binary" ]]; then
        echo "跳过二进制文件：$file"
        return
    fi
    
    echo "转换文件编码为UTF-8：$file"

    # 备份文件
    cp "$file" "${file}.bak"

    # 以原编码格式打开文件，并将其保存为UTF-8编码格式
    iconv -f "$encoding" -t UTF-8 "${file}.bak" > "$file"

    # 删除备份文件
    rm "${file}.bak"
}

# 遍历当前目录及其递归子文件夹中的文本文件，并进行转换
find . -type f \( -name "*.txt" -o -name "*.c" -o -name "*.cpp" -o -name "*.h" \) -print0 | while IFS= read -r -d '' file; do
    convert_to_utf8 "$file"
done

echo "文件编码转换完成。"