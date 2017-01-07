# 描述：complicated 项目 makefile文件
# 版本：v1.5
# 修改记录：
# 1. 为complicated项目makefile添加注释
# 2. 使用变量改进我们complicated项目的makefile
# 3. 使用静态模式规则，简化makefile
# 4. 使用伪目标，加上clean规则
# 5. 引进wildcard函数，自动扫描当前目录下的源文件
# 6. 加入自动规则依赖

#定义可执行文件变量
executbale := complicated
# wildcard函数扫描源文件，定义列表变量
sources :=$(wildcard *.c)
# 使用变量的引用替换，定义object文件列表
objects :=$(sources:.c=.o)
# 使用变量的引用替换，定义依赖描述文件列
deps :=$(sources:.c=.d)


# 定义编译命令变量
CC :=gcc

# 终极目标规则，生成complicated可执行文件
$(executbale):$(objects)
#  使用自动化变量改造我们的编译命令
	$(CC) -o $@ $^

# 子规则, main.o和complicated.o的生成规则，使用静态模式规则
$(objects):%.o:%.c
	$(CC)  -o $@ -c $<

#clean规则	 
.PHONY:clean
clean:
	-rm $(executbale) $(objects)


#自动规则依赖
sinclude $(deps)

$(deps):%.d:%.c
	$(CC) -MM $< >$@


