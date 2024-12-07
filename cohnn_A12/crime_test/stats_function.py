import pandas as pd
import statistics

def calculate_mean_median_age(series):
    """
    Calculates the mean and median of a pandas Series containing ages.
    """
    if not isinstance(series, pd.Series):
        raise TypeError("Input must be a pandas Series.")
    if series.empty:
        raise ValueError("The input Series is empty.")
    mean_age = series.mean()
    median_age = series.median()
    return mean_age, median_age
