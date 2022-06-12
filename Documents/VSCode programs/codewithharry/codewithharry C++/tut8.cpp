#include<iostream>
#include<iomanip> // to use the keyword setw which is used to shift characters to the right
#include< 
#include
using namespace std;
int main()
{
    // int a=34;
    // cout<<"The value of a was :"<<a;
    // a=45;
    // cout<<"The value of a is :"<<a; 
              // constants in c++
     // first program
     //const int a =34; // if this const keyword is used then the value of a will remain constant so that there are no 
//     const float b= 3.111// accidental mistakes. after the const value is initialised then after that the value cannot be changed
//     cout<<"The value of a was :"<<a<<endl;
//     a=45;// here it is trying to change but there will be error
//     cout<<"The value of a is :"<<a<<endl; 
//    cout<< " the value of b is :"<< b << endl;
//     b=24;// error
     
    // Manipulators in C++
    // second prgram
    
    //  int a=3, b=44,c=5345 ;
    //  cout<<" The value of a without setw is : "<< a<<endl;
    //  cout<<" The value of b without setw is : "<< b<<endl;
    //  cout<<" The value of c without setw is : "<< c <<endl;
     
    //  cout<<" The value of a is : "<<setw(4)<<a<<endl; // here the no in the bracket of setw shows the space taken and
    //  // it is used to shift the nos to the right with spaces as taken in the brackets
    //  cout<<" The value of b is : "<<setw(4)<<b<<endl; // here 4 is taken in () so the no 3 is printed with 3 spaces first
    //  cout<<" The value of c is : "<<setw(4)<<c<<endl;// and then 3 like '   3'
    
    
    // Operator Precedence
     
     int a=3 , b=4; // which operator will be first used
    //  int c= ((a*5)+b)
     int c= ((((a*5)+b)-47)+87); // precedence is given to * so use them in brackets but  +, - has equal precendence (see from the net)
     //so  we have to see the associativity which is from left to right 
     cout<<c;
    return 0;
}
