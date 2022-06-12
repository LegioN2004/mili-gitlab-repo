#include<iostream>
using namespace std;

int main(){
    // my version of the problem
    // int e , a ,s ; // e for experienced and a for age and s for salary
    // cout<<"Enter the experience of the person "<<endl;
    // cout<<"Enter Y for yes and N for no "<<endl;S
    // cin>>e;
    // cout<<"Enter the age of the person"<<endl;
    // cin>>a;
    // if(a>35){
    //     cout<<"The salary of the person is 6000";
    // }
    // else ( a>28, a<35){
    //     cout<<"The salary of the person is 4800";
    // }
    
    
    // book version of the problem
    int exper, age ,salary;
    cout<<"The person is experienced? "<<endl;
    cout<<"Enter 1 for yes, 0 for no "<<endl;
    cin>>exper;
    cout<<"\n Enter age of the person"<<endl;
    cin>>age;
    salary=(exper)?((age > 35) ? 6000:(age>28) ? 4800:3000):2000;
    cout<<"\n The salary of the person is "<<salary<<"\n";


    return 0;
}