// question no 29

#include <iostream>
//  #include<conio.h>
// #include<math.h>
using namespace std;
int main()
{
    float p, t, r;
    cout << "Give the principal amount:  ";
    cin >> p;
    cout << "Give the time required:  ";
    cin >> t;
    cout << "The t is  " << t << endl;
    if (t > 10)
    {
        cout << "Since the time is greater than 10 so ";
        r = (p * 8 * t) / 100;
    }

    else
    {
        r = (p * 12 * t) / 100;
        cout << "Since the time is less than 10 so it'll be a little less which is " << r;
        exit(0);
    }

    cout << "the required simple interest according to the given amount and time is:  " << r;
    return 0;
    // getch();
}
