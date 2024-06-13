from flask import Flask, request, jsonify
from flask_cors import CORS
from werkzeug.utils import secure_filename
import os
from tensorflow.keras.models import load_model
import numpy as np
from PIL import Image
from tensorflow.keras.preprocessing import image

app = Flask(__name__)
CORS(app)  # CORS를 Flask 애플리케이션에 적용


# 모델 로드
model = load_model('improved_cycle3.h5')

# 클래스 레이블
class_labels = ['건전지', '금속캔', '비닐', '스티로폼', '유리병', '종이', '페트병', '플라스틱', '형광등']

# 이미지 업로드 경로
UPLOAD_FOLDER = 'uploads'
app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER


# 업로드된 이미지 처리
def process_image(image_path):
    img = image.load_img(image_path, target_size=(224, 224))
    img_array = image.img_to_array(img)
    img_array = np.expand_dims(img_array, axis=0)
    return img_array


# 예측 함수
def predict_image(image_path):
    img = process_image(image_path)
    prediction = model.predict(img)
    predicted_class = np.argmax(prediction)
    confidence = round(np.max(prediction) * 100, 2)
    return class_labels[predicted_class], confidence


@app.route('/predict', methods=['POST'])
def predict():
    if 'file' not in request.files:
        return jsonify({'error': 'No file part'})

    file = request.files['file']
    if file.filename == '':
        return jsonify({'error': 'No selected file'})

    # 이미지를 저장할 경로 설정
    filename = secure_filename(file.filename)
    file_path = os.path.join(app.config['UPLOAD_FOLDER'], filename)
    file.save(file_path)

    # 이미지를 예측하고 결과를 얻음
    prediction, confidence = predict_image(file_path)

    # 예측 결과를 JSON 형태로 반환
    return jsonify({'prediction': prediction, 'confidence': confidence})


if __name__ == '__main__':
    app.run(host="192.168.0.34", port=5001, debug=True)
