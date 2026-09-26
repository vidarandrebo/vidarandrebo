@echo off
setlocal

set "COPILOT_DIR=%USERPROFILE%\.copilot"
set "REPO_DIR=%~dp0"

if not exist "%COPILOT_DIR%" (
    mkdir "%COPILOT_DIR%" || exit /b 1
)

mklink "%COPILOT_DIR%\copilot-instructions.md" "%REPO_DIR%instructions\common.md"
if errorlevel 1 exit /b 1

mklink /D "%COPILOT_DIR%\instructions" "%REPO_DIR%instructions\languages"
if errorlevel 1 exit /b 1

mklink /D "%COPILOT_DIR%\skills" "%REPO_DIR%skills"
if errorlevel 1 exit /b 1

endlocal
