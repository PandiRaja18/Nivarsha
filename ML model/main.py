# -*- coding: utf-8 -*-
"""
Created on Sun Mar 12 23:30:10 2023

@author: asus
"""

import requests
from tensorflow.keras.preprocessing import image
from tensorflow.keras.models import load_model
import numpy as np
import werkzeug 
import pandas as pd
import tensorflow as tf
from flask import Flask, request, render_template, redirect, url_for,jsonify
import os
from werkzeug.utils import secure_filename
from tensorflow.python.keras.backend import set_session

app=Flask(__name__)
model=load_model("D:\Project\Model\model_v1.h5")
category={
  0 : ['burger','Burger'], 1 : ['chapati','Chapati'], 2 : ['chicken','Chicken']
  ,3 : ['chilliparotta','ChilliParotta'], 4 :['cornflakes','CornFlakes'], 5 : ['crispychicken','Crispy Chicken'],
  6 : ['curdrice','Curdrice'], 7 : ['dosa','Dosa'], 8 : ['frenchfires','French Fries'], 9 :['idli','Idli'], 10 :['kesari','Kesari'],
  11 : ['lemonrice','Lemon Rice'], 12:['naan','Naan'], 13 : ['oats','Oats'], 14: ['paneergravy','PaneerGravy'],
  15 : ['pizza','Pizza'], 16 : ['puttu','Puttu'], 17 :['shawarmaa','Shawarmaa'], 18 : ['vada','Vada'],
  19 : ['venpongal','Ven Pongal'], 20 :['vermicelli','Vermicelli']
}
@app.route('/upload',methods=["POST"])

def upload():
    if(request.method == "POST"):
        f = request.files['image']
        filename=werkzeug.utils.secure_filename(f.filename);
        f.save("./uploadedimages/"+filename)
        img_ = image.load_img("./uploadedimages/"+filename, target_size=(299, 299))
        img_array = image.img_to_array(img_)
        img_processed = np.expand_dims(img_array, axis=0) 
        img_processed /= 255.   
    
        prediction = model.predict(img_processed)
    
        index = np.argmax(prediction)
        # Get the file from post request
      
        #return category[index][1]
        #basepath = os.path.dirname(__file__)
        #file_path = os.path.join(basepath, 'uploads', secure_filename(f.filename))
        #f.save(file_path)
        return jsonify({"message": category[index][1]})
       
        
if __name__ == "__main__":
    app.run(debug=False)