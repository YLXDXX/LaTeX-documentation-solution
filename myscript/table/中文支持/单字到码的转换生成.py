import string
'''
i = 1
filename ='test.txt'
with open(filename,'a') as file_object:
 for w1 in ["X","Y"]:
  for w2 in string.ascii_uppercase:
   for w3 in string.ascii_uppercase:
    for w4 in string.ascii_uppercase:
     file_object.write('@'+str(w1)+str(w2)+str(w3)+str(w4)+'@\n')
'''

filename1 ='code-zhi.txt'
with open(filename1,'a') as file_object:
 zhicode = open('zhi.txt', 'r', encoding='utf-8')
 macode = open('ma.txt', 'r', encoding='utf-8')
 for linezhi, linema in zip(zhicode, macode):
  linezhi=linezhi.strip('\n')
  linema = linema.strip('\n')
  file_object.write('s/' + str(linezhi) + '/' + str(linema) + '/g;\n')


filename2 ='zhi-code.txt'
with open(filename2,'a') as file_object:
 zhicode = open('zhi.txt', 'r', encoding='utf-8')
 macode = open('ma.txt', 'r', encoding='utf-8')
 for linezhi, linema in zip(zhicode, macode):
  linezhi=linezhi.strip('\n')
  linema = linema.strip('\n')
  file_object.write('s/' + str(linema) + '/' + str(linezhi) + '/g;\n')



