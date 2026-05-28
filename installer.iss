[Setup]
AppId={{24aeb69a-a1e2-4f9d-951d-fb2ee584c6aa}}
AppName=Flet Windows Lamzing
AppVersion=1.0.0
AppPublisher=Mechanshil
DefaultDirName={autopf}\Flet Windows Lamzing
DefaultGroupName=Flet Windows Lamzing
OutputBaseFilename=flet_windows_lamzing-setup-v1.0.0
OutputDir=output
Compression=lzma
SolidCompression=yes
ArchitecturesAllowed=x64compatible
ArchitecturesInstallIn64BitMode=x64compatible

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Files]
; Main executable
Source: "build\flutter\build\windows\x64\runner\Release\flet_windows_lamzing.exe"; DestDir: "{app}"; Flags: ignoreversion

; All DLL files
Source: "build\flutter\build\windows\x64\runner\Release\*.dll"; DestDir: "{app}"; Flags: ignoreversion

; All four directories
Source: "build\flutter\build\windows\x64\runner\Release\data\*"; DestDir: "{app}\data"; Flags: recursesubdirs createallsubdirs
Source: "build\flutter\build\windows\x64\runner\Release\site-packages\*"; DestDir: "{app}\site-packages"; Flags: recursesubdirs createallsubdirs
Source: "build\flutter\build\windows\x64\runner\Release\Lib\*"; DestDir: "{app}\Lib"; Flags: recursesubdirs createallsubdirs
Source: "build\flutter\build\windows\x64\runner\Release\DLLs\*"; DestDir: "{app}\DLLs"; Flags: recursesubdirs createallsubdirs

[Icons]
Name: "{group}\Flet Windows Lamzing"; Filename: "{app}\flet_windows_lamzing.exe"
Name: "{commondesktop}\Flet Windows Lamzing"; Filename: "{app}\flet_windows_lamzing.exe"

[Run]
Filename: "{app}\flet_windows_lamzing.exe"; Description: "Launch Flet Windows Lamzing"; Flags: postinstall skipifsilent

[UninstallDelete]
Type: filesandordirs; Name: "{app}"