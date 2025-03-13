@echo off
TITLE Instalacion del Anonimizador de Documentos - Poder Judicial de Jujuy - INLAB
ECHO Instalando el Anonimizador de Documentos...

:: Verificar si Python está instalado
python --version >nul 2>&1
IF %ERRORLEVEL% NEQ 0 (
    ECHO Python no esta instalado. Descargando e instalando Python...
    :: Descargar Python (versión 3.11.6 como ejemplo, ajustar si es necesario)
    powershell -Command "Invoke-WebRequest -Uri 'https://www.python.org/ftp/python/3.11.6/python-3.11.6-amd64.exe' -OutFile 'python-installer.exe'"
    :: Instalar Python silenciosamente con "Add to PATH"
    python-installer.exe /quiet InstallAllUsers=1 PrependPath=1
    DEL python-installer.exe
    ECHO Python instalado. Puede que necesites reiniciar la terminal o la computadora.
    PAUSE
    :: Actualizar PATH en la sesión actual (puede no funcionar hasta reinicio)
    SET "PATH=%PATH%;C:\Program Files\Python311;C:\Program Files\Python311\Scripts"
) ELSE (
    ECHO Python ya esta instalado.
)

:: Crear directorio de trabajo si no existe
IF NOT EXIST "C:\Proyectos" (
    MKDIR "C:\Proyectos"
)
CD /D "C:\Proyectos"

:: Crear entorno virtual
ECHO Creando entorno virtual...
python -m venv mi_entorno
IF %ERRORLEVEL% NEQ 0 (
    ECHO Error al crear el entorno virtual. Verifica que Python esté instalado correctamente.
    PAUSE
    EXIT /B 1
)

:: Activar entorno virtual
CALL mi_entorno\Scripts\activate
IF %ERRORLEVEL% NEQ 0 (
    ECHO Error al activar el entorno virtual.
    PAUSE
    EXIT /B 1
)

:: Actualizar pip
ECHO Actualizando pip...
python -m pip install --upgrade pip

:: Instalar dependencias
ECHO Instalando dependencias...
pip install python-docx phonenumbers email-validator spacy reportlab
IF %ERRORLEVEL% NEQ 0 (
    ECHO Error al instalar dependencias. Verifica tu conexión a internet.
    PAUSE
    EXIT /B 1
)

:: Descargar modelo de SpaCy
ECHO Descargando modelo de SpaCy...
python -m spacy download es_core_news_lg
IF %ERRORLEVEL% NEQ 0 (
    ECHO Error al descargar el modelo de SpaCy. Verifica tu conexión a internet.
    PAUSE
    EXIT /B 1
)

:: Crear archivo de ejecución para la aplicación
ECHO Creando script de inicio...
ECHO @echo off > iniciar_anonimizador.bat
ECHO CALL mi_entorno\Scripts\activate >> iniciar_anonimizador.bat
ECHO python anonimizador.py >> iniciar_anonimizador.bat
ECHO PAUSE >> iniciar_anonimizador.bat

:: Mensaje final
ECHO Instalacion completada con exito!
ECHO Para usar la aplicacion:
ECHO 1. Guarda el archivo anonimizador.py en C:\Proyectos
ECHO 2. Haz doble clic en iniciar_anonimizador.bat
PAUSE