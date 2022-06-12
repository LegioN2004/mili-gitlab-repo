// find the greatest of two nos using constructor

#include<iostream>
#include<conio.h>
using namespace std;
 
    class ABC
    {
        private:
        int x,y;
        public:
        ABC()
       {
        cout<<"Enter the no:";
        cin>>x>>y;
       }
       void calc()
       {
        if (x>y)
        cout<<"x is greater";
        else
        cout<<"y is greater";
       }
    };

   int main()
  {
    ABC a;
    a.calc();
    getch();
    return 0;
   }

