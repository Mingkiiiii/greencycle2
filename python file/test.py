import os
import json
import tensorflow as tf
from keras.preprocessing.image import ImageDataGenerator
from keras.models import Sequential
from keras.layers import Conv2D, MaxPooling2D, Flatten, Dense
from sklearn.model_selection import train_test_split
import shutil
print(tf.__version__)
# GPU를 사용할 수 있는지 확인
print("GPU 사용 가능 여부: ", tf.config.list_physical_devices('GPU'))

# GPU를 사용하도록 설정
from keras import backend as K

config = tf.compat.v1.ConfigProto(allow_soft_placement=True)
config.gpu_options.allow_growth = True
sess = tf.compat.v1.Session(config=config)
tf.compat.v1.keras.backend.set_session(sess)

# 이미지와 라벨 파일 경로 설정
image_folder = r'C:\tools\Training'
label_folder = r'C:\tools\meta'

# 이미지 크기 및 클래스 수 설정
img_size = (224, 224)
num_classes = 9  # 건전지, 금속캔, 비닐, 스티로폼, 유리병, 종이, 페트병, 플라스틱, 형광등으로 총 9개의 클래스

# 이미지 및 라벨 데이터 로드 함수 정의
def organize_data(image_folder, label_folder):
    class_names = ['건전지', '금속캔', '비닐', '스티로폼', '유리병', '종이', '페트병', '플라스틱', '형광등']
    organized_folder = './dataset02'

    if not os.path.exists(organized_folder):
        os.makedirs(organized_folder)

    for class_name in class_names:
        class_folder = os.path.join(organized_folder, class_name)
        if not os.path.exists(class_folder):
            os.makedirs(class_folder)

    for root, dirs, files in os.walk(image_folder):
        for file in files:
            if file.endswith('.jpg'):
                image_path = os.path.join(root, file)
                label_path = os.path.join(label_folder, os.path.basename(root), file.replace('.jpg', '.json'))

                try:
                    with open(label_path, 'r', encoding='utf-8') as f:
                        data = json.load(f)
                        annotation_info = data['ANNOTATION_INFO']
                        class_name = annotation_info[0]['CLASS']
                        if class_name in class_names:
                            class_folder = os.path.join(organized_folder, class_name)
                            os.rename(image_path, os.path.join(class_folder, file))
                except (FileNotFoundError, KeyError, json.JSONDecodeError):
                    print("Error processing:", image_path)
                    continue

# 최초 실행 시 데이터 정리
if not os.path.exists('data_organized.txt'):
    organize_data(image_folder, label_folder)
    with open('data_organized.txt', 'w') as f:
        f.write('Data has been organized.')

# 테스트 및 트레이닝 데이터 분할 함수 정의
def split_data(organized_folder, test_size=0.2):
    train_folder = 'data/train'
    test_folder = 'data/test'

    if not os.path.exists(train_folder):
        os.makedirs(train_folder)

    if not os.path.exists(test_folder):
        os.makedirs(test_folder)

    for class_name in os.listdir(organized_folder):
        class_folder = os.path.join(organized_folder, class_name)
        images = os.listdir(class_folder)
        train_images, test_images = train_test_split(images, test_size=test_size, random_state=42)

        train_class_folder = os.path.join(train_folder, class_name)
        if not os.path.exists(train_class_folder):
            os.makedirs(train_class_folder)

        test_class_folder = os.path.join(test_folder, class_name)
        if not os.path.exists(test_class_folder):
            os.makedirs(test_class_folder)

        for image in train_images:
            shutil.copy(os.path.join(class_folder, image), os.path.join(train_class_folder, image))

        for image in test_images:
            shutil.copy(os.path.join(class_folder, image), os.path.join(test_class_folder, image))

# 데이터 분할
split_data('dataset02')

# 이미지 데이터 제너레이터 설정
train_datagen = ImageDataGenerator(rescale=1. / 255)
test_datagen = ImageDataGenerator(rescale=1. / 255)

train_generator = train_datagen.flow_from_directory(
    'data/train',
    target_size=img_size,
    batch_size=32,
    class_mode='sparse')

validation_generator = test_datagen.flow_from_directory(
    'data/test',
    target_size=img_size,
    batch_size=32,
    class_mode='sparse')

# 모델 정의
model = Sequential()
model.add(Conv2D(32, (3, 3), activation='relu', input_shape=(img_size[0], img_size[1], 3)))
model.add(MaxPooling2D((2, 2)))
model.add(Conv2D(64, (3, 3), activation='relu'))
model.add(MaxPooling2D((2, 2)))
model.add(Conv2D(64, (3, 3), activation='relu'))
model.add(Flatten())
model.add(Dense(64, activation='relu'))
model.add(Dense(num_classes, activation='softmax'))

# 모델 컴파일
model.compile(optimizer='adam', loss='sparse_categorical_crossentropy', metrics=['accuracy'])

# 모델 요약
model.summary()

# 모델 학습
model.fit(train_generator, epochs=30, validation_data=validation_generator)

# 모델 평가
loss, accuracy = model.evaluate(validation_generator)

print("테스트 데이터 손실:", loss)
print("테스트 데이터 정확도:", accuracy)

# 모델 저장
model.save('./model.h5')
