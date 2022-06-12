#include<iostream>
using namespace std;

int sum(int a, int b)
{
    int c =a+b;
    return c;

}
// this will not swap a and b 
void swap(int a ,int b) // the values are as follows 
{                     // temp a b    
    int temp = a ;    // 4    4 5   here temp is storing the initial value as 4 and as it is = to a so a is also 4
    a=b;              // 4    5 5   here a=b so a is 5 and since nothing has changed in b and temp so it is same as it was before
    b=temp;           // 4    5 4   here temp is as it is and b=temp so b is 4 here and others are same, a was 5 previously so it'll remain same 
}                     // this is a way to swap the values of variables but they don't swap but only copy the values
// so we use the following way to swap the values 
// two types to call functions ---->

// call by reference using pointers
void swapPointer(int* a ,int* b) // here we're mentioning  the address of a and b to the compiler
{                   
    int temp = *a ;    // and then it is telling the temp to store the value of address at a 
    *a=*b;             // and *a's address i.e the value at address a is being stored in value at address b i.e *b and
    *b=temp;           // the value at address b is being stored in temp
}                    // here value at the addresses a and b is changed and so the value remains changed even if the function is deleted 



// call by reference using C++ reference variables
void swapReferenceVar(int &a ,int &b) // here we're mentioning the compiler the address of a and b 
{                   
    int temp = a ;    // and then it is telling the temp to store the address of a 
    a=b;             // and *a's address i.e the address at a is being stored in *b and
    b=temp;           // the value at address b is being stored in temp
     
 }                     


// int & swapReferenceVar(int &a ,int &b) // here we're using & to show that we're returning a reference variable
// {                   
//     int temp = a ;    // and then it is telling the temp to store the address of a 
//     a=b;             // and *a's address i.e the address at a is being stored in *b and
//     b=temp;           // the value at address b is being stored in temp
//     return a;
// }                     


int main(){
    int x=4, y=5;
    // cout<<"the sum of 4 and 5 is "<< sum(4,5); 
    cout<<"The value of x is "<<x<<" and the value of y is "<<y<<endl;
    // swap(a,b); // this will not swap a and b 
    // swapPointer(&x , &y); // this will swap a and b using pointer reference  // address is given here and it will get the values using the memory address
     swapReferenceVar(x ,y) ; // this will swap a and b using  reference variables ; no need of giving ampersand & i.e address 
    // swapReferenceVar(x ,y)=766 ; // this will swap a and b using  reference variables ; reference variable which is a reference of x is made to point the value 766 and so the swapped value is 766
                                // in this way  we can give any no as the value of function call because the function returns a reference to x and a points to x
    cout<<"The value of x is "<<x<<" and the value of y is "<<y<<endl;
// here the value of a and b doesn't swap as the values are copied to swap function and it doesn't change the original values of a and b
    return 0;
}
