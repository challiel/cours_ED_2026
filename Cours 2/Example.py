from sklearn import model
import pandas as pd

def my_function(input1, input2):
    output1 = input1+input2
    output2 = input1*input2
    return output1,output2

if __name__=='__main__':

    a,b = my_function(input1 = 10, input2 = 20) 
    c,d = my_function(4, 11) 

    X_train, X_test, Y_train, Y_test = train_test_split(df) # You will need to find a way to implement this function

    model_instance = model(size = 15, layers = (30,20,15,10), solver = 'adam') # The model hyperparameters are different for every models

    
    model_instance.fit(X_train, Y_train) #We modify the model properties to fit our data, the model can be reused with new data at any given point
    pred = model_instance.predict(X_test) #We generate an array with all the predictions for each individual test samples