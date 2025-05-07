import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from sklearn.preprocessing import MinMaxScaler
from tensorflow.keras.models import Sequential
from tensorflow.keras.layers import LSTM, Dense

import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from sklearn.preprocessing import MinMaxScaler
from tensorflow.keras.models import Sequential
from tensorflow.keras.layers import LSTM, Dense
from sklearn.metrics import mean_absolute_error, mean_squared_error

def mean_absolute_percentage_error(y_true, y_pred):
    return np.mean(np.abs((y_true - y_pred) / y_true)) * 100

def symmetric_mean_absolute_percentage_error(y_true, y_pred):
    return 100 / len(y_true) * np.sum(2 * np.abs(y_pred - y_true) / (np.abs(y_true) + np.abs(y_pred)))

def forecast_function():
    # Load the synthetic dataset


    # Load the CSV file
    file_path = 'CoronaVirus Data.csv'  # Replace with the path to your CSV file
    data = pd.read_csv(file_path)

    # Filter for India-specific data
    india_data = data[data['Country/Region'] == 'India'][['Date', 'Confirmed Daily']]

    # Step 1: Handle missing values
    # Fill any missing values in 'Confirmed Daily' with 0 or interpolate if preferred
    india_data['Confirmed Daily'].fillna(0, inplace=True)  # or use interpolate method

    # Step 2: Convert 'Date' to datetime format for easier analysis
    india_data['Date'] = pd.to_datetime(india_data['Date'], errors='coerce')

    # Step 3: Sort by Date to ensure chronological order
    india_data = india_data.sort_values(by='Date').reset_index(drop=True)

    # Step 4: Remove any duplicates if present
    india_data.drop_duplicates(subset='Date', keep='first', inplace=True)

    # Step 5: Handle any remaining invalid dates (e.g., NaT values if date conversion failed)
    india_data = india_data.dropna(subset=['Date'])  # Drops rows where 'Date' is NaT

    # Step 6: Check for any extreme outliers in 'Confirmed Daily'
    # Define a threshold (optional), e.g., beyond 3 standard deviations, and handle accordingly
    mean = india_data['Confirmed Daily'].mean()
    std_dev = india_data['Confirmed Daily'].std()
    threshold = mean + 3 * std_dev
    india_data['Confirmed Daily'] = india_data['Confirmed Daily'].apply(lambda x: mean if x > threshold else x)

    # Display preprocessed data
    print(india_data.head())
    df = india_data#pd.read_csv(r'C:\Users\kpriy\Downloads\disease_prediction\disease_prediction\dataset.csv')
    df['Date'] = pd.to_datetime(df['Date'])
    df.set_index('Date', inplace=True)



    # Scale the data between 0 and 1
    scaler = MinMaxScaler(feature_range=(0, 1))
    scaled_data = scaler.fit_transform(df.values)

    # Split data into training and testing sets
    train_size = int(len(scaled_data) * 0.8)
    # train_data = scaled_data[:train_size]
    # test_data = scaled_data[train_size:]
    train_data = scaled_data
    test_data = scaled_data

    # Create sequences for LSTM (X_train, y_train)
    def create_sequences(data, sequence_length):
        X, y = [], []
        for i in range(len(data) - sequence_length):
            X.append(data[i:i + sequence_length, 0])
            y.append(data[i + sequence_length, 0])
        return np.array(X), np.array(y)

    sequence_length = 3  # Adjust as needed
    X_train, y_train = create_sequences(train_data, sequence_length)
    X_test, y_test = create_sequences(test_data, sequence_length)

    # Reshape data for LSTM (samples, timesteps, features)
    X_train = np.reshape(X_train, (X_train.shape[0], X_train.shape[1], 1))
    X_test = np.reshape(X_test, (X_test.shape[0], X_test.shape[1], 1))

    # Build LSTM model
    model = Sequential()
    model.add(LSTM(50, return_sequences=False, input_shape=(X_train.shape[1], 1)))
    model.add(Dense(1))

    # Compile and fit the model
    model.compile(optimizer='adam', loss='mean_squared_error')
    history = model.fit(X_train, y_train, epochs=10, batch_size=32, validation_data=(X_test, y_test))

    # Make predictions
    predictions = model.predict(X_test)
    predictions = scaler.inverse_transform(predictions)  # Rescale to original values
    y_test_rescaled = scaler.inverse_transform(y_test.reshape(-1, 1))
    # return (y_test_rescaled,predictions)
    # Plot the results




    # Make predictions
    predictions = model.predict(X_test)


    # Calculate evaluation metrics
    mae = mean_absolute_error(y_test, predictions)
    mse = mean_squared_error(y_test, predictions)
    rmse = np.sqrt(mse)
    mape = mean_absolute_percentage_error(y_test, predictions)
    smape = symmetric_mean_absolute_percentage_error(y_test, predictions)

    # MASE calculation
    naive_forecast = y_test[:-1]
    mase = mean_absolute_error(y_test[1:], naive_forecast) / mae

    # Mean Directional Accuracy (MDA)
    mda = np.mean(
        (np.sign(predictions[1:] - predictions[:-1]) == np.sign(y_test[1:] - y_test[:-1])).astype(
            int)) * 100

    # Print evaluation metrics
    print(f"Mean Absolute Error (MAE): {mae}")
    print(f"Mean Squared Error (MSE): {mse}")
    print(f"Root Mean Squared Error (RMSE): {rmse}")
    print(f"Mean Absolute Percentage Error (MAPE): {mape}")
    print(f"Symmetric Mean Absolute Percentage Error (sMAPE): {smape}")
    print(f"Mean Absolute Scaled Error (MASE): {mase}")
    print(f"Mean Directional Accuracy (MDA): {mda}%")



    predictions = scaler.inverse_transform(predictions)
    y_test_rescaled = scaler.inverse_transform(y_test.reshape(-1, 1))
    print(predictions,"predictions")
    plt.figure(figsize=(10,6))
    plt.plot(df.index[-len(y_test):], y_test_rescaled, color='blue', label='Actual')
    plt.plot(df.index[-len(predictions):], predictions, color='red', label='Predicted')
    plt.title('LSTM Time Series Forecasting')
    plt.xlabel('Date')
    plt.ylabel('Value')
    plt.legend()
    plt.show()
forecast_function()