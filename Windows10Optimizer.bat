@echo off
title Windows 10 Optimization Script BETA
setlocal EnableDelayedExpansion

:: Set colors
set "green=\033[32m"
set "red=\033[31m"
set "yellow=\033[33m"
set "cyan=\033[36m"
set "reset=\033[0m"

:menu
cls
echo %green%===================================
echo Windows 10 Optimization Script BETA
echo ===================================
echo.
echo 1. Clear temporary files
echo 2. Run Disk Cleanup
echo 3. Defragment drives
echo 4. Optimize virtual memory
echo 5. Optimize SSD drives
echo 6. Optimize network settings
echo 7. Optimize power settings
echo 8. Privacy settings (Disable telemetry)
echo 9. Advanced options
echo 10. UWP app optimization
echo 11. Disable other things
echo 12. Disable unneeded features
echo 13. Performance tweaks
echo 14. Visual tweaks
echo 0. Exit
echo.
set /p choice=Enter your choice: %reset%

if "%choice%"=="1" goto cleartemp
if "%choice%"=="2" goto diskcleanup
if "%choice%"=="3" goto defragdrive
if "%choice%"=="4" goto optimizevmem
if "%choice%"=="5" goto optimizessd
if "%choice%"=="6" goto optimizenetwork
if "%choice%"=="7" goto optimizepower
if "%choice%"=="8" goto privacysettings
if "%choice%"=="9" goto advancedoptions
if "%choice%"=="10" goto uwpoptimization
if "%choice%"=="11" goto disableotherthings
if "%choice%"=="12" goto disableunneededfeatures
if "%choice%"=="13" goto performancetweaks
if "%choice%"=="14" goto visualtweaks
if "%choice%"=="0" goto exit

echo %red%Invalid choice. Please try again.%reset%
pause
goto menu

:cleartemp
echo %cyan%Clearing temporary files...%reset%
del /q /f /s %TEMP%\*
rd /q /s %TEMP%
md %TEMP%
echo %green%Temporary files cleared.%reset%
echo.
pause
goto menu

:diskcleanup
echo %cyan%Running Disk Cleanup...%reset%
cleanmgr /sageset:65535 & cleanmgr /sagerun:65535
echo %green%Disk Cleanup completed.%reset%
echo.
pause
goto menu

:defragdrive
echo %cyan%Defragmenting drives...%reset%
defrag /c /h /u /v
echo %green%Defragmentation completed.%reset%
echo.
pause
goto menu

:optimizevmem
echo %cyan%Optimizing virtual memory...%reset%
wmic memphysical where (Speed!=null) call MaxMemBlockSize
echo %green%Virtual memory optimized.%reset%
echo.
pause
goto menu

:optimizessd
echo %cyan%Optimizing SSD drives...%reset%
fsutil behavior set DisableDeleteNotify 1
echo %green%SSD drives optimized.%reset%
echo.
pause
goto menu

:optimizenetwork
echo %cyan%Optimizing network settings...%reset%
netsh int tcp set global autotuninglevel=normal
netsh int tcp set heuristics disabled
netsh int tcp set global chimney=enabled
netsh int tcp set global rss=enabled
echo %green%Network settings optimized.%reset%
echo.
pause
goto menu

:optimizepower
echo %cyan%Optimizing power settings...%reset%
powercfg /hibernate off
powercfg /x -disk-timeout-ac 0
powercfg /x -disk-timeout-dc 0
echo %green%Power settings optimized.%reset%
echo.
pause
goto menu

:privacysettings
cls
echo %green%===================================
echo Privacy Settings (Disable Telemetry)
echo ===================================
echo.
echo 1. Disable all telemetry
echo 2. Disable specific telemetry components
echo 0. Back to main menu
echo.
set /p privacychoice=Enter your choice: %reset%

if "%privacychoice%"=="1" goto disablealltelemetry
if "%privacychoice%"=="2" goto disablespecifictelemetry
if "%privacychoice%"=="0" goto menu

echo %red%Invalid choice. Please try again.%reset%
pause
goto privacysettings

:disablealltelemetry
echo %cyan%Disabling all telemetry...%reset%
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f
echo %green%All telemetry disabled.%reset%
echo.
pause
goto menu

:disablespecifictelemetry
cls
echo %green%===================================
echo Disable Specific Telemetry Components
echo ===================================
echo.
echo 1. Disable Application telemetry
echo 2. Disable Inventory Data Collection
echo 3. Disable Browser Data Collection
echo 4. Disable Tailored Experiences
echo 0. Back to Privacy Settings
echo.
set /p telemetrychoice=Enter your choice: %reset%

if "%telemetrychoice%"=="1" goto disableapptelemetry
if "%telemetrychoice%"=="2" goto disableinventorydata
if "%telemetrychoice%"=="3" goto disablebrowserdata
if "%telemetrychoice%"=="4" goto disabletailoredexperiences
if "%telemetrychoice%"=="0" goto privacysettings

echo %red%Invalid choice. Please try again.%reset%
pause
goto disablespecifictelemetry

:disableapptelemetry
echo %cyan%Disabling Application telemetry...%reset%
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f
echo %green%Application telemetry disabled.%reset%
echo.
pause
goto disablespecifictelemetry

:disableinventorydata
echo %cyan%Disabling Inventory Data Collection...%reset%
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowInventoryCollector /t REG_DWORD /d 0 /f
echo %green%Inventory Data Collection disabled.%reset%
echo.
pause
goto disablespecifictelemetry

:disablebrowserdata
echo %cyan%Disabling Browser Data Collection...%reset%
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowBrowserDataCollection /t REG_DWORD /d 0 /f
echo %green%Browser Data Collection disabled.%reset%
echo.
pause
goto disablespecifictelemetry

:disabletailoredexperiences
echo %cyan%Disabling Tailored Experiences...%reset%
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v DisableTailoredExperiencesWithDiagnosticData /t REG_DWORD /d 1 /f
echo %green%Tailored Experiences disabled.%reset%
echo.
pause
goto disablespecifictelemetry

:advancedoptions
cls
echo %green%===================================
echo Advanced Options
echo ===================================
echo.
echo 1. Disable Superfetch service
echo 2. Disable Windows Search service
echo 3. Disable Windows Defender
echo 4. Disable Windows Update
echo 5. Disable Windows Firewall
echo 6. Disable Windows Insider Program
echo 7. Disable Windows Game Mode
echo 8. Disable Windows Sandbox
echo 9. Disable Windows Subsystem for Linux (WSL)
echo 0. Back to main menu
echo.
set /p advancedchoice=Enter your choice: %reset%

if "%advancedchoice%"=="1" goto disablesuperfetch
if "%advancedchoice%"=="2" goto disablesearch
if "%advancedchoice%"=="3" goto disabledefender
if "%advancedchoice%"=="4" goto disableupdate
if "%advancedchoice%"=="5" goto disablefirewall
if "%advancedchoice%"=="6" goto disableinsider
if "%advancedchoice%"=="7" goto disablegamemode
if "%advancedchoice%"=="8" goto disablesandbox
if "%advancedchoice%"=="9" goto disablewsl
if "%advancedchoice%"=="0" goto menu

echo %red%Invalid choice. Please try again.%reset%
pause
goto advancedoptions

:disablesuperfetch
echo %cyan%Disabling Superfetch service...%reset%
sc stop "SysMain" & sc config "SysMain" start=disabled
echo %green%Superfetch service disabled.%reset%
echo.
pause
goto advancedoptions

:disablesearch
echo %cyan%Disabling Windows Search service...%reset%
sc stop "WSearch" & sc config "WSearch" start=disabled
echo %green%Windows Search service disabled.%reset%
echo.
pause
goto advancedoptions

:disabledefender
echo %cyan%Disabling Windows Defender...%reset%
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableAntiSpyware /t REG_DWORD /d 1 /f
sc stop WinDefend & sc config WinDefend start=disabled
echo %green%Windows Defender disabled.%reset%
echo.
pause
goto advancedoptions

:disableupdate
echo %cyan%Disabling Windows Update...%reset%
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v NoAutoUpdate /t REG_DWORD /d 1 /f
sc stop wuauserv & sc config wuauserv start=disabled
echo %green%Windows Update disabled.%reset%
echo.
pause
goto advancedoptions

:disablefirewall
echo %cyan%Disabling Windows Firewall...%reset%
reg add "HKLM\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\StandardProfile" /v EnableFirewall /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\DomainProfile" /v EnableFirewall /t REG_DWORD /d 0 /f
sc stop MpsSvc & sc config MpsSvc start=disabled
echo %green%Windows Firewall disabled.%reset%
echo.
pause
goto advancedoptions

:disableinsider
echo %cyan%Disabling Windows Insider Program...%reset%
reg add "HKLM\SOFTWARE\Microsoft\WindowsSelfHost\UI\Strings" /v CBSafeURL /t REG_SZ /d "" /f
reg add "HKLM\SOFTWARE\Microsoft\WindowsSelfHost\UI\Strings" /v ContentDeliveryAllowed /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\WindowsSelfHost\UI\Strings" /v InsiderContentEnabled /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\WindowsSelfHost\UI\Strings" /v InsiderContentEnabledOverride /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\WindowsSelfHost\UI\Strings" /v InsiderContentEnabledOverride /t REG_DWORD /d 0 /f
echo %green%Windows Insider Program disabled.%reset%
echo.
pause
goto advancedoptions

:disablegamemode
echo %cyan%Disabling Windows Game Mode...%reset%
reg add "HKCU\Software\Microsoft\GameBar" /v AllowAutoGameMode /t REG_DWORD /d 0 /f
reg add "HKCU\System\GameConfigStore" /v GameMode /t REG_DWORD /d 0 /f
echo %green%Windows Game Mode disabled.%reset%
echo.
pause
goto advancedoptions

:disablesandbox
echo %cyan%Disabling Windows Sandbox...%reset%
dism /online /disable-feature /featurename:Containers-DisposableClientVM /remove
echo %green%Windows Sandbox disabled.%reset%
echo.
pause
goto advancedoptions

:disablewsl
echo %cyan%Disabling Windows Subsystem for Linux (WSL)...%reset%
dism /online /disable-feature /featurename:Microsoft-Windows-Subsystem-Linux /remove
echo %green%Windows Subsystem for Linux (WSL) disabled.%reset%
echo.
pause
goto advancedoptions

:uwpoptimization
cls
echo %green%===================================
echo UWP App Optimization
echo ===================================
echo.
echo 1. Remove provisioned UWP apps
echo 2. Remove all UWP apps (including system apps)
echo 3. Delete Microsoft Edge
echo 0. Back to main menu
echo.
set /p uwpchoice=Enter your choice: %reset%

if "%uwpchoice%"=="1" goto removeprovisioneduwp
if "%uwpchoice%"=="2" goto removealluwp
if "%uwpchoice%"=="3" goto deletemsedge
if "%uwpchoice%"=="0" goto menu

echo %red%Invalid choice. Please try again.%reset%
pause
goto uwpoptimization

:removeprovisioneduwp
echo %cyan%Removing provisioned UWP apps...%reset%
Get-AppxProvisionedPackage -online | Out-GridView -PassThru | Remove-AppxProvisionedPackage -online
echo %green%Provisioned UWP apps removed.%reset%
echo.
pause
goto uwpoptimization

:removealluwp
echo %cyan%Removing all UWP apps (including system apps)...%reset%
Get-AppxPackage -AllUsers | Remove-AppxPackage
echo %green%All UWP apps removed.%reset%
echo.
pause
goto uwpoptimization

:deletemsedge
echo %cyan%Deleting Microsoft Edge...%reset%
rd /s /q "%ProgramFiles(x86)%\Microsoft\Edge"
rd /s /q "%ProgramFiles%\Microsoft\Edge"
echo %green%Microsoft Edge deleted.%reset%
echo.
pause
goto uwpoptimization

:disableotherthings
cls
echo %green%===================================
echo Disable Other Things
echo ===================================
echo.
echo 1. Disable Cortana
echo 2. Disable Windows Tips
echo 3. Disable Sticky Keys
echo 4. Disable Filter Keys
echo 5. Disable Error Reporting
echo 6. Disable Location Sensor
echo 7. Disable Edge WebWidget
echo 0. Back to main menu
echo.
set /p disablechoice=Enter your choice: %reset%

if "%disablechoice%"=="1" goto disablecortana
if "%disablechoice%"=="2" goto disablewindowstips
if "%disablechoice%"=="3" goto disablestickeykeys
if "%disablechoice%"=="4" goto disablefilterkeys
if "%disablechoice%"=="5" goto disableerrorreporting
if "%disablechoice%"=="6" goto disablelocationsensor
if "%disablechoice%"=="7" goto disableedgewebwidget
if "%disablechoice%"=="0" goto menu

echo %red%Invalid choice. Please try again.%reset%
pause
goto disableotherthings

:disablecortana
echo %cyan%Disabling Cortana...%reset%
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v AllowCortana /t REG_DWORD /d 0 /f
echo %green%Cortana disabled.%reset%
echo.
pause
goto disableotherthings

:disablewindowstips
echo %cyan%Disabling Windows Tips...%reset%
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v DisableSoftLanding /t REG_DWORD /d 1 /f
echo %green%Windows Tips disabled.%reset%
echo.
pause
goto disableotherthings

:disablestickeykeys
echo %cyan%Disabling Sticky Keys...%reset%
reg add "HKCU\Control Panel\Accessibility\StickyKeys" /v Flags /t REG_STRING /d 506 /f
echo %green%Sticky Keys disabled.%reset%
echo.
pause
goto disableotherthings

:disablefilterkeys
echo %cyan%Disabling Filter Keys...%reset%
reg add "HKCU\Control Panel\Accessibility\FilterKeys" /v Flags /t REG_STRING /d 2 /f
echo %green%Filter Keys disabled.%reset%
echo.
pause
goto disableotherthings

:disableerrorreporting
echo %cyan%Disabling Error Reporting...%reset%
reg add "HKLM\SOFTWARE\Microsoft\Windows\Windows Error Reporting" /v Disabled /t REG_DWORD /d 1 /f
echo %green%Error Reporting disabled.%reset%
echo.
pause
goto disableotherthings

:disablelocationsensor
echo %cyan%Disabling Location Sensor...%reset%
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors" /v DisableLocation /t REG_DWORD /d 1 /f
echo %green%Location Sensor disabled.%reset%
echo.
pause
goto disableotherthings

:disableedgewebwidget
echo %cyan%Disabling Edge WebWidget...%reset%
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v WebWidgetPolicy /t REG_DWORD /d 2 /f
echo %green%Edge WebWidget disabled.%reset%
echo.
pause
goto disableotherthings

:disableunneededfeatures
cls
echo %green%===================================
echo Disable Unneeded Features
echo ===================================
echo.
echo 1. Disable Internet Explorer
echo 2. Disable Windows Media Player
echo 3. Disable Windows Fax and Scan
echo 4. Disable Windows Insider Service
echo 0. Back to main menu
echo.
set /p featurechoice=Enter your choice: %reset%

if "%featurechoice%"=="1" goto disableie
if "%featurechoice%"=="2" goto disablewmp
if "%featurechoice%"=="3" goto disablefaxscan
if "%featurechoice%"=="4" goto disableinsider
if "%featurechoice%"=="0" goto menu

echo %red%Invalid choice. Please try again.%reset%
pause
goto disableunneededfeatures

:disableie
echo %cyan%Disabling Internet Explorer...%reset%
dism /online /disable-feature /featurename:Internet-Explorer-Optional-amd64
echo %green%Internet Explorer disabled.%reset%
echo.
pause
goto disableunneededfeatures

:disablewmp
echo %cyan%Disabling Windows Media Player...%reset%
dism /online /disable-feature /featurename:MediaPlayback
echo %green%Windows Media Player disabled.%reset%
echo.
pause
goto disableunneededfeatures

:disablefaxscan
echo %cyan%Disabling Windows Fax and Scan...%reset%
dism /online /disable-feature /featurename:FaxServicesClientPackage
echo %green%Windows Fax and Scan disabled.%reset%
echo.
pause
goto disableunneededfeatures

:disableinsider
echo %cyan%Disabling Windows Insider Service...%reset%
dism /online /disable-feature /featurename:InsiderService
echo %green%Windows Insider Service disabled.%reset%
echo.
pause
goto disableunneededfeatures

:performancetweaks
cls
echo %green%===================================
echo Performance Tweaks
echo ===================================
echo.
echo 1. Enable extra performance tweaks
echo 2. Change DNS to 1.1.1.1 (Cloudflare)
echo 3. Change DNS to OpenDNS
echo 0. Back to main menu
echo.
set /p tweakchoice=Enter your choice: %reset%

if "%tweakchoice%"=="1" goto extraperformancetweaks
if "%tweakchoice%"=="2" goto cloudflaredns
if "%tweakchoice%"=="3" goto opendnsdns
if "%tweakchoice%"=="0" goto menu

echo %red%Invalid choice. Please try again.%reset%
pause
goto performancetweaks

:extraperformancetweaks
echo %cyan%Enabling extra performance tweaks...%reset%
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v DisablePagingExecutive /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v LargeSystemCache /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v EnablePMTUDiscovery /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v Tcp1323Opts /t REG_DWORD /d 3 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v GlobalMaxTcpWindowSize /t REG_DWORD /d 65535 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v TcpWindowSize /t REG_DWORD /d 65535 /f
echo %green%Extra performance tweaks enabled.%reset%
echo.
pause
goto performancetweaks

:cloudflaredns
echo %cyan%Changing DNS to 1.1.1.1 (Cloudflare)...%reset%
netsh interface ip set dns "Ethernet" static 1.1.1.1 primary
netsh interface ip add dns "Ethernet" 1.0.0.1 index=2
echo %green%DNS changed to 1.1.1.1 (Cloudflare).%reset%
echo.
pause
goto performancetweaks

:opendnsdns
echo %cyan%Changing DNS to OpenDNS...%reset%
netsh interface ip set dns "Ethernet" static 208.67.222.222 primary
netsh interface ip add dns "Ethernet" 208.67.220.220 index=2
echo %green%DNS changed to OpenDNS.%reset%
echo.
pause
goto performancetweaks

:visualtweaks
cls
echo %green%===================================
echo Visual Tweaks
echo ===================================
echo.
echo 1. Disable transparency effects
echo 2. Disable window animations
echo 3. Disable menu animations
echo 4. Disable cursor shadow
echo 5. Disable aero shake
echo 0. Back to main menu
echo.
set /p visualchoice=Enter your choice: %reset%

if "%visualchoice%"=="1" goto disabletransparency
if "%visualchoice%"=="2" goto disablewindowanim
if "%visualchoice%"=="3" goto disablemenuanim
if "%visualchoice%"=="4" goto disablecursorshadow
if "%visualchoice%"=="5" goto disableaeroshake
if "%visualchoice%"=="0" goto menu

echo %red%Invalid choice. Please try again.%reset%
pause
goto visualtweaks

:disabletransparency
echo %cyan%Disabling transparency effects...%reset%
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v EnableTransparency /t REG_DWORD /d 0 /f
echo %green%Transparency effects disabled.%reset%
echo.
pause
goto visualtweaks

:disablewindowanim
echo %cyan%Disabling window animations...%reset%
reg add "HKCU\Control Panel\Desktop\WindowMetrics" /v MinAnimate /t REG_DWORD /d 0 /f
echo %green%Window animations disabled.%reset%
echo.
pause
goto visualtweaks

:disablemenuanim
echo %cyan%Disabling menu animations...%reset%
reg add "HKCU\Control Panel\Desktop\MenuShowDelay" /v MenuShowDelay /t REG_DWORD /d 0 /f
echo %green%Menu animations disabled.%reset%
echo.
pause
goto visualtweaks

:disablecursorshadow
echo %cyan%Disabling cursor shadow...%reset%
reg add "HKCU\Control Panel\Cursors" /v CursorShadow /t REG_DWORD /d 0 /f
echo %green%Cursor shadow disabled.%reset%
echo.
pause
goto visualtweaks

:disableaeroshake
echo %cyan%Disabling aero shake...%reset%
reg add "HKCU\Software\Policies\Microsoft\Windows\Explorer" /v NoWindowMinimizingShortcuts /t REG_DWORD /d 1 /f
echo %green%Aero shake disabled.%reset%
echo.
pause
goto visualtweaks

:exit
echo %yellow%Exiting...%reset%
pause
exit
