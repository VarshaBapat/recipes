def m1(a1,a2='s2',a3='s3')
    puts a1,a2,a3
end

def m2(a1:,a2:'s2',a3:'s3')
    puts a1,a2,a2
end

m1('a1')
m2(a1:'a1')