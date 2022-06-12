#include<iostream>
using namespace std;

int main(){
    int n;
    cout<<"Enter the number of rows and columns ";
    cin>> n;

    for(int row =1 ; row<=n ; row++){
        /* for(int col=row ; col<=n ; col++) */

        for(int col=1 ; col<=n-row+1 ; col++) {
            cout<<"*";
        }
        cout<<endl;
    }
    return 0;
}
