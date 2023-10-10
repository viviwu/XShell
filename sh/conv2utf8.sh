#!/bin/bash

# 递归遍历当前路径下的文本文件
find . -type f \( -name "*.txt" -o -name "*.h" -o -name "*.cpp" -o -name "*.c" \) | while read -r file; do

    # 检查文件编码是否为UTF-8
    file_encoding=$(file -b --mime-encoding "$file")
    echo "file_encoding is: $file_encoding"
    if [[ $file_encoding != "utf-8" ]]; then
        echo "Converting file: $file"

        # 尝试以gb18030编码读取文件内容
        if iconv -f gb18030 -t utf-8 "$file" > /dev/null 2>&1; then
            # 读取成功，另存为UTF-8编码文件
            iconv -f gb18030 -t utf-8 "$file" > "${file}.utf8"
            echo "Converted successfully."
        else
            # 无法以gb18030编码读取文件内容，忽略
            echo "Ignoring file due to unsupported encoding."
        fi
    else
        echo "Ignoring utf-8 file: $file"
    fi

done

