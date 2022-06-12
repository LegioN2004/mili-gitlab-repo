//pattern
/* 1 2 3 4 5 */
/* 1 2 3 4 */
/* 1 2 3 */
/* 1 2 */
/* 1 */



#include<iostream>
using namespace std;

int main(){
    int n;
    cin>>n;

    for(int i=1; i<=n ; i++){ // row= n
        for(int j=1; j<=n+1-i ; j++){ // here col=n+1-row
            cout<<j<<" ";
        }
        cout<<endl;
    }

    return 0;
}
