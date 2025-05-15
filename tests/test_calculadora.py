import calculadora.calculadora as calc

def test_somar_numeros_soma_com_input ():
    actual_result = calc.somar_numeros (num1 = 8, num2 = 2)
    assert actual_result == 10

def test_subtrair_numeros_com_input ():
    actual_result = calc.subtrair_numeros (num1 = 9, num2 = 9)
    assert actual_result == 0    
    
def test_dividir_numeros_com_input ():
    actual_result = calc.dividir_numeros (num1 = 9, num2 = 9)
    assert actual_result == 1 

def test_multiplicar_numeros_com_input ():
    actual_result = calc.multiplicar_numeros (num1 = 9, num2 = 9)
    assert actual_result == 81
    
def test_elevar_numeros_com_input ():
    actual_result = calc.elevar_numeros (num1 = 2, num2 = 3)
    assert actual_result == 8
    
def test_extrair_raiz_quadrada_numeros_com_input ():
    actual_result = calc.extrair_raiz_quadrada (num1 = 81)
    assert actual_result == 9 

#Utilização de IA para resolver o problema de importar as funções que estão em outro arquivo e em outra pasta. Solução: Importar a pasta e o arquivo inteiro e dar um nome "calc" e depois utilizar nas operações.