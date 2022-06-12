#include<iostream>
using namespace std;

void calc(int x , int y, char ch)
   { 
        switch (ch)
        {
        case '+':
            cout<<"Sum of "<< x << "and " << y<< " is "<<(x+y);
            break;
        
        case '-':

            cout<<"Difference of"<< x << "and " << y<< " is "<<(x-y);
            break;
        case '*':
            cout<<"Multiplication of "<<x <<"and "<<y<<"is "<<(x*y);
            break;
        case '/':
            if (x<y){
                cout<< "First integer should be "<< " greater than second .";
                exit(0);
            }
            cout<<"Quotient: "<< x << "/" << y<< " is "<<(x/y);
            
            case '%':
            if(x<y){
                cout<<"First integer should be " << "greater than second" ;
                exit (0);
            }
            cout<<"Remainder : "<<x << "%"<<y<< "is"<< (x%y);
            break;
        default:
            cout<<"wrong operator ";
            break;
        }
        return ;
    }
int main(){
   int a ,b ;
   char ch;
   cout<< "Enter two integers ";
   cin>>a >> b;
   cout<<" Enter the arithmetic operator(+,-,*,/,%)";
   cin>>ch;
   calc(a,b,ch); 
    return 0;
}


