#include <iostream>
using namespace std;

int main(){
    int n=5;
    /* cout<<"enter the number"; */
    /* cin>>n; */

    for(int i=n ; i>=1 ; i--){  // row lines is defined by this loop and then* 
        for(int j=1 ; j<=i ; j++){ // *column is decreased by the value of i from above and then the stars get printed in decreasing manner
            cout<<"*";
        }
        cout<<endl;
    }
    return 0;
}

