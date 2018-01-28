; Script generated by the Inno Script Studio Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!
; This file is now in Parallels under Y:/clean3/SquareDesk/SquareDesk-DEV/test123
; after compile, result will be in "Y:\clean3\Win32Installers\SquareDeskP_X.Y.Z_setup.exe"

#define MyAppName "SquareDesk"
#define MyAppVersion "0.8.3"
#define MyAppPublisher "Zenstar Software"
#define MyAppURL "http://www.squaredesk.net"
#define MyAppExeName "SquareDesk.exe"
#define DeployDirectory "c:\cygwin\home\mpogue\deploySquareDesk"

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
; NOTE: two { is correct at the beginning of the AppId!
AppId={{21D4CCE3-5B7E-42AF-8BCD-9F2F7D10581E}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={pf}\{#MyAppName}
DefaultGroupName={#MyAppName}
AllowNoIcons=yes
OutputDir=Y:\clean3\Win32Installers
;OutputBaseFilename=setup
OutputBaseFilename={#MyAppName}_{#MyAppVersion}_setup
Compression=lzma
SolidCompression=yes
SetupIconFile={#DeployDirectory}\desk1d.ico

; after compile, result will be in "C:\sdesk_out\SquareDeskPlayer_X.Y.Z_setup.exe"

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked
Name: "quicklaunchicon"; Description: "{cm:CreateQuickLaunchIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked; OnlyBelowVersion: 0,6.1

[Files]
Source: {#DeployDirectory}\5365a.dic; DestDir: "{app}"; Flags: ignoreversion
Source: {#DeployDirectory}\allcalls.csv; DestDir: "{app}"; Flags: ignoreversion
Source: {#DeployDirectory}\bass.dll; DestDir: "{app}"; Flags: ignoreversion
Source: {#DeployDirectory}\bass_fx.dll; DestDir: "{app}"; Flags: ignoreversion
Source: {#DeployDirectory}\bassmix.dll; DestDir: "{app}"; Flags: ignoreversion
Source: {#DeployDirectory}\bearer\*; DestDir: "{app}\bearer"; Flags: ignoreversion
Source: {#DeployDirectory}\cuesheet2.css; DestDir: "{app}"; Flags: ignoreversion
; intentionally not deploying D3Dcompiler_47.dll
Source: {#DeployDirectory}\desk1d.ico; DestDir: "{app}"; Flags: ignoreversion
Source: {#DeployDirectory}\icudt54.dll; DestDir: "{app}"; Flags: ignoreversion
Source: {#DeployDirectory}\icuin54.dll; DestDir: "{app}"; Flags: ignoreversion
Source: {#DeployDirectory}\icuuc54.dll; DestDir: "{app}"; Flags: ignoreversion
Source: {#DeployDirectory}\imageformats\*; DestDir: "{app}\imageformats"; Flags: ignoreversion
Source: {#DeployDirectory}\libeay32.dll; DestDir: "{app}"; Flags: ignoreversion
Source: {#DeployDirectory}\libEGL.dll; DestDir: "{app}"; Flags: ignoreversion
Source: {#DeployDirectory}\libGLESV2.dll; DestDir: "{app}"; Flags: ignoreversion
Source: {#DeployDirectory}\lyrics.template.html; DestDir: "{app}"; Flags: ignoreversion
Source: {#DeployDirectory}\patter.template.html; DestDir: "{app}"; Flags: ignoreversion
Source: {#DeployDirectory}\minified\*; DestDir: "{app}\minified"; Flags: ignoreversion recursesubdirs
Source: {#DeployDirectory}\msvcp120.dll; DestDir: "{app}"; Flags: ignoreversion
Source: {#DeployDirectory}\msvcr120.dll; DestDir: "{app}"; Flags: ignoreversion
Source: {#DeployDirectory}\msvcp140.dll; DestDir: "{app}"; Flags: ignoreversion
Source: {#DeployDirectory}\opengl32sw.dll; DestDir: "{app}"; Flags: ignoreversion
Source: {#DeployDirectory}\platforminputcontexts\*; DestDir: "{app}\platforminputcontexts"; Flags: ignoreversion
Source: {#DeployDirectory}\plus.jsgf; DestDir: "{app}"; Flags: ignoreversion
Source: {#DeployDirectory}\pocketsphinx.dll; DestDir: "{app}"; Flags: ignoreversion
Source: {#DeployDirectory}\pocketsphinx_continuous.exe; DestDir: "{app}"; Flags: ignoreversion
Source: {#DeployDirectory}\position\*; DestDir: "{app}\position"; Flags: ignoreversion
Source: {#DeployDirectory}\printsupport\*; DestDir: "{app}\printsupport"; Flags: ignoreversion
Source: {#DeployDirectory}\qmltooling\*; DestDir: "{app}\qmltooling"; Flags: ignoreversion
Source: {#DeployDirectory}\resources\*; DestDir: "{app}\resources"; Flags: ignoreversion
Source: {#DeployDirectory}\scenegraph\*; DestDir: "{app}\scenegraph"; Flags: ignoreversion
Source: {#DeployDirectory}\ps; DestDir: "{app}"; Flags: ignoreversion
; intentionally not deploying opengl32sw.dll
Source: {#DeployDirectory}\iconengines\qsvgicon.dll; DestDir: "{app}\iconengines"; Flags: ignoreversion
Source: {#DeployDirectory}\platforms\qwindows.dll; DestDir: "{app}\platforms"; Flags: ignoreversion
Source: {#DeployDirectory}\plugins\imageformats\qico.dll; DestDir: "{app}\plugins\imageformats"; Flags: ignoreversion
Source: {#DeployDirectory}\sqldrivers\qsqlite.dll; DestDir: "{app}\sqldrivers"; Flags: ignoreversion
Source: {#DeployDirectory}\qsqlite.dll; DestDir: "{app}"; Flags: ignoreversion
Source: {#DeployDirectory}\quazip.dll; DestDir: "{app}"; Flags: ignoreversion

Source: {#DeployDirectory}\Qt5Core.dll; DestDir: "{app}"; Flags: ignoreversion
Source: {#DeployDirectory}\Qt5Gui.dll; DestDir: "{app}"; Flags: ignoreversion
;Source: {#DeployDirectory}\Qt5Multimedia.dll; DestDir: "{app}"; Flags: ignoreversion
;Source: {#DeployDirectory}\Qt5MultimediaWidgets.dll; DestDir: "{app}"; Flags: ignoreversion
Source: {#DeployDirectory}\Qt5Network.dll; DestDir: "{app}"; Flags: ignoreversion
;Source: {#DeployDirectory}\Qt5OpenGL.dll; DestDir: "{app}"; Flags: ignoreversion
Source: {#DeployDirectory}\Qt5Positioning.dll; DestDir: "{app}"; Flags: ignoreversion
Source: {#DeployDirectory}\Qt5PrintSupport.dll; DestDir: "{app}"; Flags: ignoreversion
Source: {#DeployDirectory}\Qt5Qml.dll; DestDir: "{app}"; Flags: ignoreversion
Source: {#DeployDirectory}\Qt5Quick.dll; DestDir: "{app}"; Flags: ignoreversion
Source: {#DeployDirectory}\Qt5QuickWidgets.dll; DestDir: "{app}"; Flags: ignoreversion
Source: {#DeployDirectory}\Qt5SerialPort.dll; DestDir: "{app}"; Flags: ignoreversion
;Source: {#DeployDirectory}\Qt5Sensors.dll; DestDir: "{app}"; Flags: ignoreversion
Source: {#DeployDirectory}\Qt5Sql.dll; DestDir: "{app}"; Flags: ignoreversion
Source: {#DeployDirectory}\Qt5WebChannel.dll; DestDir: "{app}"; Flags: ignoreversion
;Source: {#DeployDirectory}\Qt5WebKit.dll; DestDir: "{app}"; Flags: ignoreversion
Source: {#DeployDirectory}\Qt5WebEngineCore.dll; DestDir: "{app}"; Flags: ignoreversion
Source: {#DeployDirectory}\Qt5WebEngineWidgets.dll; DestDir: "{app}"; Flags: ignoreversion
Source: {#DeployDirectory}\QtWebEngineProcess.exe; DestDir: "{app}"; Flags: ignoreversion
Source: {#DeployDirectory}\Qt5Svg.dll; DestDir: "{app}"; Flags: ignoreversion
Source: {#DeployDirectory}\Qt5Widgets.dll; DestDir: "{app}"; Flags: ignoreversion

Source: {#DeployDirectory}\sd_calls.dat; DestDir: "{app}"; Flags: ignoreversion
Source: {#DeployDirectory}\sdlib.dll; DestDir: "{app}"; Flags: ignoreversion
;Source: {#DeployDirectory}\sdtty.exe; DestDir: "{app}"; Flags: ignoreversion
Source: {#DeployDirectory}\soundfx\*; DestDir: "{app}\soundfx"; Flags: ignoreversion
Source: {#DeployDirectory}\sphinxbase.dll; DestDir: "{app}"; Flags: ignoreversion
Source: {#DeployDirectory}\SquareDesk.exe; DestDir: "{app}"; Flags: ignoreversion
Source: {#DeployDirectory}\ssleay32.dll; DestDir: "{app}"; Flags: ignoreversion
Source: {#DeployDirectory}\tag.dll; DestDir: "{app}"; Flags: ignoreversion
Source: {#DeployDirectory}\tidy.dll; DestDir: "{app}"; Flags: ignoreversion
Source: {#DeployDirectory}\vcruntime140.dll; DestDir: "{app}"; Flags: ignoreversion
Source: {#DeployDirectory}\zlib1.dll; DestDir: "{app}"; Flags: ignoreversion

Source: {#DeployDirectory}\models\en-us\feat.params; DestDir: "{app}\models\en-us\"; Flags: ignoreversion
Source: {#DeployDirectory}\models\en-us\mdef; DestDir: "{app}\models\en-us\"; Flags: ignoreversion
Source: {#DeployDirectory}\models\en-us\means; DestDir: "{app}\models\en-us\"; Flags: ignoreversion
Source: {#DeployDirectory}\models\en-us\noisedict; DestDir: "{app}\models\en-us\"; Flags: ignoreversion
Source: {#DeployDirectory}\models\en-us\sendump; DestDir: "{app}\models\en-us\"; Flags: ignoreversion
Source: {#DeployDirectory}\models\en-us\transition_matrices; DestDir: "{app}\models\en-us\"; Flags: ignoreversion
Source: {#DeployDirectory}\models\en-us\variances; DestDir: "{app}\models\en-us\"; Flags: ignoreversion
; intentionally not deploying translations directory and contents...(yet)
;Source: {#DeployDirectory}\sqView_utility.db; DestDir: "{app}"; Flags: ignoreversion

; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Icons]
Name: "{group}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; IconFilename: {app}\desk1d.ico;
Name: "{group}\{cm:ProgramOnTheWeb,{#MyAppName}}"; Filename: "{#MyAppURL}"
Name: "{group}\{cm:UninstallProgram,{#MyAppName}}"; Filename: "{uninstallexe}"
Name: "{commondesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon; IconFilename: {app}\desk1d.ico;
Name: "{userappdata}\Microsoft\Internet Explorer\Quick Launch\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: quicklaunchicon; IconFilename: {app}\desk1d.ico;

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent
