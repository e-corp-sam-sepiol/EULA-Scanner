![Linux term icon](https://static.thenounproject.com/png/3194876-200.png)

# EULA Scanner

This batch script is designed to automate the process of running multiple Python scripts (each in their own subfolder) and then collecting their text output into a single, consolidated file.

## What It Does

- Looks through each subfolder in the current directory.
- Runs every Python script it finds in those subfolders.
- After all scripts have finished, finds every `.txt` file output by those scripts.
- Merges all the `.txt` files into one master text file in the current directory.
- The merged file is named with the current date (e.g., `2025-05-28 - EULA Results.txt`).

## Why Use This?

If you have a bunch of Python scripts (for example, EULA or privacy scanners) organized by game or project in separate folders, this batch file saves you from having to run each one manually and then collect all their results. It’s especially useful for automating EULA scanning across multiple games.

## How To Use

1. Place this batch file in the root directory containing all your project/game subfolders.
2. Make sure each subfolder contains at least one Python script and that those scripts output their results as `.txt` files in the same subfolder.
3. Double-click the batch file or run it from the command line.
4. When it’s done, look for a file named like `YYYY-MM-DD - EULA Results.txt` in the root directory. This will contain all the merged results.

## Notes

- If a merged results file for today already exists, it will be overwritten.
- The script skips merging its own output file if it finds it in a subfolder.
- Requires Python to be installed and available in your system’s PATH.
- The script pauses for 5 seconds at the end so you can see the completion message before the window closes.

---
