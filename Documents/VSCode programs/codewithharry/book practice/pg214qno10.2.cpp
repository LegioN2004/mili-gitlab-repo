// program to convert Fahrenheit to Celsius and vice versa 
#include<iostream>
using namespace std;

int main(){
    int a,choice ;
    double temp, conv_temp ;
    cout<<" C++ temperature converter "<<endl;
    cout<<" 1. Convert Fahrenheit to Celsius "<<endl;
    cout<<" 2. Convert Celsius to Fahrenheit "<<endl;
    cout<<" Enter your choice(1/2) : "; 
    cin>> choice;
    if (choice == 1){
        cout<<"Enter temperature in Fahrenheit: ";
        cin>> temp;
        conv_temp= (temp-32)/1.8;
        cout<<"The temperature in Celsius is "<< conv_temp;
    }
    else {
        cout<<"Enter temperature in Celsius: ";
        cin>> temp;
        conv_temp =( 1.8 * temp ) + 32;
        cout<<"The temperatrue in Fahrenheit is "<< conv_temp;
    }
    
    
    return 0;
}