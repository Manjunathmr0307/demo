from flask import Flask, jsonify

app = Flask(__name__)

def add(a, b):
    return a + b

@app.get('/')
def api():
    return jsonify({"message": "Hello, Manjunath M R!"})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)