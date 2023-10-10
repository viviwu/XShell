@echo off
chcp 65001 > nul

for /r %%F in (*.txt *.h *.c *.cpp *.py) do (
    echo Processing: %%F
    find /i "ï»¿" "%%F" > nul
    if errorlevel 1 (
        echo File is already UTF-8 encoded.
    ) else (
        echo File is not UTF-8 encoded. Converting to UTF-8...
        type "%%F" > temp.txt
        move /y temp.txt "%%F" > nul
        echo File converted to UTF-8.
    )
)

echo All files processed.
pause