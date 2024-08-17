@echo off
setlocal enabledelayedexpansion

:: Define Maven version and installation directory
set MAVEN_VERSION=3.9.8
set INSTALL_DIR=F:\Apache\Maven

:: Download Maven
echo Downloading Apache Maven %MAVEN_VERSION%...
powershell -Command "Invoke-WebRequest -Uri https://downloads.apache.org/maven/maven-3/%MAVEN_VERSION%/binaries/apache-maven-%MAVEN_VERSION%-bin.zip -OutFile maven.zip"

:: Extract Maven
echo Extracting Maven...
powershell -Command "Expand-Archive -Path maven.zip -DestinationPath %INSTALL_DIR%"

:: Remove the downloaded zip file
del maven.zip

:: Set up environment variables
set MAVEN_HOME=%INSTALL_DIR%\apache-maven-%MAVEN_VERSION%
set PATH=%MAVEN_HOME%\bin;%PATH%

:: Add Maven to the system PATH permanently
echo Adding Maven to system PATH...
setx MAVEN_HOME "%MAVEN_HOME%" /M
setx PATH "%PATH%" /M

:: Verify Maven installation
echo Verifying Maven installation...
mvn --version

echo Maven %MAVEN_VERSION% installed successfully.

endlocal
pause
