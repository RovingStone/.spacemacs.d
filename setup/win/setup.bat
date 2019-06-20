@echo off

setlocal EnableDelayedExpansion

set INITIAL_CD=!CD!
echo Working directory is !CD!

set SCRIPT_DIR=%~dp0
echo Script dir is !SCRIPT_DIR!

set EMACS_DIR=0

:check_admin_rights
    echo Checking for administrator permissions
    net session >nul 2>&1
    if "!ERRORLEVEL!"=="0" goto check_admin_rights_
    echo ERROR: You need to run this script as an administrator
    goto failed
    :check_admin_rights_
    echo Administrator permissions ok

:emacs_path
    echo Looking for Emacs executable
    where /q $PATH:emacs
    if "!ERRORLEVEL!"=="0" (
        echo Found Emacs executable in PATH
        for %%i in (emacs.exe) do set EMACS_DIR=%%~dp$PATH:i
        goto emacs_path_
    )
    where /q "!INITIAL_CD!:emacs"
    if "!ERRORLEVEL!"=="0" (
        echo Found Emacs in current working directory
        for %%i in (emacs.exe) do set EMACS_DIR=%%~dp$INITIAL_CD:i
        goto emacs_path_add_to_path_
    ) else (
        echo Couldn't find Emacs executable nor in PATH nor in current working directory
        set /p SEARCH_PATH="Enter path to Emacs bin directory: "
        for %%i in (emacs.exe) do set EMACS_DIR=%%~dp$SEARCH_PATH:i
        if exist "!EMACS_DIR!/emacs.exe" goto emacs_path_add_to_path_
        echo ERROR: Wrong path
        goto failed
    )

    :emacs_path_add_to_path_
        set A=n
        set /p A="Add !EMACS_DIR! to PATH (y/[n])? "
        if /I "!A!" NEQ "y" goto emacs_path_
        echo Adding to PATH...
        echo !PATH!
        setx path "%PATH%;%EMACS_DIR%"
        goto emacs_path_
    
    :emacs_path_
        echo Emacs ok

:duties
    set A=n
    set /p A="Update global context menu (y/[n])? "
    if /I "!A!" EQU "y" call :update_context_menu !EMACS_DIR! !SCRIPT_DIR!

:success
    echo Setup DONE
    exit /b 0

:failed
    echo Setup FAILED
    exit /b 1

:update_context_menu
    setlocal
    set ARG1=%1
    set PATH_TO_EMACS=!ARG1:\=\\!
    set TEMPLATE=%2\reg_tmpl
    set OUTPUT=!TEMP!\emacs_global_context_menu.reg
    powershell -Command "(gc !TEMPLATE!) -replace 'PATH_TO_EMACS', '!PATH_TO_EMACS!' | Out-File !OUTPUT!"
    regedit /S !OUTPUT!
    endlocal
    exit /b