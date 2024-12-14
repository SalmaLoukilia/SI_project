from flask import Flask, render_template, request, redirect, url_for, session
import re
import os
import sys

app=Flask(__name__)

app.secret_key='abcd2123445'
app.config['MYSQL_HOST']='localhost'
app.config['MYSQL_DB']='library-system'
