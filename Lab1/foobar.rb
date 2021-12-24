# Если хотя бы одно равно 20 - возвращает второе число, в противном случае выводит сумму этих чисел
def foobar(foo, bar)
  if foo == 20
    bar
  elsif bar == 20
    foo
  else
    foo + bar
  end
end

print '(15, 20): '
p foobar(15, 20)
print '(20, 10): '
p foobar(20, 10)
print '(10, 10): '
p foobar(10, 10)
