# Documentation

### installation
```bash
git clone https://github.com/genss333/copy-tools.git
```

### Setup config
แก้ไขตามตัวอย่าง
```txt
:: ไฟล์ที่เก็บรายชื่อไฟล์ (แต่ละบรรทัดเป็น path เต็ม)
set "listFile=files.txt"

:: ต้นทาง base ที่ต้องการตัดออก (no trailing backslash)
set "sourceRoot=C:\Users\tussp"

:: โฟลเดอร์ปลายทางหลัก (no trailing backslash)
set "targetRoot=target"
```

### Copy files path
เปิด tools menu Nuget package manager แล้ววาง
```bash
$paths = $DTE.Documents | ForEach-Object { try { $_.FullName } catch {} } | Where-Object { $_ } | Sort-Object -Unique; ($paths -join "`r`n") | clip; "Copied $($paths.Count) paths to clipboard."
```
จากนั้นให้นำไปวางที่ `files.tsxt`
