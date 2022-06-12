#include<iostream>
using namespace std;

int main (){
    for (int i=1 ; ; ){
        cout<<i<<endl;
        if (i==128)
        break;
            i*= 2;
    }
    return 0;
}
