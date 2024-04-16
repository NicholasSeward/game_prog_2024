from flask import Flask, request, jsonify
import uuid
import random
app = Flask(__name__)

# Dictionary to store positions
positions = {}
nonces = {}

@app.route('/connect')
def connect():
    unique_id = str(uuid.uuid4())
    nonce = str(uuid.uuid4())
    nonces[unique_id] = nonce
    return jsonify({'unique_id': unique_id, 'nonce': nonce})

@app.route('/set_position')
def set_position():
    unique_id = request.args.get('unique_id')
    nonce = request.args.get('nonce')
    x = request.args.get('x')
    y = request.args.get('y')

    if unique_id not in nonces or nonces[unique_id] != nonce:
        return "Invalid unique ID or nonce", 400

    try:
        x = int(x)
        y = int(y)
    except ValueError:
        return "x and y must be integers", 400

    positions[unique_id] = {'x': x, 'y': y}
    return "Position set successfully"

@app.route('/get_positions')
def get_positions():
    return jsonify(positions)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=80, debug=True)
    #http://172.16.2.164/
