from keras.models import load_model
from keras.preprocessing.image import ImageDataGenerator
import numpy as np

# Load the trained model
model = load_model('improved_cycle3.h5')

# Define the test data generator
test_gen = ImageDataGenerator()

# Path to the test dataset
test_dir = './dataset_test'

# Create the test data generator
test_generator = test_gen.flow_from_directory(
    test_dir,
    target_size=(224, 224),
    batch_size=10,
    class_mode='categorical',
    shuffle=False  # No need to shuffle for testing
)

# Evaluate the model on the test data
loss, accuracy = model.evaluate(test_generator, steps=test_generator.samples / test_generator.batch_size)
print(f'Test Loss: {loss}')
print(f'Test Accuracy: {accuracy}')

# Predict on the test data
test_generator.reset()  # Reset the generator before making predictions
predictions = model.predict(test_generator, steps=test_generator.samples / test_generator.batch_size)
predicted_classes = np.argmax(predictions, axis=1)

# Get the true classes
true_classes = test_generator.classes

# Class labels
class_labels = list(test_generator.class_indices.keys())

# Print some example predictions
for i in range(10):  # Print first 10 examples
    print(f"Image {i+1} - True: {class_labels[true_classes[i]]}, Predicted: {class_labels[predicted_classes[i]]}")

# You can also use classification report and confusion matrix for more detailed analysis
from sklearn.metrics import classification_report, confusion_matrix

# Generate a classification report
print(classification_report(true_classes, predicted_classes, target_names=class_labels))

# Generate a confusion matrix
conf_matrix = confusion_matrix(true_classes, predicted_classes)
print(conf_matrix)
