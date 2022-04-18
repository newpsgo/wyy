REM 运行powershell下载yaml
Powershell.exe -executionpolicy remotesigned -File  .\download.ps1

setlocal enabledelayedexpansion
chcp 65001
 
REM orginalFile原始要操作的文件，单个文件。注：替换的文件中不能有冒号，否则结果不对。或者修改本脚本中for循环的delims=：中冒号为其他在文件中没有出现的符号，其中不能是等于号，<>需要加转义字符^，即写成delims=^<。
set orginalFile=oldsub.yaml
REM outputFile指定替换字符串后，输出的文件
set outputFile=sub.yaml
REM 要替换的原始字符串
set oldStr=github.com/freefq
REM 替换后的字符串
set newStr=rincol.tk
REM 指定替换找到的第几个字符串，0是指全部替换
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
	REM 如果某行内容为空格或多个空格，输出的到文件中的那行内容是echo is on 或者echo is off
	echo !b!>>%outputFile%
)

pause