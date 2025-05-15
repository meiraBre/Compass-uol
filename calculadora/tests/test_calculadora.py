from calculadora.calculadora import somar_numeros, subtrair_numeros, dividir_numeros, multiplicar_numeros, elevar_numeros, extrair_raiz_quadrada

def test_somar_numeros_soma_com_input ():
    actual_result = somar_numeros (num1 = 8, num2 = 2)
    assert actual_result == 10

def test_subtrair_numeros_com_input ():
    actual_result = subtrair_numeros (num1 = 9, num2 = 9)
    assert actual_result == 0    
    
def test_dividir_numeros_com_input ():
    actual_result = dividir_numeros (num1 = 9, num2 = 9)
    assert actual_result == 1 

def test_multiplicar_numeros_com_input ():
    actual_result = multiplicar_numeros (num1 = 9, num2 = 9)
    assert actual_result == 81
    
def test_elevar_numeros_com_input ():
    actual_result = elevar_numeros (num1 = 2, num2 = 3)
    assert actual_result == 8
    
def test_extrair_raiz_quadrada_numeros_com_input ():
    actual_result = extrair_raiz_quadrada (num1 = 81)
    assert actual_result == 9 
    