// write a program to find the factorial of a number using member functions

#include<iostream>
#include<conio.h>
using namespace std;
class factorial
{
    private:
    int i,n;
    long int s;
    public:
    void input()
    {
        cout<<"enter the no:";
        cin>>n;
    
    }
    long int calc();
};
long int factorial::calc()
{
    s=1;
    for(i=1;i<=n;i++)
    s*=i;
    return (s);

}
void main()
{
    factorial f;
    f.input();
   long int K=f.calc();
    cout<<"factorial="<<K;
    getch();
}