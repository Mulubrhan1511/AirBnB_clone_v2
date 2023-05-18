#!/usr/bin/python3
"""
Write a script that starts a Flask web application:
"""

from flask import Flask
app = Flask(__name__)
x = 1
print(type(x))
if type(x) is int:
    print('yes')