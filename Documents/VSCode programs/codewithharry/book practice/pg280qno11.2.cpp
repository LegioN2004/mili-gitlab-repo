#include <iostream>
using namespace std;

int change(int a){
    a=20;
    return a;
}

int main(){
    int change (int);
    int orig=10;
    cout<<" The original value is " << orig<< endl;
    cout<<"Return value of function change " <<change(orig)<< endl;
    cout<<"The value after function change() is over " << orig<< endl;

    return 0;
}
