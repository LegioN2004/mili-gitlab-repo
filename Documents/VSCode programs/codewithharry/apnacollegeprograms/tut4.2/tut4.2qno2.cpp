//pattern for the code
/* 1         */
/* 0 1       */ 
/* 1 0 1      */ 
/* 0 1 0 1   */ 
/* 1 0 1 0 1 */ 

/* Rows = n or 1 to n */
/* Columns = 1 to  Row no */
/* Elements= if Row no + Col no = Even no then print 1 else if it is odd then print 0 (see it as a matrix order i.e 1.1 = rowno.colno)  */
/* here in the position of 1 is even no is coming by adding the row and col no but odd no is coming by adding the positions of 0 so use that to make the equation */ 

#include<iostream>
using namespace std;

int main(){
    int n;
    cin>>n;

    for(int i=1 ; i<=n ; i++){
        for( int j=1 ; j<=i ; j++){
            if ((i+j)%2==0){
                cout<<" 1";
            }
        else{
                cout<<" 0";
            }
        }
        cout<<endl;
    }
    return 0;
}
