from setuptools import setup, find_packages

setup(
    name="testing-pytest-moto",
    version="0.1.0",
    author="Thai Le",
    packages=find_packages(where="."),
    install_requires=[
        "boto3",
    ],
    python_requires=">=3.7",
)