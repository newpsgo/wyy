REM ����powershell����yaml
Powershell.exe -executionpolicy remotesigned -File  .\download.ps1

setlocal enabledelayedexpansion
chcp 65001
 
REM orginalFileԭʼҪ�������ļ��������ļ���ע���滻���ļ��в�����ð�ţ����������ԡ������޸ı��ű���forѭ����delims=����ð��Ϊ�������ļ���û�г��ֵķ��ţ����в����ǵ��ںţ�<>��Ҫ��ת���ַ�^����д��delims=^<��
set orginalFile=oldsub.yaml
REM outputFileָ���滻�ַ�����������ļ�
set outputFile=sub.yaml
REM Ҫ�滻��ԭʼ�ַ���
set oldStr=github.com/freefq
REM �滻����ַ���
set newStr=rincol.tk
REM ָ���滻�ҵ��ĵڼ����ַ�����0��ָȫ���滻
set /a number=0
goto replace
 
 
:replace
set /a i=0
for /f "tokens=* delims=:" %%i in (%orginalFile%) do (
	set "a=%%i"
	if %number% == 0 (
		set "b=!a:%oldStr%=%newStr%!"
	) else (
		set "b=!a!"
		if not "!a!" == "!a:%oldStr%=%newStr%!" (
			set /a i+=1
			if %number% == !i! (
				set "b=!a:%oldStr%=%newStr%!"
			)
		)
	)
	REM ���ĳ������Ϊ�ո�����ո�����ĵ��ļ��е�����������echo is on ����echo is off
	echo !b!>>%outputFile%
)

pause