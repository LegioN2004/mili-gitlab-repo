#include<iostream>
using namespace std;

int main(){
    int div,num,c;
    cout<<"Enter an integer: ";
    cin>>num;
    for(div=1 ; div<=num/2 ; ++div ){
        if(num%div==0)
            cout<<"the div is "<<div<<endl;  
        else
        cout<<"the no "<<div<<" is not a divisor"<<endl;
    }
    return 0; 
}
