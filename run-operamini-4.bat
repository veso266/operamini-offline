@echo off

REM Parse the version and display it on title
rem Temporary file to store the Java version output
set "tempfile=%temp%\javaversion.txt"

rem Get the Java version information and store it in the temporary file
java -version 2> "%tempfile%"

rem Extract the version number from the file
for /f "tokens=3 delims= " %%i in ('findstr /i "version" "%tempfile%"') do (
    set "JAVA_VERSION=%%i"
)

rem Remove the quotes from the version string
set "JAVA_VERSION=%JAVA_VERSION:"=%"

rem Delete the temporary file
del "%tempfile%"

rem Set the title of the Command Prompt window
title Java: %JAVA_VERSION%

REM Run our emulator
java -classpath microemulator.jar;fourone-device-operamini-4.jar org.microemu.app.Main --device com/opera/browser/device/fourone/device.xml opera-mini-4.4.28684-advanced-en-us.jar


