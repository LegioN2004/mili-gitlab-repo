#include<iostream>
using namespace std;

int main (){
    int n , num , rev = 0 , digit;
    cout << "Input the number ";
    cin>>num; // lets say value is 121
    n= num;// here value is also 121
    do{
        digit = num % 10; // 121%10= 1 | 12%10=2 | 1%10=0
        rev = (rev * 10) + digit; // (0*10) + 1=1 | (1*10)+ 2=12 | (12*10)+ 1=120
        num = num / 10; //  121/10= 12 | 12/10=1 | 0/10=0
    } while (num != 0);
    cout<< "The reverse of the number is : " << rev <<endl;
    if(n == rev)
        cout<<"The number is palindrome";
    else
        cout<<"The number is not palindrome";
    return 0;
}
