from flask import Flask, render_template, request, send_from_directory, session

from actions import criar_usuario, login_user

app = Flask(__name__, static_url_path='/static')


@app.route('/static/<path:path>')
def send_static(path):
    return send_from_directory('static', path)


@app.route('/')
def home():
    return render_template('MainPage.html')


@app.route('/login')
def login():
    return render_template('Login.html')


@app.route('/fazlogin', methods=['POST'])
def faz_login():
    usuario = request.get_json()

    usuario = login_user(usuario['email'], usuario['senha'])

    if usuario is not None:
        # Login bem-sucedido
        print(f"Login realizado com sucesso! Bem-vindo(a), {usuario['nome']}")
        return {'status': 'true', 'usuario': usuario}, 200
    else:
        # Login falhou
        print("Login falhou. E-mail ou senha incorretos.")
        return {'status': 'false'}, 401


@app.route('/register')
def register():
    return render_template('FormCriar.html')


@app.route('/criar_usuario', methods=['POST'])
def criar_usuario_api():
    usuario = request.get_json()
    try:
        criar_usuario(usuario['nome'], usuario['email'], usuario['senha'], usuario['idade'], usuario['telefone'],
                      usuario['tipo'])
        print("criou user")
        return {'status': 'true'}, 200
    except Exception:
        return {'status': 'false'}, 500


@app.route('/categorias/diamond')
def categorias_diamond():
    return render_template('CategoriaDiamond.html')


@app.route('/categorias/gold')
def categorias_gold():
    return render_template('CategoriasGold.html')


@app.route('/categorias/silver')
def categorias_silver():
    return render_template('CategoriasSilver.html')


@app.route('/alugar/<car_name>')
def rent(car_name):
    return render_template('Alugar.html', car_name=car_name)


@app.route('/dash')
def dash():
    return render_template('Dashboard.html')

if __name__ == '__main__':
    app.run(debug=True)
