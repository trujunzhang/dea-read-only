@echo off
echo ��ǰ�̷���%~d0
echo ��ǰ�̷���·����%~dp0
echo ��ǰ������ȫ·����%~f0
echo ��ǰ�̷���·���Ķ��ļ�����ʽ��%~sdp0
echo ��ǰCMDĬ��Ŀ¼��%cd%
pause



echo %APPDATA%

set emacs_cfg=%~dp0\.emacs

echo %emacs_cfg%

copy %emacs_cfg%  %APPDATA%\.emacs"

pause
