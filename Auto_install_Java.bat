@echo off
echo Checking for Java installation...

set INSTALL_DIR=F:\Java\
set JDK_INSTALLER=22
set JDK_EXE=jdk_windows_x64_bin.exe


REM Try to get Java version
java -version 2>nul
if %errorlevel% neq 0 (
    echo Java is not installed.

    echo Downloading JDK %JDK_INSTALLER%...
    echo https://download.oracle.com/java/%JDK_INSTALLER%/latest/jdk-%JDK_INSTALLER%_windows-x64_bin.exe
    powershell -Command "Invoke-WebRequest -Uri https://download.oracle.com/java/%JDK_INSTALLER%/latest/jdk-%JDK_INSTALLER%_windows-x64_bin.exe -OutFile %JDK_EXE%"

    REM Install JDK silently (modify the path if needed)
    echo Installing Java...
    start /wait %JDK_EXE% /s D=%INSTALL_DIR%

    :: Remove the downloaded exe file
    del %JDK_EXE%

    REM Confirm installation
    echo Java installation completed.
    java -version
)


echo Java is installed.
pause