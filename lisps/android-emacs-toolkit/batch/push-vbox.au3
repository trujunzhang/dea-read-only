

RunApk()

Func RunApk()
	Sleep(100)
	Local $buildfile="e:\oksvn\Android\wanghao\wanghaoandroid\build.xml"
	Local $cmd = "ant -buildfile "&$buildfile&" debug install"
	ExeCmd($cmd)
	$cmd = "adb shell am start -n com.zxy.wanghao/com.zxy.wanghao.wanghaoactivity"
	ExeCmd($cmd)
	WinActivate("AndroidEmulator","")
	Sleep(100)
	Local $pos=WinGetPos("AndroidEmulator","")
	MouseMove($pos[0]+50,$pos[1]+100)
	MouseClick("left")
	
EndFunc   ;==>RunApk


Func ExeCmd($cmd)
	RunWait(@ComSpec & " /c " & $cmd)
	Sleep(100)
	TrayTip("RunApk", $cmd, 5)
EndFunc   ;==>ExeCmd
