# a = input()
# b = input()
# c = input()
# print([a, b, c])

# void m(1, 2, 3, 4)


class Pessoa:
  def __init__(self, nome):
    self.nome = nome
  def miar(self):
    print("miau")


def teste2(p):
  print(p.nome) #Ana
  p.nome = 'Ana Maria'
  print(p.nome)#Ana Maria

p = Pessoa('Ana')
print(p.nome) # Ana
teste2(p)
print(p.nome)

def teste1(a):
  print(a)
  a = 2
  print(a)

a = 3
teste1(a)
print(a)