# file: sqlserver_mcp_server.py

from mcp.server.fastmcp import FastMCP
import pyodbc
import os

# Initialize MCP server
mcp = FastMCP("sqlserver-mcp-server")


# -------------------------------
# DATABASE CONNECTION
# -------------------------------
def get_connection():
    conn_str = (
        "DRIVER={ODBC Driver 17 for SQL Server};"
        "SERVER=SHUBHAM666\\MSSQL;"
        "DATABASE=war_project;"
        "Trusted_Connection=yes;"
        "Encrypt=no;"
        "TrustServerCertificate=yes;"
    )
    return pyodbc.connect(conn_str, timeout=5)


# -------------------------------
# SAFETY CHECK
# -------------------------------
def is_safe_query(query: str):
    blocked = ["drop", "delete", "truncate"]
    return not any(word in query.lower() for word in blocked)


# -------------------------------
# TOOL 1: RUN QUERY
# -------------------------------
@mcp.tool()
def run_query(query: str):
    if not is_safe_query(query):
        return "❌ Query blocked (unsafe operation)"

    conn = get_connection()
    cursor = conn.cursor()

    try:
        cursor.execute(query)

        if query.strip().lower().startswith("select"):
            columns = [col[0] for col in cursor.description]
            rows = cursor.fetchall()
            result = [dict(zip(columns, row)) for row in rows]
        else:
            conn.commit()
            result = "✅ Query executed successfully"

    except Exception as e:
        result = f"❌ Error: {str(e)}"

    finally:
        conn.close()

    return result


# -------------------------------
# TOOL 2: GET TABLES
# -------------------------------
@mcp.tool()
def get_tables():
    conn = get_connection()
    cursor = conn.cursor()

    cursor.execute("""
        SELECT TABLE_NAME 
        FROM INFORMATION_SCHEMA.TABLES 
        WHERE TABLE_TYPE = 'BASE TABLE'
    """)

    tables = [row[0] for row in cursor.fetchall()]
    conn.close()

    return tables


# -------------------------------
# TOOL 3: DESCRIBE TABLE
# -------------------------------
@mcp.tool()
def describe_table(table_name: str):
    conn = get_connection()
    cursor = conn.cursor()

    cursor.execute(f"""
        SELECT COLUMN_NAME, DATA_TYPE
        FROM INFORMATION_SCHEMA.COLUMNS
        WHERE TABLE_NAME = '{table_name}'
    """)

    columns = cursor.fetchall()
    conn.close()

    return columns


# -------------------------------
# RUN MCP SERVER (STDIO for Codex)
# -------------------------------
if __name__ == "__main__":
    mcp.run()