#include<iostream>
using namespace std;

int main(){
    int i , num , fact =1;
    cout<< "\n Enter integer ";
    cin>>num;
    i = num;
    while (num){
        fact *= num;
        --num;
    }
    cout<<"The factorial of "<< i<< " is "<<fact <<"\n";
    return 0;
}
