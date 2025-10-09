import sqlite3
from pathlib import Path


DB_PATH = "./clinic_simple.db"
CSV_PATH = "./data/patients.csv"
SCHEMA_PATH = Path("./sql/schema.sql")

def main():
    schema_sql = SCHEMA_PATH.read_text(encoding = "utf-8")

    with sqlite3.connect(DB_PATH) as conn:
        conn.executescript(schema_sql)
        conn.commit()

    print(f"Created database: {DB_PATH}")

if __name__ == "__main__":
    main()
