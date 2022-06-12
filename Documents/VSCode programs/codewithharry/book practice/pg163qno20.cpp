// program that accepts a character between a to j and prints next 4 characters
#include<iostream>
using namespace std;

int main(){
char ch , ch1, ch2 , ch3, ch4;
cout<<"Enter the character between A and J ";
cin>> ch;
int num =ch;
ch1=ch+1;
ch2=ch+2;
ch3=ch+3;
ch4=ch+4;
cout<<"The next four characters are "<<endl;
cout<< ch1 <<endl;
cout<< ch2 <<endl;
cout<< ch3 <<endl;
cout<< ch4 <<endl;
    return 0;
}