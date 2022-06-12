// program to find the ASCII code of a character and vice versa (and i included loop)
#include<iostream>
using namespace std;

int main(){
    char ch='A';
    int num=ch;
    cout<<"The ASCII code for "<< ch << " is " << num << endl;
    cout<<" Adding 1 to the character code \n";
    for (int i = 0; i<=25 ; i++)
    {
    cout<< "The ASCII code for "<< ch << " is " << num << endl;
    ch=ch + 1;
    num=ch;
    }
    return 0;
}