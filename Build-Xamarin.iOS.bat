@echo off

set fdir=%WINDIR%\Microsoft.NET\Framework64

if not exist %fdir% (
	set fdir=%WINDIR%\Microsoft.NET\Framework
)

set msbuild=%fdir%\v4.0.30319\msbuild.exe

%msbuild% SuperSocket.ClientEngine.Xamarin.iOS.sln /p:Configuration=Debug /t:Clean;Rebuild /p:OutputPath=..\bin\Xamarin.iOS\Debug
FOR /F "tokens=*" %%G IN ('DIR /B /AD /S obj') DO RMDIR /S /Q "%%G"

%msbuild% SuperSocket.ClientEngine.Xamarin.iOS.sln /p:Configuration=Release /t:Clean;Rebuild /p:OutputPath=..\bin\Xamarin.iOS\Release
FOR /F "tokens=*" %%G IN ('DIR /B /AD /S obj') DO RMDIR /S /Q "%%G"


pause
