from setuptools import setup, find_packages

setup(
    name="crime_test",
    version="1.0.0",
    author="nathan Cohn",
    author_email="nathan.cohn@sjsu.edu",
    description="A package for validating crime data and calculating statistics from a csv",
    packages=find_packages(),
    install_requires=[
        "numpy==2.1.3",
        "pandas==2.2.3",
        "python-dateutil==2.9.0.post0",
        "pytz==2024.2",
        "setuptools==75.6.0",
        "six==1.17.0",
        "tzdata==2024.2"
    ],
    classifiers=[
        "Programming Language :: Python :: 3",
        "License :: OSI Approved :: MIT License",
        "Operating System :: OS Independent",
    ],
    python_requires=">=3.12",
)
