@echo off

if not exist package.json (
    echo package.json not found. Please run this inside your React project folder.
    exit /b 1
)

echo Cleaning React project...

del /f /q src\App.css 2>nul
del /f /q src\App.test.js 2>nul
del /f /q src\index.css 2>nul
del /f /q src\logo.svg 2>nul
del /f /q src\reportWebVitals.js 2>nul
del /f /q src\setupTests.js 2>nul

del /f /q public\favicon.ico 2>nul
del /f /q public\logo192.png 2>nul
del /f /q public\logo512.png 2>nul

break > README.md

echo function App() ^{ > src\App.js
echo.  return ^(>> src\App.js
echo.    ^<label^>Hello World^</label^> >> src\App.js
echo.  ^);>> src\App.js
echo ^}>> src\App.js
echo.>> src\App.js
echo export default App;>> src\App.js

echo import ReactDOM from ^'react-dom/client^' > src\index.js
echo import App from ^'./App^' >> src\index.js
echo. >> src\index.js
echo const root = ReactDOM.createRoot(document.getElementById(^'root^')) >> src\index.js
echo root.render^(>> src\index.js
echo.  ^<App /^>^ >> src\index.js
echo ) >> src\index.js

echo Cleanup and edits complete!

REM ===== Create the full folder structure for src =====

mkdir src 2>nul
mkdir src\assets 2>nul
mkdir src\assets\fonts 2>nul
mkdir src\assets\icons 2>nul
mkdir src\assets\styles 2>nul
mkdir src\components 2>nul
mkdir src\scripts 2>nul

REM Create empty CSS files
type nul > src\assets\styles\style.css
type nul > src\assets\styles\root.css
type nul > src\assets\styles\design.css

REM Create empty JS file
type nul > src\scripts\script.js

