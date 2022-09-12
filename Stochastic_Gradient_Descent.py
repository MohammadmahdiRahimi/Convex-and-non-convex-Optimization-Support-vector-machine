import numpy as np
import pandas as pd
import matplotlib.lines as matline
import matplotlib.pyplot as matplt

# load iris
from sklearn import datasets
iris = datasets.load_iris()
data = iris.data[:,:2]
lable = iris.target

n = 2000 #iteration 
for k in range(len(lable)):
    if lable[k] == 0:
        lable[k] = 1
    else:
        lable[k] = 0
alpha = 0.01
l = len(data)
w = np.zeros((data.shape[1], 1)) #first w
b = 0 #first b
for i in range(n):
    for j in range(l):
        td = data[j, :]
        Z = np.dot(w.T, td.T) + b
        pre = 1 / (1 + (1 / np.exp(Z))) 
        tl = lable[j]
        en = pre - tl                              
        pw = np.multiply(td, en).reshape((2, 1))  #gradient
        pb = en
        w = w - pw*alpha #new w 
        b = b - pb*alpha  #new b

print("w is")
print(w)
print("\n")
print("b is")
print(b)
print("\n")
bb=-b/w[1]  
mm=-w[0]/w[1]
x0=[0,8]
y0=mm*x0+bb
fig, ax = matplt.subplots()
ax.scatter(data[:, 0], data[:, 1], c=lable , cmap=matplt.cm.Set1,edgecolor='k')
line=matline.Line2D(x0,y0,color='g')
ax.add_line(line)
matplt.show()












