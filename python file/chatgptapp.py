from flask import Flask, render_template, request, jsonify
import base64
import requests
from flask_cors import CORS
from tensorflow.keras.applications.resnet50 import ResNet50, preprocess_input, decode_predictions
from tensorflow.keras.preprocessing import image
import numpy as np

app = Flask(__name__)
CORS(app)

# Load pre-trained ResNet50 model
model = ResNet50(weights='imagenet')

# OpenAI API Key
api_key = ""


# Function to encode the image
def encode_image(image_path):
    with open(image_path, "rb") as image_file:
        return base64.b64encode(image_file.read()).decode('utf-8')


# Function to classify image
def classify_image(image_path):
    img = image.load_img(image_path, target_size=(224, 224))
    x = image.img_to_array(img)
    x = np.expand_dims(x, axis=0)
    x = preprocess_input(x)
    preds = model.predict(x)
    decoded_preds = decode_predictions(preds, top=3)[0]  # Get top 3 predictions
    return decoded_preds


# Function to get category from predictions
# def get_category(predictions):
#     categories = [category_name for (_, category_name, _) in predictions]
#     return categories


# Function to send request and get response
# Function to send request and get response
def send_request(payload):
    headers = {
        "Content-Type": "application/json",
        "Authorization": f"Bearer {api_key}"
    }
    response = requests.post("https://api.openai.com/v1/chat/completions", headers=headers, json=payload)
    json_response = response.json()["choices"][0]["message"]["content"]

    # Splitting content by comma and striping whitespaces
    content_parts = json_response.split(',')
    title = content_parts[0].strip() if content_parts else None
    category = content_parts[1].strip() if len(content_parts) > 1 else None

    return title, category


@app.route("/", methods=["GET", "POST"])
def chat():
    if request.method == "POST":
        if "image" in request.files:
            # Get image file from form
            image_file = request.files["image"]
            image_path = "static/" + image_file.filename
            image_file.save(image_path)

            # Encode the image
            base64_image = encode_image(image_path)

            # Initial conversation
            initial_payload = {
                "model": "gpt-4-turbo",
                "messages": [
                    {
                        "role": "user",
                        "content": [
                            {
                                "type": "text",
                                "text": "이미지의 제품명과 카테고리만 출력. 카테고리는 상세하게 출력. 대신 종류만 나오게 예를들어 의류 중 스웨터, 점퍼, 티셔츠 이런식으로 상세카테고리만 나오게. 제품명이 정확하지 않으면 유추해서 유추한 제품명만 나오게 해줘. 그리고 응답에 제품명:, 카테고리: 이건 안나오게"
                            },
                            {
                                "type": "image_url",
                                "image_url": {
                                    "url": f"data:image/jpeg;base64,{base64_image}"
                                }
                            }
                        ]
                    }
                ],
                "max_tokens": 700
            }

            # Get initial response - menu recommendation based on image
            previous_content = send_request(initial_payload)
            print(previous_content[1])

            # Return initial response to the client
            return jsonify({"response": previous_content[0], "response2": previous_content[1]})

    return render_template("index.html")

if __name__ == "__main__":
    app.run(debug=False, host="192.168.0.34", port=5000)
