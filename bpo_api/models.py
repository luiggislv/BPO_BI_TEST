from bpo_api import db

class Operator(db.Model):
    __tablename__ = 'dim_operator'
    id_operator = db.Column(db.String, primary_key=True)
    id_team = db.Column(db.Integer, unique=False)
    des_operator = db.Column(db.String, unique=False)

class Team(db.Model):
    __tablename__ = 'dim_team'
    id_team = db.Column(db.Integer, primary_key=True)
    des_team = db.Column(db.String(100), unique=False)
