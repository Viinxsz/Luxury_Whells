from flask import Flask, render_template, request, send_from_directory

from actions import criar_usuario

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


@app.route('/register')
def register():
    return render_template('FormCriar.html')


@app.route('/criar_usuario', methods=['POST'])
def criar_usuario_api():
    usuario = request.get_json()
    criar_usuario(usuario['nome'], usuario['idade'], usuario['telefone'], usuario['endereco'], usuario['tipo'])
    return {'status': 'success'}, 200


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


@app.route('/dash/<info_alugar>')
def dash(info_alugar):
    return render_template('Dashboard.html', info_alugar=info_alugar)


if __name__ == '__main__':
    app.run(debug=True)
