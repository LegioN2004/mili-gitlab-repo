#include<iostream>
#include<cmath>
using namespace std;

int main(){
    int x,n=6,result;
    cout<<"The power of x is: ";
    cin>>x;
    result=pow(x,n);
    cout<<"The value of x to the power n is: "<<result;
    return 0;
}