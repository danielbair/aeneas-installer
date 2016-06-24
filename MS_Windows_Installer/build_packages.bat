@echo off

echo %PATH% >> C:\Windows\Temp\PATH.bak
IF EXIST "C:\Program Files (x86)" GOTO WIN64PATH
:WIN32PATH
  set PF32=C:\Program Files
  (call )
  GOTO ENDIF
:WIN64PATH
  set PF32=C:\Program Files (x86)
  (call )
:ENDIF

C:\Python27\python -m pip install --upgrade pip
C:\Python27\python -m pip install --upgrade wheel
C:\Python27\python -m pip install beautifulsoup4
C:\Python27\python -m pip install lxml
C:\Python27\python -m pip install numpy
C:\Python27\python -m pip install aeneas

C:\Python27\python -m pip download pip
C:\Python27\python -m pip download beautifulsoup4
C:\Python27\python -m pip download lxml
C:\Python27\python -m pip download numpy==1.10.1
C:\Python27\python -m pip download aeneas


"%PF32%\7-Zip\7z.exe" x numpy-1.10.1.zip -aoa
cd numpy-1.10.1
C:\Python27\python setup.py bdist_wheel
copy dist\numpy-1.10.1-cp27-cp27m-win32.whl ..\
cd ..

C:\Python27\python -m pip install numpy-1.10.1-cp27-cp27m-win32.whl

"%PF32%\7-Zip\7z.exe" e aeneas-1.5.0.3.tar.gz -aoa
"%PF32%\7-Zip\7z.exe" x aeneas-1.5.0.3.tar -aoa
cd aeneas-1.5.0.3
C:\Python27\python setup.py bdist_wheel
copy dist\aeneas-1.5.0.3-cp27-cp27m-win32.whl ..\
cd ..

IF NOT EXIST "%cd%\python-2.7.11.msi" (
  echo Downloading Python 2.7.11...
  cscript.exe /NoLogo wget.vbs "https://www.python.org/ftp/python/2.7.11/python-2.7.11.msi" "%cd%\python-2.7.11.msi"
)

IF NOT EXIST "%cd%\setup_espeak-1.48.04.exe" (
  echo Downloading eSpeak...
  cscript.exe /NoLogo wget.vbs "http://internode.dl.sourceforge.net/project/espeak/espeak/espeak-1.48/setup_espeak-1.48.04.exe" "%cd%\setup_espeak-1.48.04.exe"
)

IF NOT EXIST "%cd%\ffmpeg-latest-win32-static.7z" (
  echo Downloading FFmpeg...
  cscript.exe /NoLogo wget.vbs "https://ffmpeg.zeranoe.com/builds/win32/static/ffmpeg-latest-win32-static.7z" "%cd%\ffmpeg-latest-win32-static.7z"
)

"%PF32%\7-Zip\7z.exe" x ffmpeg-*-win32-static.7z -aoa
move /y ffmpeg-*-win32-static ffmpeg-3.0.2

"%PF32%\Inno Setup 5\ISCC.exe" FFmpeg_Installer.iss

"%PF32%\Inno Setup 5\ISCC.exe" Aeneas_Installer.iss
