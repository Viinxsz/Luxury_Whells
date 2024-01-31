import sqlite3

import psycopg2 as psycopg2


def criar_usuario(nome, email, senha, idade, telefone, cliente):
    try:
        conn = psycopg2.connect(
            host="localhost",
            port="5432",
            database="postgres",
            user="postgres",
            password="postgres"
        )
        # Crie um cursor
        cur = conn.cursor()
        idade = int(idade)
        cur.execute(f"""
                INSERT INTO public.db_clientes (
                 nome,
                 email,
                 senha,
                 idade,
                 telefone,
                 cliente
                )
                VALUES (
                 '{nome}', '{email}', '{senha}', {idade}, '{telefone}', '{cliente}');
               """)

        # Confirme as alterações
        conn.commit()

        # Feche o cursor e a conexão
        cur.close()
        conn.close()

        return {"success": True}
    except Exception as e:
        print(e)

