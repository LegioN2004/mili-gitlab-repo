#include<iostream>
using namespace std;
int c=45;// global variable dealing with local variable
int main()
{
    // first program tutorial 
    // int a,b,c;
    // cout<<"Enter the value of a:"<<endl;
    // cin>>a;
    // cout<<"Enter the value of b:"<<endl;
    // cin>>b;
    // c=a+b;
    // cout<<"The sum is"<<c<<endl; 
    // cout<<"The global variable is "<<::c; // :: this is scope resolution operator, it is used to 
    // bring a global variable value in a local variable one 
      
    //*********** Float, double and long double literals ****************
     float d=34.4f; // here float value is written with f as compiler detects a decimal no as double if f is not used
     long double e =34.4l; // here l is written with the value to show that it is a long double data type
     // here  this type of number is written with a f/l as by default decimal nos are double data type
     // you can use capital or small letter in case of f or l
    // second program
    //  cout<< "The value of d is "<<d<<endl<<"The value of e is "<<e;
    //  cout<<"The size of 34.4 is  "<< sizeof(34.4)<<endl;
    //  cout<<"The size of 34.4f is "<< sizeof(34.4)<<endl;
    //  cout<<"The size of 34.4F is "<< sizeof(34.4)<<endl;
    //  cout<<"The size of 34.4l is "<< sizeof(34.4)<<endl;
    //  cout<<"The size of 34.4L is "<< sizeof(34.4)<<endl;
    
    // *************** Reference Variables *******************
    // float x = 455;  
    // float & y=x; here '&' (ampersand) symbol is used to give a different name to a variable for which the value of
    // y is also the same as 455
    // cout<<x<<endl;
    // cout<<y<<endl;
    
    // ***************** Typecasting ******************
    int a = 45;
    float b = 45.47;
    cout<<"The value of a is  "<<(float)a<<endl;// typecasting means to convert one data type to another, here a has int value
    // but conversion is done to float and since it doesn't has float value so it will simply print int value
    cout<<"The value of b is "<<(int)b<<endl;// here float is converted to int so only the int part of the decimal no is printed
    // typecasting can be done by keeping the data type desired to be converted to in the brackets in cout or by putting
    // only the variable declared in the brackets , eg : int(b); or (int) b;
    int c= int (b);// this is valid , you can initialise the typecasted values to other values
    cout<< " the expression for the value of c is "<< c<< endl;
    cout<< "The expression is "<<a+b<<endl;
    cout<< "The expression is "<<a+int (b)<<endl;
    cout<< "The expression is "<<a+(int) b<<endl;
    
    
    
    return 0;
}
