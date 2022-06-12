#include <iostream>
using namespace std;

int main (){
    float area , bread , len , rad, base, height; 
    int choice;
    cout<<"1. area of rectangle"<<endl;
    cout<<"2. area of circle"<<endl;
    cout<<"3. area of triangle"<<endl;
    cout<<"Enter the choice"<<endl;
    cin>>choice;

    switch(choice){
        case 1:
        cout<<"Enter the length and breadth of the rectangle ";
            cin>>len>>bread;
        area= len * bread;
            cout<<"The area of rectangle is "<<area;
            break;
        
        case 2:
        cout<<"Enter the radius of the circle ";
            cin>>rad;
        area=3.14*rad*rad; 
        cout<<"The area of the circle is "<<area;
            break;

        case 3:
        cout<<"Enter the base and height of the triangle ";
            cin>>base>>height;
            area=0.5*base*height;
        cout<<"The area of the triangle "<<area;
            break;
    }
    return 0;

}









