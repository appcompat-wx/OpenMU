@echo off
setlocal EnableExtensions

set "ROOT=%~dp0src"

if not exist "%ROOT%" (
    echo [ERROR] Directory not found: "%ROOT%"
    exit /b 1
)

echo Cleaning bin/obj folders under: "%ROOT%"
echo.

set "FOUND=0"
for /f "delims=" %%D in ('dir "%ROOT%" /ad /b /s ^| findstr /r /i "\\bin$ \\obj$"') do (
    if exist "%%D" (
        set "FOUND=1"
        echo Deleting: "%%D"
        rmdir /s /q "%%D"
    )
)

echo.
if "%FOUND%"=="0" (
    echo No bin/obj folders found.
) else (
    echo Cleanup completed.
)

endlocal
