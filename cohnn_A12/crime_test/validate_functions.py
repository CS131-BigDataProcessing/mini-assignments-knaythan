import pandas as pd

def validate_victim_sex(series):
    """
    Validates that the 'Vict sex' column in a pandas Series contains only 'M', 'F',
    and no NULL values.
    """
    if not isinstance(series, pd.Series):
        raise TypeError("Input must be a pandas Series.")
    invalid_values = series[~series.isin(['M', 'F'])]
    if len(invalid_values) > 0:
        raise ValueError(f"Invalid values found in Vict sex: {invalid_values.tolist()}")
    if series.isnull().any():
        raise ValueError("Vict sex contains NULL values.")
    return True


def validate_victim_age(series):
    """
    Validates that the 'Vict age' column in a pandas Series is between 1 and 100
    and contains no NULL values.
    """
    if not isinstance(series, pd.Series):
        raise TypeError("Input must be a pandas Series.")
    invalid_values = series[(series < 1) | (series > 100)]
    if len(invalid_values) > 0:
        raise ValueError(f"Invalid values found in Vict age: {invalid_values.tolist()}")
    if series.isnull().any():
        raise ValueError("Vict age contains NULL values.")
    return True
