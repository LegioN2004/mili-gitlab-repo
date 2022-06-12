#include<iostream>
using namespace std;

int declarefunction(){
    int a,b,c;
    cout<<"This is a test function printed before main function ";
    cin>>a>>b;
    c=a-b;
    cout<<"The above c's result is "<<c<<endl;
    return 0;
}
int main(){
    declarefunction();
    return 0;
}
