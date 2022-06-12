#include<iostream>
using namespace std; 
int main(){
    int n, a=1;
    cout<<"Enter the number ";
    cin>>n;

    for(int row=n ; row<=n ; row++){
        for(int col=row ; col<=row-1 ; col++){
            cout<<" "<<a;
            a++;
        }
        cout<<endl;
    }
    return 0;
}
