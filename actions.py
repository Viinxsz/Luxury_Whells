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


def buscar_usuario(email):
    """
  Função para buscar um usuário no banco de dados pelo seu e-mail.

  Args:
    email: O e-mail do usuário a ser buscado.

  Returns:
    Um dicionário com as informações do usuário ou None se não for encontrado.
  """
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

        cur.execute(f"""
      SELECT * FROM public.db_clientes WHERE email = '{email}';
    """)

        # Obtenha o resultado da consulta
        usuario = cur.fetchone()
        print(usuario)
        # Feche o cursor e a conexão
        cur.close()
        conn.close()

        if usuario:
            # Retorna um dicionário com as informações do usuário
            return {
                "nome": usuario[1],
                "email": usuario[2],
                "senha": usuario[3],
                "idade": usuario[4],
                "telefone": usuario[5],
                "cliente": usuario[6],
            }
        else:
            # Retorna None se o usuário não for encontrado
            return None

    except Exception as e:
        print(e)
        return None


def login_user(email, senha):
    """
  Função para realizar o login de um usuário no sistema.

  Args:
    email: O e-mail do usuário.
    senha: A senha do usuário.

  Returns:
    Um dicionário com as informações do usuário se o login for bem-sucedido, None caso contrário.
  """
    try:
        usuario = buscar_usuario(email)
        print(usuario)
        # Verifica se o usuário foi encontrado
        if not usuario:
            return None

        # Verifica se a senha digitada confere com a senha armazenada no banco
        if usuario["senha"] != senha:
            return None

        # Retorna as informações do usuário
        return usuario

    except Exception as e:
        print(e)
        return None
