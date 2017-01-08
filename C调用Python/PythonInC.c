#include </usr/include/python2.7/Python.h>
#include <stdlib.h>
#include <string.h>

int main(int argc,char *argv[])
{

	PyObject *pName,*pModule,*pDict,*pFunc;//define the data stucture
	PyObject *pArgs ,*pValue;

	Py_Initialize(); //initilize

	PySys_SetPath("/home/fc/桌面/algorithm/C调用Python"); //import the path of the python module
	pName = PyString_FromString(argv[1]);//argv[1] is the module "printData.py"


	pModule = PyImport_Import(pName);
	if(pModule != NULL){
		PyObject *pythonArgument;
		pythonArgument = PyTuple_New(1);//create the tuple to save the varibles
		pValue = PyString_FromString(argv[3]);//the argument of the command line such as "cyberpersons"

		if(pValue == NULL){
			return 1;//return the signal to the console.it doesn't influcence the program.In this program,it will prompt for errors "segmentation fault"
		}
		PyTuple_SetItem(pythonArgument,0,pValue);//stored the first argument in the pos '0' 
		pFunc = PyObject_GetAttrString(pModule,argv[2]);//the function of module "printData.py"
		if(pFunc && PyCallable_Check(pFunc)){
			pValue = PyObject_CallObject(pFunc,pythonArgument);
			if (pValue != NULL){
				printf("方辰真的是 %s", PyString_AsString(pValue));//PyString_AsString() is to convert Pyobject object to char object

			}else{
				PyErr_Print();
			}
			}else{
				if(PyErr_Occurred())
					PyErr_Print();
				fprintf(stderr, "Cannot find function \"%s\"\n",argv[2] ); //for the two kinds of errors one is can't find the function the other is can't find the module
			}
		}
		else{
			PyErr_Print();
			fprintf(stderr, "Failed to load \"%s\"\n",argv[1] ); //stdout -- 标准输出设备 (printf("..")) 同 stdout。stderr -- 标准错误输出设备
			return 1;
		}

		}
				 
		 
	 
