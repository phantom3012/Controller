import pyautogui as pg
import time
import firebase_admin
from firebase_admin import credentials
from firebase_admin import db

pg.mouseUp(button='right')
cred = credentials.Certificate("controller-84768-firebase-adminsdk-vcvs4-7664633c53.json")
firebase_admin.initialize_app(cred, {
    'databaseURL': 'https://database-url.firebaseio.com/'
})
wref = db.reference("/W")
aref = db.reference("/A")
sref = db.reference("/S")
dref = db.reference("/D")
lcref = db.reference("LC")
rcref = db.reference("/RC")

while 1:
    if wref.get() == 1:
        pg.press('w')
    if aref.get() == 1:
        pg.keyDown('a')
    if sref.get() == 1:
        pg.keyDown('s')
    if dref.get() == 1:
        pg.keyDown('d')
    if lcref.get() == 1:
        pg.click(button='left')
    if rcref.get() == 1:
        pg.click(button='right')
