#include<iostream>
using namespace std;


class anything {
    static int j;

    public:
     void setData(void)
     {
         
         cout<<"The anything value of i is "<<j;
         cin>>j;
     }

};
int anything :: j;
int main(){
    anything  two ;
    two.setData();
    return 0;
}
