def add(a,b):
return a+b

def subtract(a,b):
return a-b

def multiply(a,b):
    return a*b

def divide(a,b):
    try:
        return a/b
    except ZeroDivisionError:
        return "Error: Division by zero is not allowed."

def calculator():
    print("Simple Calculator")
    print("Select operation:")
    print("1. Add")
    print("2. Subtract")
    print("3. Multiply")
    print("4. Divide")

    choice = input("Enter choice (1/2/3/4): ")
    if choice not in ('1', '2', '3', '4'):
        print("Invalid input")
        return

    try:
        num1 = float(input("Enter first number: "))
        num2 = float(input("Enter second number: "))
    except ValueError:
        print("Invalid number input.")
        return

    if choice == '1':
        print(f"Result: {add(num1, num2)}")
    elif choice == '2':
        print(f"Result: {subtract(num1, num2)}")
    elif choice == '3':
        print(f"Result: {multiply(num1, num2)}")
    elif choice == '4':
        print(f"Result: {divide(num1, num2)}")

# Run the calculator
calculator()
