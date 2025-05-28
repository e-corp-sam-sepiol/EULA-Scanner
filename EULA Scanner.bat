

@echo off
setlocal enabledelayedexpansion

REM This batch script looks at the current directory, and subsequently runs each python script in every nested folder within the current path. Once the python scripts have finished running, this script grabs the *.txt file output(s) from the python script(s) and merges them into a single .txt file output in the current PATH 

REM This was created to help automate scanning for EULAs associated to installed games

REM === Get current date in YYYY-MM-DD format using WMIC ===
for /f %%a in ('wmic os get LocalDateTime ^| findstr /r "^[0-9]"') do set ldt=%%a
set "YYYY=%ldt:~0,4%"
set "MM=%ldt:~4,2%"
set "DD=%ldt:~6,2%"
set "currentDate=%YYYY%-%MM%-%DD%"

set "mergedFile=%currentDate% - EULA Results.txt"

REM === Remove old merged file if it exists ===
if exist "%mergedFile%" del "%mergedFile%"

REM === Run Python scripts in each immediate subdirectory ===
for /d %%D in (*) do (
    if exist "%%D\*.py" (
        echo Processing directory: %%D
        pushd "%%D"
        for %%F in (*.py) do (
            echo Running %%F...
            python "%%F"
        )
        popd
    )
)

REM === Merge all .txt files from subdirectories, excluding the merged output file ===
for /d %%D in (*) do (
    for %%T in ("%%D\*.txt") do (
        if /I not "%%~nxT"=="%mergedFile%" (
            type "%%T" >> "%mergedFile%"
            echo. >> "%mergedFile%"  REM Add a newline between files
        )
    )
)

echo.
echo Merged all .txt files into "%mergedFile%"
sleep 5
exit
