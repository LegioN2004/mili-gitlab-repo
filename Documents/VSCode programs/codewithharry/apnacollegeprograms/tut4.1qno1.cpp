#include<iostream>
using namespace std;

int main (){
    int a, b;
    cout<<"Enter the no of rows and columns "<<endl;
    cin>>a>>b;
    for (int i=1 ; i<=a ; ++i){
        for (int j=1; j<=b ; ++j){
            cout<<"*";
        }
        cout<<endl;
    }
    return 0;
}

