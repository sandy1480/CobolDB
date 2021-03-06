import subprocess
from flask import request,jsonify,Flask
import json

app = Flask(__name__)

@app.errorhandler(404)
def error_handler(e):
    try:
        response = {'status': 'error',
                    'error_text': str(e),
                    'error_code': str(e.code)}
    except:
        response = {'status': 'error',
                    'error_text': str(e)}
    return jsonify(response)


@app.route('/', methods=['GET','POST'])
def hello():
    return "Redis DB Application"


@app.route('/<version>/runcobol', methods=['POST'])
def hello_endpoint(version):
    output = " "
    try:
        if version == "v1" or version == "latest":
            data = request.data
            dataDict = json.loads(data.decode("utf-8") )
            cobol_output = subprocess.check_output("/home/abs/coboldb ,shell=True)
            output = {"status":"success","output":cobol_output.decode("utf-8")}
        else:
            output = {"status":"error",
                      "error_text": "bad request"}
    except Exception as e:
        output = {"status":"error",
                  "error_text": str(e)}
    return jsonify(output)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=3000)
