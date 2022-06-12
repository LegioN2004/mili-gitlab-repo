#include<iostream>
#include<conio.h>
using namespace std;

void add(int x,int y)
{
    cout<<x+y;
}
void add(float a,float b)
{
    cout<<a*b;
}
void main()
{
    
    add(5.3,6.2);
    add(2,42);
    getch();
}