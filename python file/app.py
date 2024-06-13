from keras import Sequential
from keras.layers import Flatten, Dense, Dropout, BatchNormalization, LeakyReLU
from keras.optimizers import Adam
from keras.applications import VGG16
from keras.preprocessing.image import ImageDataGenerator
from keras.callbacks import EarlyStopping
train_dir = './dataset02'
test_dir = './dataset_test'
# 이미지 증강(학습 데이터가 너무 적을때)

train_gen = ImageDataGenerator()
test_gen = ImageDataGenerator()
train_generator = train_gen.flow_from_directory(train_dir
                , target_size=(224, 224), batch_size=10
                , class_mode='categorical', shuffle=True)
test_generator = test_gen.flow_from_directory(test_dir
                , target_size=(224, 224), batch_size=10
                , class_mode='categorical', shuffle=True)
# 분류 클래스 수
class_num = len(train_generator.class_indices)
# 클래스의 명칭
labels = list(train_generator.class_indices.keys())

early_stopping = EarlyStopping(
    monitor='val_acc',  # Metric to monitor
    patience=2,         # Number of epochs with no improvement after which training will be stopped
    mode='max',         # Mode should be 'max' for accuracy (stop when accuracy is no longer increasing)
    verbose=1,
    restore_best_weights=True  # Restore model weights from the epoch with the best value of the monitored quantity
)


# vgg16은 1000개의 클래스로 pre-training 되어진 모델(사전학습된)
# 사전학습된 모델을 새로운 목적으로 변경 하는것을 fine-tuning 이라함.
vgg_layer = VGG16(weights='imagenet'
                 ,include_top=False, input_shape=(224, 224, 3))
vgg_layer.summary()
for layer in vgg_layer.layers:
    layer.trainable = False #잘 학습 되어진 부분은 학습되지 않도록 고정
# 새로운 모델 생성
model = Sequential()
model.add(vgg_layer)
model.add(Flatten())
model.add(Dense(1024))
model.add(BatchNormalization())
model.add(LeakyReLU(alpha=0.1))
model.add(Dropout(0.5))

# Second dense layer
model.add(Dense(1024))
model.add(BatchNormalization())
model.add(LeakyReLU(alpha=0.1))
model.add(Dropout(0.5))

# Third dense layer
model.add(Dense(512))
model.add(BatchNormalization())
model.add(LeakyReLU(alpha=0.1))
model.add(Dropout(0.5))

# Output layer
model.add(Dense(class_num, activation='softmax'))

# Model summary
model.summary()

# Compile the model
model.compile(loss='categorical_crossentropy',
              optimizer=Adam(learning_rate=1e-4),  # Experiment with learning rates
              metrics=['acc'])
model.fit_generator(
    train_generator,
    steps_per_epoch=train_generator.samples / train_generator.batch_size,
    epochs=40,
    validation_data=test_generator,
    validation_steps=test_generator.samples / test_generator.batch_size,
    verbose=1,
    callbacks=[early_stopping]
)

# Save the model
model.save('improved_cycle4.h5')