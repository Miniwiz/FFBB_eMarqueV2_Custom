; Inno Setup script for e-Marque V2 (NW.js desktop app)
; Build with: ISCC.exe installer\setup.iss
; Produces installer\build\e-Marque_v2_Setup_<version>.exe

#define MyAppName "e-Marque V2"
#define MyAppVersion "1.2.64"
#define MyAppPublisher "Galeax"
#define MyAppExeName "e-Marque_v2.exe"
#define RootDir "..\"

[Setup]
AppId={{B4A1E6B0-6E3A-4B8E-9B6B-8E6E6E0E6E6A}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppPublisher={#MyAppPublisher}
DefaultDirName={autopf}\{#MyAppName}
DefaultGroupName={#MyAppName}
DisableProgramGroupPage=yes
UninstallDisplayIcon={app}\{#MyAppExeName}
OutputDir=build
OutputBaseFilename=e-Marque_v2_Setup_{#MyAppVersion}
SetupIconFile={#RootDir}icon.ico
Compression=lzma2/max
SolidCompression=yes
ArchitecturesAllowed=x64compatible
ArchitecturesInstallIn64BitMode=x64compatible
PrivilegesRequired=lowest
PrivilegesRequiredOverridesAllowed=dialog

[Languages]
Name: "french"; MessagesFile: "compiler:Languages\French.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"

[Files]
; Main executable and runtime binaries
Source: "{#RootDir}e-Marque_v2.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#RootDir}notification_helper.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#RootDir}nw.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#RootDir}node.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#RootDir}nw_elf.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#RootDir}d3dcompiler_47.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#RootDir}ffmpeg.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#RootDir}libEGL.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#RootDir}libGLESv2.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#RootDir}icudtl.dat"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#RootDir}natives_blob.bin"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#RootDir}v8_context_snapshot.bin"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#RootDir}nw_100_percent.pak"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#RootDir}nw_200_percent.pak"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#RootDir}resources.pak"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#RootDir}icon.ico"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#RootDir}credits.html"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#RootDir}package.json"; DestDir: "{app}"; Flags: ignoreversion
; Application code
Source: "{#RootDir}www\*"; DestDir: "{app}\www"; Flags: ignoreversion recursesubdirs createallsubdirs
; NW.js runtime support folders
Source: "{#RootDir}locales\*"; DestDir: "{app}\locales"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "{#RootDir}swiftshader\*"; DestDir: "{app}\swiftshader"; Flags: ignoreversion recursesubdirs createallsubdirs
; Node runtime modules required at runtime (getmac, node-webkit-fdialogs, ...)
Source: "{#RootDir}node_modules\*"; DestDir: "{app}\node_modules"; Flags: ignoreversion recursesubdirs createallsubdirs

[Icons]
Name: "{group}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{group}\{cm:UninstallProgram,{#MyAppName}}"; Filename: "{uninstallexe}"
Name: "{autodesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent
