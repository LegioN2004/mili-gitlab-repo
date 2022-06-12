// function overloading 
#include<iostream>
using namespace std;

// here we can use any data type and the compiler will try its best to convert it to the respective values with which it is float
// and if it fails to do so then it will give errors
int  add (int  a, int  b){ // if we write datatype of function in float but the overall datatype is int then the datatype will remain the same and no error will be shown and vice versa
    cout<<"Using function with 2 arguments"<<endl;
    return a+b;
}
    
int add (int  a, int  b,int  c){
   cout<<"Using function with 3 arguments"<<endl;
    return (a+b+c);
}
// calculate the volume of a cylinder
int volume(double r , int h){
    return (3.14 * r * r *h );
}

// calculate the volume of a cube
int volume(int a){
    return (a* a * a);
}
 
//  rectangular box
int volume(int l, int b , int h)
{ 
    return(l* b* h);
}


int main(){
    cout<<"The sum of 3 and 6 is "<<add(3,6)<<endl; 
    cout<<"The sum of 3 ,6 and 7 is "<<add(3,6 ,7)<<endl; 
    cout<<"The volume of cylinder radius 3 and height 6 is "<<volume(3,6)<<endl; 
    cout<<"The volume of cube of side  is "<<volume(3)<<endl; 
    cout<<"The volume of cuboid is  l=3,b=6,and h=7 is "<<volume(3,6,7 )<<endl; 
 
    
    return 0;
}

// in this way we can use the same name of function for different purposes with the help of function overloading
