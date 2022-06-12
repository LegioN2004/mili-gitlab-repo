// pg214qno10.2

#include<iostream>
using namespace std;

int main(){
    float temp,choice,conv_temp;
    cout<<"Temperature conversion menu ";
    cout<<"1. Fahrenheit to Celsius "<<endl;
    cout<<"2. Celsius to Fahrenheit "<<endl;
    cout<<" Enter your choice (1/2)";
    cin>>choice;
    cout<<"Enter the temp which you want to calc "<<temp;

    if (choice = 1)
    {
        conv_temp= temp*-18;
        cout<<"The value from F to C is ";
        cin>>conv_temp;
    }
    

    return 0;
}
