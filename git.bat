@echo OFF
rem This script reads all arguments and replaces:
rem   'c:' shift to '/mnt/c'
rem   '\' shift to '/'
rem After changes, it calls win-git script shell sending all changed parameters
rem as a arguments to performed inside wsl using git.
setlocal ENABLEDELAYEDEXPANSION
rem Perform WINDOWS->LINUX syntax replacements.
set git_params=%*
if NOT [%1] == [] (
    rem set git_params=%*
    set git_params=%git_params:\=/%
    set git_params=%git_params:C:=/mnt/c%
)
rem C:\Windows\sysnative\wsl.exe -l -c "windows-git %git_params%"
rem C:\Windows\System32\wsl.exe windows-git %git_params%
call wsl.exe win-git %git_params%