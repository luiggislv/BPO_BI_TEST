from flask import Flask
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)

#app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:////tmp/product.db'
#app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql://root2:Ayn1t3ch@10.28.124.194/dwh_homeaway_new'
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql://root:mysql2@localhost/dwh_homeaway_new?charset=utf8mb4'

db = SQLAlchemy(app)
