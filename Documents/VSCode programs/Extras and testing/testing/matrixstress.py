import numpy as np

row_size = 1000
column_size = 1000
arr1 = np.random.rand(row_size, column_size)
arr2 = np.random.rand(row_size, column_size)
arr3 = np.random.rand(row_size, column_size)

print(np.matmul(arr1, arr2, arr3))
# if you want to get your computer crashed or freezed then change the row and column size to 20000