#include <iostream>
using namespace std;

int main()
{
    char ch;
    float a, b, result;
    cout << "Enter the two no you want to find the function of "<<endl;
    cin >> a z>> b;
    cout << "Enter the function you want to perform(+,-,*,/)";
    cin >> ch;
    if (ch == '+')

        result = a + b;

    else

        if (ch == '-')

        result = a - b;

    else

        if (ch == '*')

        result = a * b;

    else

        if (ch == '/')

        result = a / b;

    else

        cout << " Wrong operator " << endl;

    cout << "The calculated result is as follows " << result;
    return 0;
}