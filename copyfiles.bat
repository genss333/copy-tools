@echo off
setlocal enabledelayedexpansion

:: ไฟล์ที่เก็บรายชื่อไฟล์ (แต่ละบรรทัดเป็น path เต็ม)
set "listFile=files.txt"

:: ต้นทาง base ที่ต้องการตัดออก (no trailing backslash)
set "sourceRoot=C:\Users\tussp"

:: โฟลเดอร์ปลายทางหลัก (no trailing backslash)
set "targetRoot=target"

for /f "usebackq delims=" %%F in ("%listFile%") do (
    echo Processing: %%F

    :: full path ของไฟล์ (%%~fF = fully qualified path, ไม่มี double-quote)
    set "filePath=%%~fF"

    :: drive+path ของไฟล์ (มี trailing backslash)
    set "relPath=%%~dpF"

    :: ตัด sourceRoot ออก (ต้องเขียน sourceRoot ให้ตรงกับต้นทาง)
    set "relPath=!relPath:%sourceRoot%\=!"

    :: กรณีมี leading backslash ให้ตัดออก (ปลอดภัย)
    if "!relPath:~0,1!"=="\" set "relPath=!relPath:~1!"

    :: สร้างโฟลเดอร์ปลายทาง (ใส่ backslash ระหว่าง targetRoot กับ relPath)
    mkdir "%targetRoot%\!relPath!" >nul 2>&1

    :: คัดลอกไฟล์เข้าโฟลเดอร์นั้น
    copy "!filePath!" "%targetRoot%\!relPath!" /Y >nul

    echo Copied to: %targetRoot%\!relPath!
)

echo Done!
pause
