# Agente IA para consultar bases de datos MySQL

Aplicación web creada con Python, Flask, MySQL y Gemini. Permite escribir preguntas en lenguaje natural y convertirlas en consultas SQL de solo lectura.

## ¿Cómo funciona?

1. El usuario escribe una pregunta en la página web.
2. Flask recibe la pregunta mediante la ruta `/ask`.
3. La aplicación detecta las tablas y columnas de la base de datos seleccionada.
4. Gemini genera una consulta SQL para MySQL.
5. La aplicación valida que la consulta sea segura y únicamente de tipo `SELECT`.
6. MySQL ejecuta la consulta.
7. La página muestra la consulta y los resultados.

```text
Pregunta del usuario
        ↓
       Flask
        ↓
      Gemini
        ↓
     Consulta SQL
        ↓
       MySQL
        ↓
     Resultados
```

## Tecnologías

- Python
- Flask
- MySQL
- PyMySQL
- Google Gemini API
- HTML

## Estructura del proyecto

```text
Agente-base-de-datos/
├── app.py
├── .env
├── .gitignore
├── init.sql
└── templates/
    └── index.html
```

- `app.py`: contiene el servidor, la conexión con MySQL, la comunicación con Gemini y la validación SQL.
- `.env`: contiene la configuración privada de la API y de la base de datos.
- `.gitignore`: evita subir archivos privados o innecesarios.
- `init.sql`: script opcional para crear tablas e insertar datos.
- `templates/index.html`: interfaz web del agente.

## Requisitos

- Python 3 instalado.
- MySQL Server y MySQL Workbench.
- Una base de datos MySQL.
- Una API key de Gemini.

## Instalación

Desde PowerShell, dentro de la carpeta del proyecto:

```powershell
py -m venv venv
.\venv\Scripts\Activate.ps1
python -m pip install flask pymysql python-dotenv google-generativeai
```

Si PowerShell bloquea la activación del entorno:

```powershell
Set-ExecutionPolicy -Scope Process Bypass
.\venv\Scripts\Activate.ps1
```

## Configuración

Crea un archivo llamado `.env` en la carpeta principal:

```env
GEMINI_API_KEY=TU_API_KEY
DB_HOST=localhost
DB_USER=tu_usuario
DB_PASSWORD=tu_contraseña
DB_NAME=nombre_de_tu_base
```

`DB_NAME` debe coincidir exactamente con el nombre de la base de datos que usarás en MySQL.

La aplicación obtiene automáticamente las tablas y columnas mediante `INFORMATION_SCHEMA`, por lo que se puede usar con diferentes bases de datos MySQL sin modificar el esquema manualmente.

## Base de datos

Si la base ya existe, configura sus datos en `.env`.

Si quieres crearla usando el archivo `init.sql`:

1. Abre MySQL Workbench.
2. Conéctate al servidor.
3. Abre `init.sql`.
4. Ejecuta el script con el botón del rayo.
5. Configura `.env` con el nombre de la base creada.

`init.sql` es opcional y no se ejecuta automáticamente al iniciar Flask.

## Ejecutar la aplicación

```powershell
python app.py
```

Después abre en el navegador:

```text
http://127.0.0.1:5000
```

Ejemplos de preguntas:

- ¿Cuántos registros existen?
- ¿Cuál es el registro con mayor valor?
- ¿Qué categorías existen?
- ¿Cuál es el promedio de un campo numérico?

## Seguridad

La aplicación permite únicamente consultas `SELECT`. Se bloquean instrucciones como:

```text
INSERT, UPDATE, DELETE, DROP, ALTER, TRUNCATE y CREATE
```

Se recomienda utilizar un usuario de MySQL con permisos de solo lectura y nunca publicar API keys o contraseñas.

El archivo `.env` debe permanecer fuera de GitHub. Para compartir la configuración, utiliza un `.env.example` con valores de ejemplo.

## Autor

Proyecto académico del SENA, desarrollado en el programa de formación
Tecnólogo en Análisis y Desarrollo de Software (ADSO), para demostrar la
integración entre inteligencia artificial, Python y bases de datos MySQL.
