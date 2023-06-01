@echo off
setlocal enabledelayedexpansion

for %%F in ("[SPOTIFY-DOWNLOADER.COM]*") do (
    set "filename=%%~nxF"
    set "newname=!filename:[SPOTIFY-DOWNLOADER.COM]=!"
    ren "%%F" "!newname!"
)

endlocal
