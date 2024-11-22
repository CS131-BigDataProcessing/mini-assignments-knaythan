import unittest
from math_functions import power, divide

class TestFunctions(unittest.TestCase):

    # Test cases for the power function
    def test_power_positive(self):
        self.assertEqual(power(2, 3), 8)

    def test_power_zero_exponent(self):
        self.assertEqual(power(5, 0), 1)

    def test_power_zero_base(self):
        self.assertEqual(power(0, 5), 0)

    def test_power_negative_exponent(self):
        self.assertAlmostEqual(power(2, -3), 0.125)

    # Test cases for the divide function
    def test_divide_normal(self):
        self.assertEqual(divide(10, 2), 5)

    def test_divide_by_zero(self):
        with self.assertRaises(ValueError):
            divide(10, 0)

    def test_divide_negative(self):
        self.assertEqual(divide(-10, 2), -5)

    def test_divide_zero_numerator(self):
        self.assertEqual(divide(0, 5), 0)

if __name__ == "__main__":
    unittest.main()
