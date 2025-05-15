def somar_numeros (num1, num2):
    return num1 + num2

def subtrair_numeros (num1, num2):
    return num1 - num2

def test_somar_numeros_soma_com_input ():
    actual_result = somar_numeros (num1 = 9, num2 = 9)
    assert actual_result == 18

def test_subtrair_numeros_com_input ():
    actual_result = subtrair_numeros (num1 = 9, num2 = 9)
    assert actual_result == 0    

    