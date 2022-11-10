@ECHO off
ECHO Hello, welcome to my fuckin awsome 1 click SQLObjectsBackup program.
ECHO.

SETLOCAL  enabledelayedexpansion
:: COUNTING LINES IN CONFIGFILE
	SET _File=BackupConfigFile.txt
	SET /a _Lines=0
	myfind=(Find "" /v /c C:\Users\patryk.rostkowski\Desktop\BackupConfigFile.txt)
	SET /a _Lines=%myfind% -6
	
:: MAIN LOOP, THROUGH NO OF LINES
	FOR /l %%x in (7 , 7, %_Lines%) do (		
		SET skip=%%x
		ECHO !skip!
		::IF %skip% leq %_Lines% (
		::	ECHO TAK )
		::	ELSE ( ECHO NIE )
		::	PAUSE
	)
PAUSE