#include<iostream>
using namespace std;

int main(){
    int n,r;
    cout<<"Enter the no: "<<endl;
    cin>>n;
    if (n%2==0){
    r=n*n; 
    }
    // cout<<"The square of the even no is"<<r<<endl; we must not put a cout here as the compiler will think that the code is finished till here and so it'll give error that "else without a previous if"
    else{
    r=n*n*n;
    }
    cout<<"The cube of the even no is  "<<r;

    return 0;
}