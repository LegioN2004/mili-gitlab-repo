#include<iostream>
using namespace std;


// / void swap(int x, int y){
//    int temp;
//    temp = x;
//    x = y; 
//    y=temp; 
//    cout<< " the swapped values are "<< "a=" << x << " and " << "b=" << y <<endl;
//} 



void swap (int, int);
int main(){
    int a = 7 , b = 4 ;
    cout << " the original values of a and b are " << a << "/n" << b << endl ;
    swap(a,b);
    cout<< " the values after swap() are " << "a=" << a << "b=" << b << endl;
    return 0;
}


void swap(int x, int y){
    int temp;
    temp = x;
    x = y; 
    y=temp; 
    cout<< " the swapped values are "<< "a=" << x << " and " << "b=" << y <<endl;
}

