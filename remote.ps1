$pc = Read-Host -Prompt 'Select PC'

Invoke-WmiMethod -ComputerName $pc -name Create -Class win32_process -ArgumentList "powershell.exe New-Item -Path 'Registry::HKEY_LOCAL_MACHINE\Software\Wow6432Node\Google\Chrome\Extensions\cjpalhdlnbpafiamejdnhcphjbkeiagm' -Force | Out-Null"
Start-Sleep 1
Invoke-WmiMethod -ComputerName $pc -name Create -Class win32_process -ArgumentList "powershell.exe New-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINE\Software\Wow6432Node\Google\Chrome\Extensions\cjpalhdlnbpafiamejdnhcphjbkeiagm' -Name update_url -Value https://clients2.google.com/service/update2/crx -PropertyType String -Force | Out-Null"
Start-Sleep 1
Invoke-WmiMethod -ComputerName $pc -name Create -Class win32_process -ArgumentList "powershell.exe New-Item -Path 'Registry::hklm\system\currentcontrolset\control\terminal server' -Force | Out-Null"
Start-Sleep 1
Invoke-WmiMethod -ComputerName $pc -name Create -Class win32_process -ArgumentList "powershell.exe New-ItemProperty -Path 'Registry::hklm\system\currentcontrolset\control\terminal server' -Name fDenyTSConnections -Value 0 -PropertyType DWORD -Force | Out-Null"
Start-Sleep 1
Write-Output audiomode:i:1 > C:\session.rdp

mstsc C:\session.rdp /v:$pc
