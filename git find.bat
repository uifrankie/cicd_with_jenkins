@echo off

rem BEGIN - Find Git

rem Read the Git for Windows installation path from the Registry.
for %%k in (HKCU HKLM) do (
    for %%w in (\ \Wow6432Node\) do (
        for /f "skip=2 delims=: tokens=1*" %%a in ('reg query "%%k\SOFTWARE%%wMicrosoft\Windows\CurrentVersion\Uninstall\Git_is1" /v InstallLocation 2^> nul') do (
            for /f "tokens=3" %%z in ("%%a") do (
                set GIT=%%z:%%b
                goto GIT_FOUND
            )
        )
    )
)

echo Git not found
pause
exit

:GIT_FOUND
echo Found Git at "%GIT%"

rem Make sure Bash is in PATH (for running scripts).
set PATH=%GIT%bin;%PATH%

rem End - Find Git
