import os
import re
import pymysql
from flask import Flask, request, jsonify, render_template
import google.generativeai as genai
from dotenv import load_dotenv

load_dotenv()
app = Flask(__name__)

genai.configure(api_key=os.getenv("GEMINI_API_KEY"))
model = genai.GenerativeModel("gemini-3.6-flash")

def get_connection():
    return pymysql.connect(
        host=os.getenv("DB_HOST"),
        user=os.getenv("DB_USER"),
        password=os.getenv("DB_PASSWORD"),
        database=os.getenv("DB_NAME"),
        cursorclass=pymysql.cursors.DictCursor
    )

def clean_sql(text: str) -> str:
    text = text.strip()
    text = re.sub(r"^```sql", "", text, flags=re.IGNORECASE).strip()
    text = re.sub(r"```$", "", text).strip()
    return text

def is_safe_select(sql: str) -> bool:
    s = sql.strip().lower()
    if not s.startswith("select"):
        return False
    blocked = ["insert", "update", "delete", "drop", "alter", "truncate", "create", "grant", "revoke", "--", "/*", "*/"]
    return not any(word in s for word in blocked)

@app.route("/")
def index():
    return render_template("index.html")

@app.route("/ask", methods=["POST"])
def ask():
    data = request.get_json()
    pregunta = data.get("pregunta", "").strip()

    if not pregunta:
        return jsonify({"error": "La pregunta está vacía"}), 400

    schema = """
    Tablas disponibles:
    lotes(id, nombre, tipo_cultivo, area)
    sensores(id, lote_id, ph, ec, temperatura, humedad, fecha)
    riego(id, lote_id, litros, fecha)
    """

    prompt_sql = f"""
    Eres un asistente que genera SQL para MySQL.
    Reglas:
    1) Devuelve SOLO una consulta SQL.
    2) Debe ser únicamente SELECT.
    3) Usa solo estas tablas y columnas:
    {schema}
    Pregunta del usuario: {pregunta}
    """

    sql_raw = model.generate_content(prompt_sql).text
    sql_query = clean_sql(sql_raw)

    if not is_safe_select(sql_query):
        return jsonify({
            "error": "Consulta no permitida por seguridad.",
            "consulta_sql": sql_query
        }), 400

    conn = get_connection()
    try:
        with conn.cursor() as cursor:
            cursor.execute(sql_query)
            rows = cursor.fetchall()
    except Exception as e:
        return jsonify({"error": f"Error SQL: {str(e)}", "consulta_sql": sql_query}), 400
    finally:
        conn.close()

    prompt_respuesta = f"""
    Eres un asistente académico.
    Explica en español claro y breve los resultados.
    Pregunta: {pregunta}
    Consulta SQL: {sql_query}
    Resultado: {rows}
    """

    respuesta = model.generate_content(prompt_respuesta).text

    return jsonify({
        "consulta_sql": sql_query,
        "respuesta": respuesta,
        "resultados": rows
    })

if __name__ == "__main__":
    app.run(debug=True)