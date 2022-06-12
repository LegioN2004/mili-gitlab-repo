#include<iostream>
using namespace std; 

int main (){
    int n;
    cout<<"Enter the number ";
    cin>>n;

    for(int row=0 ; row<2*n ; row++){
        int totalcolinrow=row>n ? 2 * n - row - 1 : row ;
        if( row>n )
            cout<< 2 * n - row - 1 ;
        else 
            cout<<row  ;
        for (int col=1 ; col <totalcolinrow ; col++){
            cout<<"* ";
        }
        cout<<endl;
    }
    return 0;
}
