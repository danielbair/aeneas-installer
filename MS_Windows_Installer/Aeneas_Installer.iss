; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "aeneas tools"
#define MyAppVersion "1.7.3.0"
#define MyAppPublisher "Daniel Bair"
#define MyAppURL "http://www.danielbair.com/"
#define MyAppInstallDir "C:\aeneas-install"
#define MyAppFileName "aeneas-windows-setup-1.7.3.0_2"

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{A15A9B64-C0EF-4E13-926C-0C60A8FA9FBC}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
UsePreviousAppDir=yes
DefaultDirName={#MyAppInstallDir}
DisableDirPage=yes
DisableWelcomePage=no
DefaultGroupName={#MyAppName}
AllowNoIcons=yes
DisableProgramGroupPage=yes
LicenseFile=LICENSE.txt
InfoBeforeFile=README.txt
OutputDir=.\
OutputBaseFilename={#MyAppFileName}
Compression=lzma
SolidCompression=yes
ChangesEnvironment=yes
;SignTool=mysigntool

[Messages]
WelcomeLabel2=This will install aeneas 1.7.3 on your computer.%n%naeneas is a Python library and a set of tools for automated audio and text synchronization.%n%nIn addition to aeneas, the following independent programs necessary for running aeneas are contained in this installer:%n1. FFmpeg%n2. eSpeak%n3. Python%n%nIt is recommended that you close all other applications before continuing.

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Registry]
Root: HKLM; Subkey: "SYSTEM\CurrentControlSet\Control\Session Manager\Environment"; ValueType: expandsz; ValueName: "Path"; ValueData: "C:\Python37-32\Scripts;{olddata}"; Components: python; Check: NeedsAddPath('C:\Python37-32\Scripts')
Root: HKLM; Subkey: "SYSTEM\CurrentControlSet\Control\Session Manager\Environment"; ValueType: expandsz; ValueName: "Path"; ValueData: "C:\Python37-32\;{olddata}"; Components: python; Check: NeedsAddPath('C:\Python37-32\')
Root: HKLM; Subkey: "SYSTEM\CurrentControlSet\Control\Session Manager\Environment"; ValueType: expandsz; ValueName: "Path"; ValueData: "{olddata};{pf32}\FFmpeg\bin"; Components: ffmpeg; Check: NeedsAddPath(ExpandConstant('{pf32}\FFmpeg\bin'))
Root: HKLM; Subkey: "SYSTEM\CurrentControlSet\Control\Session Manager\Environment"; ValueType: expandsz; ValueName: "Path"; ValueData: "{olddata};{pf32}\eSpeak\command_line"; Components: espeak; Check: NeedsAddPath(ExpandConstant('{pf32}\eSpeak\command_line'))

[Components]
Name: "ffmpeg"; Description: "Install FFmpeg 4.2"; ExtraDiskSpaceRequired: 111181824; Types: full compact custom; Flags: fixed
Name: "espeak"; Description: "Install eSpeak 1.48.04"; ExtraDiskSpaceRequired: 11223040; Types: full compact custom; Flags: fixed
Name: "python"; Description: "Install Python 3.7.4"; ExtraDiskSpaceRequired: 106450944; Types: full compact custom; Flags: fixed
Name: "bs4"; Description: "Install Python Module BeautifulSoup4 4.8.0"; ExtraDiskSpaceRequired: 3400000; Types: full compact custom; Flags: fixed
Name: "lxml"; Description: "Install Python Module lxml 4.4.1"; ExtraDiskSpaceRequired: 0; Types: full compact custom; Flags: fixed
Name: "numpy"; Description: "Install Python Module NumPy 1.17.1"; ExtraDiskSpaceRequired: 0; Types: full compact custom; Flags: fixed
Name: "aeneas"; Description: "Install Python Module aeneas 1.7.3.0"; ExtraDiskSpaceRequired: 0; Types: full compact custom; Flags: fixed

[Files]
Source: "aeneas-1.7.3.0-cp37-cp37m-win32.whl"; DestDir: "{app}"; Components: aeneas; Flags: ignoreversion
Source: "numpy-1.17.1-cp37-cp37m-win32.whl"; DestDir: "{app}"; Components: numpy; Flags: ignoreversion
Source: "lxml-4.4.1-cp37-cp37m-win32.whl"; DestDir: "{app}"; Components: lxml; Flags: ignoreversion
Source: "beautifulsoup4-4.8.0-py3-none-any.whl"; DestDir: "{app}"; Components: bs4; Flags: ignoreversion
Source: "soupsieve-1.9.3-py2.py3-none-any.whl"; DestDir: "{app}"; Components: bs4; Flags: ignoreversion
Source: "pip-19.2.3-py2.py3-none-any.whl"; DestDir: "{app}"; Components: python; Flags: ignoreversion
Source: "python-3.7.4.exe"; DestDir: "{app}"; Components: python; Flags: ignoreversion
Source: "setup_ffmpeg-4.2.exe"; DestDir: "{app}"; Components: ffmpeg; Flags: ignoreversion
Source: "setup_espeak-1.48.04.exe"; DestDir: "{app}"; Components: espeak; Flags: ignoreversion
Source: "espeak.lib"; DestDir: "{app}"; Components: espeak; Flags: ignoreversion
Source: "aeneas_check_setup.bat"; DestDir: "{app}"; Components: aeneas; Flags: ignoreversion
Source: "install_packages.bat"; DestDir: "{app}"; Components: aeneas; Flags: ignoreversion
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Icons]
Name: "{group}\{cm:UninstallProgram,{#MyAppName}}"; Filename: "{uninstallexe}"

[Run]
Filename: "{app}\setup_ffmpeg-4.2.exe"; Parameters: "/SILENT"; Description: "Install FFmpeg 4.2"; Components: ffmpeg; Flags: shellexec waituntilterminated
Filename: "{app}\setup_espeak-1.48.04.exe"; Parameters: "/SILENT"; Description: "Install eSpeak 1.48.04"; Components: espeak; Flags: shellexec waituntilterminated
Filename: "{app}\python-3.7.4.exe"; Parameters: "/PASSIVE InstallAllUsers=1 TargetDir=C:\Python37-32 PrependPath=1"; Description: "Install Python 3.7.4"; Components: python; Flags: shellexec waituntilterminated
Filename: "{app}\install_packages.bat"; Description: "Install Aeneas 1.7.3 and dependencies"; Components: aeneas; Flags: shellexec waituntilterminated
Filename: "{app}\aeneas_check_setup.bat"; Description: "Check Aeneas Setup"; Components: aeneas; Flags: shellexec waituntilterminated

[UninstallRun]
Filename: "{pf32}\FFmpeg\unins000.exe"; Parameters: "/SILENT"; Components: ffmpeg; Flags: shellexec waituntilterminated
Filename: "{pf32}\eSpeak\unins000.exe"; Parameters: "/SILENT"; Components: espeak; Flags: shellexec waituntilterminated
Filename: "{sys}\MSIEXEC.EXE"; Parameters: "/PASSIVE /X {app}\python-3.7.4.exe"; Components: python; Flags: shellexec waituntilterminated

[UninstallDelete]
Type: filesandordirs; Name: "C:\Python37-32"; Components: python
Type: filesandordirs; Name: "{sys}\espeak.dll"; Components: espeak
Type: filesandordirs; Name: "{app}";

[Code]
function NeedsAddPath(Param: string): boolean;
var
  OrigPath: string;
begin
  if not RegQueryStringValue(HKEY_LOCAL_MACHINE,
    'SYSTEM\CurrentControlSet\Control\Session Manager\Environment',
    'Path', OrigPath)
  then begin
    Result := True;
    exit;
  end;
  // look for the path with leading and trailing semicolon
  // Pos() returns 0 if not found
  Result := Pos(';' + Param + ';', ';' + OrigPath + ';') = 0;
end;
