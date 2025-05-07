# Import Required Libraries
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
from sklearn.preprocessing import MinMaxScaler
from sklearn.model_selection import train_test_split
from tensorflow.keras.models import Sequential
from tensorflow.keras.layers import LSTM, Dense
from sklearn.metrics import mean_squared_error

# Step 1: Load the Dataset
data = pd.read_csv(r"C:\Users\kpriy\Downloads\Dengue Data.csv")

# Display basic info and check for missing values
print(data.head())
print(data.info())
print(data.describe())
print(data.isnull().sum())

# Step 2: Data Preprocessing
# Handle missing values (use forward fill for simplicity here)
data.fillna(method='ffill', inplace=True)

# Step 3: Feature Selection and Scaling
# Adjust column names for the dataset you have
features = data[['Temperature', 'Rainfall', 'Humidity', 'Wind']]  # Use columns available in your dataset
target = data['Case']  # Replace with the actual target column name, like 'Case' if that's your target

# Normalize the feature data
scaler = MinMaxScaler()
features_scaled = scaler.fit_transform(features)

# Step 4: Train-Test Split
X_train, X_test, y_train, y_test = train_test_split(features_scaled, target, test_size=0.2, random_state=42)

# Step 5: Prepare Data for LSTM (Create sequences)
def create_sequences(data, target, sequence_length):
    X, y = [], []
    for i in range(len(data) - sequence_length):  # Ensure we only go up to the valid index range
        X.append(data[i:i + sequence_length])
        y.append(target.iloc[i + sequence_length])  # Use iloc to access by position, not by index label
    return np.array(X), np.array(y)

sequence_length = 10  # Example value for sequence length
X_train_seq, y_train_seq = create_sequences(X_train, y_train, sequence_length)
X_test_seq, y_test_seq = create_sequences(X_test, y_test, sequence_length)

# Step 6: Build and Train LSTM Model
model = Sequential([
    LSTM(50, activation='relu', return_sequences=True, input_shape=(X_train_seq.shape[1], X_train_seq.shape[2])),
    LSTM(50, activation='relu'),
    Dense(1)
])

model.compile(optimizer='adam', loss='mse')

# Train the model
model.fit(X_train_seq, y_train_seq, epochs=20, batch_size=32, validation_data=(X_test_seq, y_test_seq))

# Step 7: Evaluate the Model
predictions = model.predict(X_test_seq)

# Visualize True vs Predicted Values
plt.plot(y_test_seq, label='True Values')
plt.plot(predictions, label='Predictions')
plt.legend()
plt.show()

# Calculate RMSE
rmse = np.sqrt(mean_squared_error(y_test_seq, predictions))
print(f"RMSE: {rmse}")

# Step 8: Save the Model for Future Use
model.save('dengue_forecasting_model.h5')
