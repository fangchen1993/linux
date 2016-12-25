#encoding:utf-8
#Monte Carlo for find the max value of the function sin(x)*exp(-0.05x)in the interval [-2,2]
#My name is FC
import numpy as np
import random
ymax=0
y= lambda x:np.sin(x)*exp(-0.05*x)
num=int(raw_input("请输入模拟次数："))
for i in range(num):
	x=random.uniform(-2,2)
	if y(x)>ymax:
		ymax=y(x)
		xmax=x
print ymax
