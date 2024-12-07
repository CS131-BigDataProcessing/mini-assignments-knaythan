import unittest
import pandas as pd
from validate_functions import validate_victim_sex, validate_victim_age
from stats_function import calculate_mean_median_age

class TestValidateFunctions(unittest.TestCase):

    def test_validate_victim_sex(self):
        valid_series = pd.Series(['M', 'F', 'M', 'F'])
        invalid_series = pd.Series(['M', 'X', None, 'F'])
        self.assertTrue(validate_victim_sex(valid_series))
        with self.assertRaises(ValueError):
            validate_victim_sex(invalid_series)
        with self.assertRaises(TypeError):
            validate_victim_sex(['M', 'F', 'M'])  # Invalid type

    def test_validate_victim_age(self):
        valid_series = pd.Series([25, 30, 40, 50])
        invalid_series = pd.Series([0, 150, None, 30])
        self.assertTrue(validate_victim_age(valid_series))
        with self.assertRaises(ValueError):
            validate_victim_age(invalid_series)
        with self.assertRaises(TypeError):
            validate_victim_age([25, 30, 40])  # Invalid type


class TestStatsFunctions(unittest.TestCase):

    def test_calculate_mean_median_age(self):
        ages_series = pd.Series([25, 30, 35, 40])
        mean, median = calculate_mean_median_age(ages_series)
        self.assertEqual(mean, 32.5)
        self.assertEqual(median, 32.5)

    def test_calculate_mean_median_age_empty_series(self):
        empty_series = pd.Series([], dtype=float)
        with self.assertRaises(ValueError):
            calculate_mean_median_age(empty_series)


if __name__ == '__main__':
    unittest.main()
