#encoding=utf-8
#Monte Carlo for PI
import random
import numpy as np
def MC(num):
	count=0
	for i in range(num):
		x=random.uniform(0,1)
		y=random.uniform(0,1)
		if np.sqrt(np.square(x-0.5)+np.square(y-0.5))<=0.5:
			count +=1
	return 4.0*count/num


inputNum=raw_input("请输入模拟的次数：")
num=int(inputNum)
PI=MC(num)
print PI

