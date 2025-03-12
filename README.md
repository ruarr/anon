Documentación Técnica: Anonimizador de Documentos
Descripción General
El "Anonimizador de Documentos" es una aplicación desarrollada para el Poder Judicial de Jujuy, específicamente para el área de INLAB, que permite anonimizar información sensible en documentos de Microsoft Word (.docx) y guardar el resultado en formatos seleccionables por el usuario (.docx, .txt, o .pdf). La aplicación utiliza inteligencia artificial (SpaCy) y expresiones regulares para identificar y reemplazar datos personales como nombres, direcciones, números de teléfono, correos electrónicos y números de identificación (DNI). La interfaz gráfica, basada en tkinter, facilita su uso por parte de usuarios no técnicos.
Objetivo
Automatizar la anonimización de documentos judiciales, garantizando la protección de datos sensibles y permitiendo flexibilidad en el formato de salida.
Características Principales
Entrada: Archivos .docx.

Salida: Archivos .docx, .txt o .pdf, seleccionables por el usuario.

Anonimización: Identificación y reemplazo de entidades nombradas (personas, lugares, organizaciones), DNIs, direcciones, teléfonos y correos electrónicos.

Interfaz gráfica: Ventana con selección de archivos y formato de salida.

Compatibilidad: Diseñada para Windows (compatible también con Linux/Mac con ajustes menores).

Título: "Poder Judicial de Jujuy - INLAB -".

Requisitos del Sistema
Software
Sistema Operativo: Windows 10 o superior (compatible con Linux/Mac con ajustes).

Python: Versión 3.8 o superior.

Dependencias de Python:
python-docx: Para leer y escribir archivos .docx.

phonenumbers: Para validar y anonimizar números de teléfono.

email-validator: Para validar y anonimizar correos electrónicos.

spacy: Para el procesamiento de lenguaje natural (NLP) y detección de entidades nombradas.

reportlab: Para generar archivos .pdf con texto anonimizado.

tkinter: Biblioteca estándar de Python para la interfaz gráfica (incluida con Python en Windows).

Hardware
Procesador: Mínimo 1 GHz.

Memoria RAM: Mínimo 2 GB (4 GB recomendado para documentos grandes).

Espacio en disco: Aproximadamente 1 GB (incluye el modelo de SpaCy es_core_news_lg).

Dependencias adicionales
Modelo de SpaCy: es_core_news_lg (descargable mediante python -m spacy download es_core_news_lg).

Estructura del Código
Módulos y Bibliotecas
re: Para expresiones regulares.

docx: Para manipular archivos .docx.

logging: Para registrar eventos y errores en anonimizacion.log.

os y pathlib.Path: Para manejo de rutas y directorios.

phonenumbers: Para validar números de teléfono.

email_validator: Para validar correos electrónicos.

spacy: Para NLP y detección de entidades nombradas.

tkinter: Para la interfaz gráfica.

reportlab: Para generar archivos PDF.

Clases Principales
DocumentAnonymizer
Propósito: Gestiona la lógica de anonimización y guardado de archivos.

Métodos:
__init__: Inicializa el modelo de SpaCy y define patrones regex.

anonimizar_texto: Anonimiza el texto usando SpaCy y regex.

anonimizar_docx: Lee y anonimiza un archivo .docx, retorna texto procesado.

save_as_docx: Guarda el texto anonimizado como .docx.

save_as_txt: Guarda el texto anonimizado como .txt.

save_as_pdf: Guarda el texto anonimizado como .pdf usando reportlab.

AnonymizerGUI
Propósito: Proporciona la interfaz gráfica.

Métodos:
__init__: Configura la ventana y los elementos de la interfaz.

select_input_file: Abre un diálogo para seleccionar el archivo de entrada.

select_output_file: Abre un diálogo para seleccionar el archivo de salida.

update_output_suggestion: Actualiza la sugerencia de salida según el formato seleccionado.

anonimizar: Ejecuta el proceso de anonimización y guardado.

Flujo del Programa
El usuario selecciona un archivo .docx de entrada.

Elige un formato de salida (DOCX, TXT, PDF) mediante botones de opción.

La sugerencia del archivo de salida se actualiza dinámicamente con la extensión correspondiente.

Al hacer clic en "Anonimizar", el texto se procesa y se guarda en el formato seleccionado.

Instrucciones de Instalación (Windows)
Paso 1: Instalar Python
Descarga Python desde python.org.

Durante la instalación, marca "Add Python to PATH" y selecciona "Install Now".

Verifica la instalación:
cmd

python --version

Paso 2: Crear un Entorno Virtual
Abre una terminal (CMD):
cmd

cd C:\Proyectos
python -m venv mi_entorno

Activa el entorno:
cmd

mi_entorno\Scripts\activate

Paso 3: Instalar Dependencias
Dentro del entorno activado:
cmd

pip install python-docx phonenumbers email-validator spacy reportlab
python -m spacy download es_core_news_lg

Paso 4: Descargar y Ejecutar el Código
Guarda el código en un archivo, por ejemplo, anonimizador.py, en C:\Proyectos.

Ejecuta el programa:
cmd

python anonimizador.py

Instrucciones de Uso
Abrir la Aplicación:
Ejecuta el script y aparecerá una ventana titulada "Poder Judicial de Jujuy - INLAB -".

Seleccionar Archivo de Entrada:
Haz clic en "Seleccionar" junto a "Archivo de entrada (.docx)" para elegir un archivo Word.

Elegir Formato de Salida:
Selecciona DOCX, TXT o PDF en "Formato de salida". La sugerencia en "Archivo de salida" cambiará automáticamente:
DOCX: nombre_anonimizado.docx

TXT: nombre_anonimizado.txt

PDF: nombre_anonimizado.pdf

Seleccionar Archivo de Salida (Opcional):
Haz clic en "Seleccionar" junto a "Archivo de salida" para cambiar la ubicación o nombre del archivo.

Anonimizar:
Haz clic en "Anonimizar". Se mostrará un mensaje de éxito o error.

Ejemplo de Salida
Entrada: C:\Proyectos\expediente.docx con el texto "Juan Pérez vive en Calle San Martín 123, teléfono +543884123456, email juan@example.com".

Salida (PDF): C:\Proyectos\expediente_anonimizado.pdf con el texto "PER_ANONIMIZADO vive en DIRECCION_ANONIMIZADA, teléfono TELEFONO_ANONIMIZADO, email EMAIL_ANONIMIZADO".

Mantenimiento y Solución de Problemas
Errores Comunes
"ModuleNotFoundError":
Causa: Falta una dependencia.

Solución: Instala la dependencia faltante con pip install <nombre>.

"Permission denied":
Causa: Falta de permisos en el directorio de salida.

Solución: Ejecuta la terminal como administrador o cambia el directorio de salida.

"No se carga el modelo de SpaCy":
Causa: Modelo es_core_news_lg no instalado.

Solución: Ejecuta python -m spacy download es_core_news_lg.

Archivos Generados
anonimizacion.log: Registro de eventos y errores en el directorio de trabajo.

Posibles Mejoras
Preservar Formato:
Modificar save_as_docx y save_as_pdf para mantener la estructura original del documento (párrafos, tablas).

Soporte Multiarchivo:
Permitir procesar varios archivos .docx simultáneamente.

Personalización del PDF:
Agregar encabezados, pies de página, o ajustar fuentes y márgenes con reportlab.

Validación de Extensión:
Asegurarse de que el archivo de salida tenga la extensión correcta antes de guardar.

Progreso Visual:
Incluir una barra de progreso para documentos grandes.

Código Fuente
El código completo está disponible en el archivo anonimizador.py. Para modificaciones o soporte, contactar al desarrollador.
Notas Finales
Esta aplicación está diseñada para ser funcional y fácil de usar en un entorno Windows, con posibilidad de adaptarse a otros sistemas operativos. Para soporte adicional o implementación de mejoras, revisar el código fuente y los comentarios incluidos.

