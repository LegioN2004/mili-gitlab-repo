#include<iostream>
using namespace std;

// inline function

inline int product(int a, int b) // this inline expands in in a single line and the compiler repalces the function call by this code in the compile time
{
    // static int c=0; // this executes only once and it will maintain this value
    // c=c+1; // and if the value of c changes then the previous value of 0 will not be there and the value will be the new one and in this case it is 1
    // return a*b+c; // here the value of a*b+c is given
    return a*b;
// it isn't recommended to use inline functions whenever recursive fucntions , static variables,etc are used
}


float moneyRecieved(int currentMoney, float factor=1.04) // all the default arguments must be on the extreme right and all the compulsory arguments must be on the left side
{      return currentMoney * factor; 
       
}

// int strlen(const char * p) // const is used so that the compiler doesn't change any other values in a string 
// {

// }

int main(){
    int a,b;
    // cout<<"Enter the value of a and b"<<endl;
    // cin>>a>>b;
    // cout<<"The product of a and b "<<product(a,b)<<endl;
    // cout<<"The product of a and b "<<product(a,b)<<endl;
    // cout<<"The product of a and b "<<product(a,b)<<endl;
    // cout<<"The product of a and b "<<product(a,b)<<endl;
    // cout<<"The product of a and b "<<product(a,b)<<endl;
    // cout<<"The product of a and b "<<product(a,b)<<endl;
    // cout<<"The product of a and b "<<product(a,b)<<endl;
    // cout<<"The product of a and b "<<product(a,b)<<endl;
    // cout<<"The product of a and b "<<product(a,b)<<endl;
    // cout<<"The product of a and b "<<product(a,b)<<endl;
    // cout<<"The product of a and b "<<product(a,b)<<endl;
    // cout<<"The product of a and b "<<product(a,b)<<endl;
    // cout<<"The product of a and b "<<product(a,b)<<endl;
    
    //default values
    int money = 100000;
    cout<< "If you have "<< money << "Rs in you bank account, you will recieve "<<moneyRecieved(money)<<" Rs after 1 year"<<endl;
    cout<< "For VIP : If you have "<< money << "Rs in you bank account, you will recieve "<<moneyRecieved(money,1.10)<<" Rs after 1 year";
    return 0;
}
