#include <iostream>
using namespace std;
float cube (float );


float cube (float a){
    float n;
    n=a*a*a;
    return (n);
}  


int main(){
    //float cube(float)
    float x,y;
    cout<<"Enter the number whose cube is to be calculated " ;
    cin>>x;
    y=cube(x);

    cout << "The cube of " << x << " is " << y ;
    return 0;
    
}

//float cube (float a){
//   float n;
//  n=a*a*a;
//  return (n);
// }  
