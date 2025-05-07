import pandas as pd

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