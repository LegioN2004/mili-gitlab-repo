// find the output of the following program
#include<iostream>
#include<conio.h>
using namespace std;
class Num
{
    int x;float y;
    public:
    void init(void)
    {
        x=y=10;

    }
    void read(int i ,float j)
    {
        x=i;
        y=j;
    }
    void display()
    {
        cout<<"x=>"<<x<<"\n";
        cout<<"y=>"<<y<<"\n";
    }
};
int main()
{
    Num obj1,obj2;
    obj1.init();
    obj2.init();
    obj1.read(15,11.21);
    obj1.display();
    obj2.display();
    getch();
    return 0;
}

