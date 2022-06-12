#include<iostream>
using namespace std;
// ..............pointers...............
// What are pointers? ----  They are a data type which holds the adress of other data types

 int main(){
         int a=3;
         int* b=&a; // this means that int* is a pointer which points to the value of integer and its name is b which is equal to the adress of a
        // & --> address of operator , the variables are stored in the ram after running and its adress is given by the following
        cout<<b<<endl; // its output is something like 0x61ff08 which is the adress in the memory and this was assigned to 'a' after running the program
        // i.e b is storing the adresss which is a pointer and in "b=&a" '&' is used as it represents to the compiler as the 'adress of operator'
        // we can also write both &a or b as it represents the same address
        
        cout<<"The address of a is "<<&a<<endl;
        cout<<"The address of a is "<<b<<endl;
        
        // * --> Deference operator or value at  , this shows that what is the value at this address cout<<"The value at address  b is " <<*b<<endl; // this shows the value as 3 
        // pointer ke pehle ampersand lagane se woh adress batata he and agar * lagane se woh us adress me jo value he woh dikhayega

        //pointer to pointer 
        int** c= &b;
        cout<<"The address of b is"<<&b<<endl;
        cout<<"The address of b is"<<c<<endl;
        cout<<"The value at address of c is"<<*c<<endl;
        cout<<"The value at address value at(value at(c)) is"<<**c<<endl;

        return 0;
}
