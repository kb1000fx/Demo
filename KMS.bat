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
echo	4������ Office 2016    5���鿴 Windows ����״̬  
set /P var=":"
if %var%==1 goto 10
if %var%==2 goto 8
if %var%==3 goto 7
if %var%==4 goto office
if %var%==5 goto look

:10
cls
echo\
echo	���ڰ�װ��Ʒ��Կ�����е����밴[ȷ��]����...
echo\
slmgr -ipk W269N-WFGWX-YVC9B-4J6C9-T83GX
echo\
echo	��������KMS��������ַ�����е����밴[ȷ��]����...
echo\
slmgr -skms kms.garybear.tk
echo\
echo	�����Զ�����...
echo\
slmgr -ato
goto exit


:office
cls
cd "C:\Program Files (x86)\Microsoft Office\Office16"
echo\
echo	���ڰ�װ��Ʒ��Կ�����е����밴[ȷ��]����...
echo\
cscript ospp.vbs /inpkey:XQNVK-8JYDB-WJ9W3-YJ8YR-WFG99 
echo\
echo	��������KMS��������ַ�����е����밴[ȷ��]����...
echo\
cscript ospp.vbs /sethst:kms.garybear.tk
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
slmgr -skms kms.garybear.tk
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
slmgr -skms kms.garybear.tk
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
start http://blog.garybear.cn/ & exit