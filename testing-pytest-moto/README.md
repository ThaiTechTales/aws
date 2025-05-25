# 🧪 testing-pytest-moto

A hands-on Python testing project that demonstrates how to use `pytest` and `moto` to test AWS services such as S3. This project also introduces foundational testing concepts such as unit tests, integration tests, and decorators.

---

## 📚 Prerequisites

### 🔁 Understanding Decorators

In Python, a **decorator** is a feature that allows one function to modify or enhance the behaviour of another function without changing its code. Decorators are commonly used in testing libraries and frameworks, such as `@mock_aws` from `moto`.

#### ✅ Basic Example of a Decorator Definition

```python
def my_logger(func):
    def wrapper():
        print("Before the function runs")
        func()
        print("After the function runs")
    return wrapper
```

- `my_logger` is a decorator function that takes another function (`func`) as input.
- It returns a new function (`wrapper`) that wraps the original `func` with additional logic.

#### ✨ Applying a Decorator

```python
@my_logger
def say_hello():
    print("Hello!")

say_hello()
```

#### 🖨 Output

```
Before the function runs
Hello!
After the function runs
```

In this example:

- `@my_logger` decorates the `say_hello` function.
- When `say_hello()` is executed, it is passed through `my_logger`, which logs messages before and after execution.

---

Decorators are widely used in test code to manage setup, teardown, and mocking. This project uses decorators such as `@mock_aws` from `moto` to simulate AWS services during tests.

---

## 🧪 Libraries Used in This Project

### ✅ `pytest`

[`pytest`](https://docs.pytest.org/) is a Python testing framework used to write:

- **Unit tests**: isolated tests for individual functions or modules
- **Integration tests**: tests that verify the interaction between multiple components or services

#### 📌 Why `pytest`?

- Minimal boilerplate (just write functions prefixed with `test_`)
- Rich assertion syntax and extensive plugin ecosystem
- Built-in test discovery and detailed failure output

#### 🧪 Example

```python
def add(x, y):
    return x + y

def test_add():
    assert add(2, 3) == 5
```

To execute tests:

```bash
pytest
```

---

### ✅ `moto`

[`moto`](https://github.com/getmoto/moto) is a Python library used to mock AWS services for local testing without the need for actual AWS credentials or API calls.

Supported services include:

- S3
- DynamoDB
- Lambda
- SQS, SNS, and more

#### 📌 Why `moto`?

- Enables offline AWS testing with full isolation
- Provides decorators that simplify mocking (e.g. `@mock_s3`)
- Avoids the risk of accidental cloud charges or data modification

#### 🧪 Example Using `moto`

```python
from moto import mock_s3
import boto3

@mock_s3
def test_upload_to_s3():
    s3 = boto3.client("s3", region_name="ap-southeast-2")
    s3.create_bucket(
        Bucket="my-bucket",
        CreateBucketConfiguration={"LocationConstraint": "ap-southeast-2"}
    )
    s3.put_object(Bucket="my-bucket", Key="test.txt", Body="hello")

    result = s3.get_object(Bucket="my-bucket", Key="test.txt")
    assert result["Body"].read().decode("utf-8") == "hello"
```

---

## ▶️ How to Run the Tests

Ensure the following steps are followed from the project root (where `setup.py` is located):

1. **Create and activate a virtual environment**

```bash
python3 -m venv .venv
source .venv/bin/activate
```

2. **Install the project and test dependencies**

```bash
pip install .
pip install -r tests/requirements.txt
```

3. **Execute the test suite using `pytest`**

```bash
pytest tests/
```

4. **(Optional) Generate a test coverage report**

```bash
coverage run -m pytest tests/
coverage report -m
```

5. **(Optional) Run all tests with coverage and detailed report in one command**

```bash
coverage run -m pytest tests/ && coverage report -m
```

---
