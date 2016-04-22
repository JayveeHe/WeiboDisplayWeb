# coding=utf-8
import os
from subprocess import Popen
import subprocess
from flask import Flask, request, url_for, redirect
import sys

app = Flask(__name__)

print os.getcwd()
project_path = os.path.dirname(os.path.abspath(os.path.dirname(__file__)))
pypath = os.path.dirname(__file__)
web_path = '%s/static/web' % (pypath)
sys.path.append(pypath)


@app.route('/')
def hello_world():
    # print url_for('static', filename='web/weibo_analysis.html')
    return redirect(url_for('static', filename='web/weibo_analysis.html'))


@app.route('/gexf', methods=['POST'])
def get_gexf():
    post_data = request.form
    url = post_data['url']
    timestamp = post_data['timestamp']
    print url
    print timestamp
    cmd_text = "java -jar %s/jars/WeiboDisseminationAnalysis.jar \"%s\" 5 %s/data/gexf/result-%s.gexf" % (
        web_path, url, web_path, timestamp)
    print cmd_text

    # import subprocess
    #
    # subprocess.call(['java', '-jar', '%s/jars/WeiboDisseminationAnalysis.jar' % web_path])
    pro = subprocess.Popen(cmd_text,cwd="%s/jars/"%web_path,shell=True)
    # print os.popen(cmd_text)
    # Popen.wait()
    # while True:
    #     buff = pro.stdout.readline()
    #     if buff == '' and pro.poll() != None:
    #         break
    pro.wait()
    datafile = open('%s/data/gexf/result-%s-data.txt' % (web_path, timestamp), 'r')
    print 'done'
    ds = datafile.read()
    return ds
    # return '123123'


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=1234, debug=True)
