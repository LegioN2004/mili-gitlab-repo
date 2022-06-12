#include<iostream>
using namespace std;
// function are one of the most important part of top down structured programming 
//#1 funtion ---> to break down a program to use it in different types of work  

//#2 function prototyping 
// type function-name (arguments)
int sum(int a, int b); // this tells the compiler(assurity) that if  it doesn't finds the sum then func prototyping tells that there is a sum and you can find it
// int sum(int , int ); --> this is also acceptable, only giving the type also does the work
// int sum(int a, b) -->not acceptable , you have to write both data type before the variable

int main()
{
 int num1, num2;                   
 cout<<"Enter first number"<<endl;  
 cin>> num1;                      // here we put the first value 
 cout<<"Enter second number"<<endl;
 cin>>num2;                      // and second value 
 // num1 and num2 are actual parameters 
 cout<<"The sum is "<<sum(num1,num2);  //1stly it will find sum func and then given values will be given to *
    //* here i.e to sum and then it will print the value of c i.e answer
    
  return 0; // this means that the program has executed successfully
}


// function prototyping --> it tells the compiler that this that function will take some values and return some 
// in this case if we put sum 

int sum(int a, int b){  //* to a and b and then they will proceed to do the given operation in the next step
    // a and b are the actual parameters which will be taking values from actual parameters num1 and num2 
    int c =a+b; // and then the operation will take place and will give the value to the one written with return (in this case c)
    return c; // and the resultant value of c will go to *
}

// this int sum function part was before the int main part and now i have put this in the bottom part of the int main 
// so in this type of cases where we have to put the sum function part in the part after the main function the use of function prototyping comes into use
// we can also use same values of formal or actual parameters

