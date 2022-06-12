#include<iostream>
using namespace std;

int fib(int n){ // this is a recursive function
    if(n<2){
        return 1;
    }
    return fib(n-2) + fib (n-1); // there is no need of an extra else as 

}

int factorial(int n)

{
    if(n<=1){
        return 1 ;
    }
    return n * factorial (n-1);  

}
// step by step calculation of factorial 4 
// factorial(4)    here it will come in first function and as it is not small than or equal to 1 so it will
// go next line i.e factorial (4) = 4 * factorial(4-1 or 3) and since it is not equal to 1 so it will further reduce the value
// go next line i.e factorial (4) = 4 * 3 *factorial(3-1 or 2)
// go next line i.e factorial (4) = 4 * 3 * 2 factorial(2-1 or 1) here value becomes 1 for which the function has a direct value which is 1
// go next line i.e factorial (4) = 4 * 3 * 2 * 1
//              i.e factorial (4) = 24;
// so it will give the value as 1 and then it 

int main(){
    // factorial of a number ;
    // 6!=6*5*4*3*2*1= 720 , 0!=1 , 1!=1 by definition
    // n!= n*(n-1)
    int a;
    cout<<"Enter a number"<<endl;
    cin>>a;
    cout<<"The factorial of a is "<<factorial(a)<<endl;
    /* cout<<"The term in fibonacci sequence at position "<<a<<" is "<<fib(a)<<endl; */
    return 0;
}
