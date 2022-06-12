// here the question no has been written as 106 instead of 10.6
#include<iostream>
using namespace std;
int main(){
    char a;
    // int i;
    cout<<"Enter a character = ";
    cin>>a;
    if( a<=57 && a>=48)
    cout<<" You entered a digit "<<endl;
    else if( a<=90 && a>=65)
    cout<<" You entered a uppercase character "<<endl;
    else if( a<=122 && a>=97)
    cout<<" You entered a lowercase character "<<endl;
    else 
    cout<<" You entered a special character "<<endl;
    return 0;
    }
