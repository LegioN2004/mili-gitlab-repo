#include <iostream>
#include <conio.h>
using namespace std;
int main()
{
    // clear the screen
    // clrscr();
    // declare uc variable as int
    int uc;
    // declare variables as float
    float amt, famt, tax;
    // Input the units consumed
    cout << "Enter the units consumed by the consumer" << endl;
    cin >> uc;
    // conditional statement
    if (uc >= 0 && uc <= 100)
        amt = uc * 1;
    else
    {
        if (uc > 100 && uc <= 200)
            amt = ((uc - 100) * 2) + 100;
        else
        {
            if (uc > 200 && uc <= 300)
                amt = ((uc - 200) * 3) + 300;
            else
            {
                if (uc > 300 && uc <= 500)
                    amt = ((uc - 300) * 4) + 600;
                else
                    amt = ((uc - 500) * 5) + 1400;
            }
        }
    }
    // calculate tax and final amount
    tax = (amt * 10) / 100;
    famt = amt + 50 + tax;
    // print the bill
    cout << "---------------------------" << endl;
    cout << " Bill " << endl;
    cout << "---------------------------" << endl;
    cout << "Bill of units " << amt << endl;
    cout << "Meter charges 50" << endl;
    cout << "Tax " << tax << endl;
    cout << "---------------------------" << endl;
    cout << "Total bill " << famt << endl;
    cout << "---------------------------" << endl;
    // get character
    getch();
}