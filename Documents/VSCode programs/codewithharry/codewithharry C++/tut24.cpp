#include <iostream>
using namespace std;
// object does not has its own no so as to carry out throughout the program and so static variable comes into play
class Employee
{
    static int count; // static varible always intialises by default from 0 ; what it does is that it maintains a value which is needed by all the objects throughout the program and can manipulate it if needed outside the class (by default it is 0)
    int id;

public:
    void setData(void)
    {
        cout << "Enter the id " << endl;
        cin >> id;
        count++; // this is being used to increase the value of count by 1
    }
    void getData(void)
    {
        cout << "The id of this employee is " << id << " and this is employee number " << count << endl;
    }

    static void getCount(void)
    { // this is a static function which is used so as to access static members and static functions
        // cout<<id; //shows error as it can't access
        cout << "The value of count is " << count << endl; // static functions has access to only the other static functions and static variables
    }
};

// count is the static data member of the class employee

int Employee ::count; // to preserve the no of count we will use static variables as here the varaible count will be different for the objects
                      // if we want to give an initial value to count then we must give it in the above line ; // must be initialised outside the class ; and to show that it belongs to the employee class we must initialise it as done here
int main()
{
    Employee harry, rohan, human;
    // harry.id = 1;
    // har.count=1;
    // cannot do the above as the id and count are private members

    harry.setData();
    harry.getData();
    Employee::getCount();

    rohan.setData();
    rohan.getData();
    Employee::getCount();

    human.setData();
    human.getData();
    Employee::getCount();

    return 0;
}