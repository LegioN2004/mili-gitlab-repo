#include<iostream>
using namespace std;
int main(){
    int a , b,c;
    a=5,b=6;
    a=*b;
    *b=c;
    cout<<"The pointer of a is "<<a ;
    return 0;
}
