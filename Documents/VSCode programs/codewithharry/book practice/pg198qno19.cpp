#include<iostream>
using namespace std;

int main(){
    int p,t,l;
    cout<<"Enter the no of players "<<p;
    cin>>p;
    t=p/5;
    l=p%5;
    cout<<"The no of teams formed will be "<<t<<endl;
    cout<<"The no of leftover players are "<<l;

    return 0;
}