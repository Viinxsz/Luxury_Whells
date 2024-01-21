import sqlite3


def criar_usuario(nome, idade, telefone, endereco, forma_de_pagamento, cliente=True):
    # Conecte-se ao seu banco de dados
    conn = sqlite3.connect('database/database.sql')

    # Crie um cursor
    cur = conn.cursor()

    # Execute a consulta SQL
    cur.execute("""
        INSERT INTO db_clientes (
            nome,
            idade,
            telefone,
            endereco,
            forma_de_pagamento,
            cliente
        )
        VALUES (?, ?, ?, ?, ?, ?)
    """, (nome, idade, telefone, endereco, forma_de_pagamento, cliente))

    # Confirme as alterações
    conn.commit()

    # Feche o cursor e a conexão
    cur.close()
    conn.close()