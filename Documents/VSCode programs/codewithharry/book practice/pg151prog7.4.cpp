// program using a function to accept a number and print its cube
#include<iostream>
using namespace std;
int cube(int);

int main()
{
    int num;
    cout<< "Enter a  number ";
    cin>> num;
    cout << "The cube of the number " <<num << " will be "<< cube (num);
    return 0;
}

int cube(int a)
{ 
    return a*a*a;
}
