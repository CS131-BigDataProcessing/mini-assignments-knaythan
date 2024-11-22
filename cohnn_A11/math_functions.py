def power(base, exponent):
    """Raises a base number to the given exponent."""
    return base ** exponent

def divide(numerator, denominator):
    """Divides the numerator by the denominator."""
    if denominator == 0:
        raise ValueError("Cannot divide by zero")
    return numerator / denominator
