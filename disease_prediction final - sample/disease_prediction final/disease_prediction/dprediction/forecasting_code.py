import numpy as np
import pandas as pd

from sklearn.preprocessing import MinMaxScaler
from tensorflow.keras.models import Sequential
from tensorflow.keras.layers import GRU, Dense

def forecast_function():
    # Load the synthetic dataset
    df = pd.read_csv('dataset.csv')
    df['Date'] = pd.to_datetime(df['Date'])
    df.set_index('Date', inplace=True)

    # Scale the data between 0 and 1
    scaler = MinMaxScaler(feature_range=(0, 1))
    scaled_data = scaler.fit_transform(df.values)

    # Split data into training and testing sets
    train_size = int(len(scaled_data) * 0.8)
    train_data = scaled_data[:train_size]
    test_data = scaled_data[train_size:]

    if True:
        test_data = train_data

    # Create sequences for GRU (X_train, y_train)
    def create_sequences(data, sequence_length):
        X, y = [], []
        for i in range(len(data) - sequence_length):
            X.append(data[i:i + sequence_length, 0])
            y.append(data[i + sequence_length, 0])
        return np.array(X), np.array(y)

    sequence_length = 3  # Adjust as needed
    X_train, y_train = create_sequences(train_data, sequence_length)
    X_test, y_test = create_sequences(test_data, sequence_length)

    print(X_test, y_test)
    print(X_train, y_train)
    print("+++++++++++++++++++++++++++")
    print(X_test.shape, "=====================")

    X_train = np.reshape(X_train, (X_train.shape[0], X_train.shape[1], 1))
    X_test = np.reshape(X_test, (X_test.shape[0], X_test.shape[1], 1))

    # Build GRU model
    model = Sequential()
    model.add(GRU(50, return_sequences=False, input_shape=(X_train.shape[1], 1)))
    model.add(Dense(1))

    # Compile and fit the model
    model.compile(optimizer='adam', loss='mean_squared_error')
    history = model.fit(X_train, y_train, epochs=10, batch_size=32, validation_data=(X_test, y_test))

    # Make predictions
    predictions = model.predict(X_test)
    predictions = scaler.inverse_transform(predictions)  # Rescale to original values
    y_test_rescaled = scaler.inverse_transform(y_test.reshape(-1, 1))

    return (y_test_rescaled[:12], predictions[:12])
