import numpy as np
import pandas as pd

# Generate sample time series data
np.random.seed(42)
time = np.arange(0, 100, 0.1)  # Time steps from 0 to 100
amplitude = np.sin(time) + np.random.normal(scale=0.5, size=len(time))  # Sin wave with noise

# Create DataFrame
df = pd.DataFrame({'Date': pd.date_range(start='2020-01-01', periods=len(time), freq='D'),
                   'Value': amplitude})

# Save to CSV (optional)
df.to_csv('sample_timeseries_data.csv', index=False)
