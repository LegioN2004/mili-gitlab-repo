#include <iostream>
#include <math.h>
using namespace std;

int main()
{
    const double e = 2.7128;
    double result, y;
    cout << "Enter value of y:";
    cin >> y;
    result = 2 - y * exp(2 * y) + pow(4, y);
    cout << "The result of the given expression is:" << result;
    return 0;
}