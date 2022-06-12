#include<iostream>
using namespace std ;
int glo=6; //global variable declaration
void sum()
 {
    int a;
    cout<<glo;
 }

int main()
{
    int glo=9;
      glo=78;
    // int a=4;
    // int b=5;
    int a=4,b=5;  // we can combine them as in the left part or we can write separately as above comment: also we can't ad space between double digit integers
    float pi= 3.14; // for decimal no we use float data type
    char c='h'; // char is used to input characters, only one at a time can be used and declaration must be within single quotes
    bool hello_h= false; // variable names in C++ can range from 1 to 255, must begin with letter or underscore but not a number
                          // variable names are case sensitive, capital letters and small letter are considered different
                          //no spcaes,sybols or special characters are allowed and no C++ keyword are allowed 
    // sum();
    // cout<<"This is tutorial 4. The value of a is "<<a<< " and the value of b is "<<b;
    // cout<<"\n The value of pi is "<<pi; // for writing output in a new line like using enter we can use \n
    // cout<<"\n The value of c is "<<c;
    cout<<glo<<hello_h;
}
    