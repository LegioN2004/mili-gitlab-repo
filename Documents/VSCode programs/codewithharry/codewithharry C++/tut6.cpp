#include<iostream>
//there are two types of header files
// 1. system header files: It comes with the compiler like iostream 
//2. user defined header files: It is written by the programmer. for eg- #include<this.h> ; this header file must be 
// present as an empty file in the same folder as this.h wiht exact same name and it may porduce error if not present in current directory

using namespace std ;
int main()
{
   int a=4,b=5;
   cout<<"now operators in c++"<<endl; //study operators ,,,, also endl can be used to jump to a new line as /n.
  cout<<" the following are the arithmetic operators in c++";
  // arithmetic operators
  cout<<"the value of a+b is"<<a+b<<endl; // here +,-,/,* are add, sub , div and multiply and they're the arithmetic operators
  cout<<"the value of a-b is"<<a-b<<endl;  
  cout<<"the value of a*b is"<<a*b<<endl;  
  cout<<"the value of a/b is"<<a/b<<endl;
  cout<<"the value of a%b is"<<a%b<<endl;   // % is modulus function   
  cout<<"the value of a++ is"<<a++<<endl;  //1. here value of a is 5 but it shows only 4 as a++ first prints and then increases 
                                            // by 1 which shows in the next output
  cout<<"the value of a-- is"<<a--<<endl;  //2. here first value is 5 from above and then it becomes 4 but it shows 5 as a-- 
                                           //first prints and then shows the decreased number in the next line of statement
  cout<<"the value of ++a is"<<++a<<endl; // 3.so here value from above line comes as 4 and then it gets increased first and 
                                         //then prints the increased number 5 as the ++a suggests                                        
  cout<<"the value of --a is"<<--a<<endl;// 4. here 5 is first decremented and then prints 4 as the operator --a suggests   
 
  // assignement operators used to assigne values to variables
//   int a=3, b=9;
// char d='d';
  
  // comparison operators
  cout<< "the following are another type of comparison operators"<< endl;
  cout<<" the value of a== b is "<< (a==b)<< endl;
  cout<<" the value of a< b is "<< (a<b)<< endl;
  cout<<" the value of a> b is "<< (a>b)<< endl;
  cout<<" the value of a<= b is "<< (a<=b)<< endl;
  cout<<" the value of a>= b is "<< (a>=b)<< endl;
  cout<<" the value of a!= b is "<< (a!=b)<< endl; // != means not equal to
  cout<<endl;
 
  // logical operators
  cout<< "the following are another type of logical operators"<< endl;
  cout<<" the value of ((a==b) && (a<b)) and logical operator is "<< ((a==b) && (a<b))<< endl; //this && is logical and 
  // operator . this and opertor showed value as 0 i.e false as both the operations are not correct. for and operators 
  //to be correct both of them must be true
  cout<<" the value of ((a==b) || (a<b)) or logical operator is "<< ((a==b) || (a<b))<< endl; //this || is logical or 
 //operator
  cout<<" the value of (!(a==b) ) not logical operator is: "<< (!(a==b))<< endl; // its result value is shown as one as 
  // it mean a not equal to b and since it is correct so it shows the value as 1
  
 
 return 0;
}