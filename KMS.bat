
@echo off

mode con cols=100 lines=30 & color 1f



>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

rem --> If error flag set, we do not have admin.  

if '%errorlevel%' NEQ '0' (  

    echo ��ȡ����ԱȨ����,���UAC����,��ѡ������...

    goto UACPrompt  

) else ( goto gotAdmin )  

:UACPrompt  

    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"  

    echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"   

    "%temp%\getadmin.vbs"

    exit /B  

:gotAdmin  

    if exist "%temp%\getadmin.vbs" ( del "%temp%\getadmin.vbs" )  

    pushd "%CD%"  

    CD /D "%~dp0"



cls

:start

echo\

echo	����������ѡ��(���Թ���Աģʽ����):

echo\

echo	1������ Windows 10 רҵ��    2������ Windows 8 רҵ��     3������ Windows 7 רҵ��    

echo	4������ Office 2016	 5������Visio 2016 	6���鿴 Windows ����״̬  

echo	7��Visio ���۰�תVOL��	8��Office 2016 ���۰�תVOL��

set /P var=":"

if %var%==1 goto 10

if %var%==2 goto 8

if %var%==3 goto 7

if %var%==4 goto office

if %var%==5 goto visio

if %var%==6 goto look

if %var%==7 goto visioR2V

if %var%==8 goto officeR2V

:10

cls

echo\

echo	���ڰ�װ��Ʒ��Կ�����е����밴[ȷ��]����...

echo\

slmgr -ipk W269N-WFGWX-YVC9B-4J6C9-T83GX

echo\

echo	��������KMS��������ַ�����е����밴[ȷ��]����...

echo\

slmgr -skms kms.cangshui.net

echo\

echo	�����Զ�����...

echo\

slmgr -ato

goto exit


:visioR2V

cls

if exist "%ProgramFiles%\Microsoft Office\Office16\ospp.vbs" cd /d "%ProgramFiles%\Microsoft Office\Office16"
if exist "%ProgramFiles(x86)%\Microsoft Office\Office16\ospp.vbs" cd /d "%ProgramFiles(x86)%\Microsoft Office\Office16"

echo ��������Visio2016���ۼ���...
cscript ospp.vbs /rearm
echo ���ڰ�װ KMS ���֤...
for /f %%x in ('dir /b ..\root\Licenses16\visio???vl_kms*.xrm-ms') do cscript ospp.vbs /inslic:"..\root\Licenses16\%%x" >nul
echo ���ڰ�װ MAK ���֤...
for /f %%x in ('dir /b ..\root\Licenses16\visio???vl_mak*.xrm-ms') do cscript ospp.vbs /inslic:"..\root\Licenses16\%%x" >nul
cscript ospp.vbs /inpkey:PD3PC-RHNGV-FXJ29-8JK7D-RJRJK
goto exit

:officeR2V

cls

if exist "%ProgramFiles%\Microsoft Office\Office16\ospp.vbs" cd /d "%ProgramFiles%\Microsoft Office\Office16"
if exist "%ProgramFiles(x86)%\Microsoft Office\Office16\ospp.vbs" cd /d "%ProgramFiles(x86)%\Microsoft Office\Office16"

echo ��������Office2016���ۼ���...
cscript ospp.vbs /rearm
echo ���ڰ�װ KMS ���֤...
for /f %%x in ('dir /b ..\root\Licenses16\proplusvl_kms*.xrm-ms') do cscript ospp.vbs /inslic:"..\root\Licenses16\%%x" >nul
echo ���ڰ�װ MAK ���֤...
for /f %%x in ('dir /b ..\root\Licenses16\proplusvl_mak*.xrm-ms') do cscript ospp.vbs /inslic:"..\root\Licenses16\%%x" >nul
cscript ospp.vbs /inpkey:XQNVK-8JYDB-WJ9W3-YJ8YR-WFG99
goto exit

:office

cls

if exist "%ProgramFiles%\Microsoft Office\Office16\ospp.vbs" cd /d "%ProgramFiles%\Microsoft Office\Office16"
if exist "%ProgramFiles(x86)%\Microsoft Office\Office16\ospp.vbs" cd /d "%ProgramFiles(x86)%\Microsoft Office\Office16"

echo\

echo	���ڰ�װ��Ʒ��Կ�����е����밴[ȷ��]����...

echo\

cscript .\ospp.vbs /inpkey:XQNVK-8JYDB-WJ9W3-YJ8YR-WFG99 

echo\

echo	��������KMS��������ַ�����е����밴[ȷ��]����...

echo\

cscript ospp.vbs /sethst:kms.cangshui.net

echo\

echo	�����Զ�����...

echo\

cscript ospp.vbs /act

goto exit



:visio

cls

cd "C:\Program Files (x86)\Microsoft Office\Office16"

echo\

echo	���ڰ�װ��Ʒ��Կ�����е����밴[ȷ��]����...

echo\

cscript ospp.vbs /inpkey:PD3PC-RHNGV-FXJ29-8JK7D-RJRJK 

echo\

echo	��������KMS��������ַ�����е����밴[ȷ��]����...

echo\

cscript ospp.vbs /sethst:kms.cangshui.net

echo\

echo	�����Զ�����...

echo\

cscript ospp.vbs /act

goto exit





:8

cls

echo\

echo	���ڰ�װ��Ʒ��Կ�����е����밴[ȷ��]����...

echo\

slmgr -ipk NG4HW-VH26C-733KW-K6F98-J8CK4

echo\

echo	��������KMS��������ַ�����е����밴[ȷ��]����...

echo\

slmgr -skms kms.cangshui.net

echo\

echo	�����Զ�����...

echo\

slmgr -ato

goto exit





:7

cls

echo\

echo	���ڰ�װ��Ʒ��Կ�����е����밴[ȷ��]����...

echo\

slmgr -ipk FJ82H-XT6CR-J8D7P-XQJJ2-GPDD4

echo\

echo	��������KMS��������ַ�����е����밴[ȷ��]����...

echo\

slmgr -skms kms.cangshui.net

echo\

echo	�����Զ�����...

echo\

slmgr -ato

goto exit







:look

cls

echo\

echo	��ע��鿴��������

slmgr.vbs -dlv

goto exit





:exit

echo\

echo\

echo	��������˳�

pause>nul 

start https://garybear.cn/ & exit