from flask import Flask, request, jsonify
import uuid
import time
import threading
from random import randint, random

app = Flask(__name__)
positions = {}
nonces = {}
from random import randint, random
def clean_positions():
    current_time = int(time.time()*1000000)
    keys_to_remove = [key for key, val in positions.items() if current_time - val['timestamp'] > 5e6]
    for key in keys_to_remove:
        del positions[key]
        del nonces[key]

@app.route('/connect')
def connect():
    unique_id = str(uuid.uuid4())
    nonce = str(uuid.uuid4())
    nonces[unique_id] = nonce
    
    # Choose a new position that is not within 32 units of any other
    position_assigned = False
    while not position_assigned:
        x_new = round((randint(0, 1000) // 16) * 16)
        y_new = round((randint(0, 1000) // 16) * 16)
        position_assigned = True
        for pos in positions.values():
            if abs(pos['x'] - x_new) <= 16 and abs(pos['y'] - y_new) <=16:
                position_assigned = False
                break
    positions[unique_id] = {'x': x_new, 'y': y_new, 'timestamp': int(time.time()*1000000)}
    
    return jsonify({'unique_id': unique_id, 'nonce': nonce, 'x': x_new, 'y': y_new})

@app.route('/set_position')
def set_position():
    unique_id = request.args.get('unique_id')
    nonce = request.args.get('nonce')
    x = request.args.get('x')
    y = request.args.get('y')
    

    if unique_id not in nonces or nonces[unique_id] != nonce:
        return "Invalid unique ID or nonce", 400
    
    past_x=positions[unique_id]["x"]
    past_y=positions[unique_id]["y"]
    
    try:
        x = round(int(x) / 16) * 16
        y = round(int(y) / 16) * 16
    except ValueError:
        return "x and y must be integers", 400
    
    if abs(past_x-x)>16 or abs(past_y-y)>16:
        return "you have gone too far!!!", 400
    
    
    for uuid, pos in positions.items():
        if uuid != unique_id and (abs(pos['x'] - x) <= 16 and abs(pos['y'] - y) <= 16):
            return "Position too close to another player", 403
    
    positions[unique_id] = {'x': x, 'y': y, 'timestamp': int(time.time()*1000000)}
    return "Position set successfully"

@app.route('/get_positions')
def get_positions():
    #clean_positions()
    return jsonify(positions)

if __name__ == '__main__':
    app.run(debug=True)
