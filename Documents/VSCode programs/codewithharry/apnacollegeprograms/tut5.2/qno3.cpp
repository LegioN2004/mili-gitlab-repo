// program to print the armstrong number
#include <iostream>
#include <math.h>
using namespace std;

int main()
{
   int n;
   cin >> n;
   int sum = 0;
   int originaln = n;
   while (n > 0)
   {
      int lastdigit = n % 10;
      sum += pow(lastdigit, 3);
      cout << "the no after cubing individually all the digits of n is " << sum << endl;
      n = n / 10;
   }
   if (sum == originaln)
   {
      cout << "the number is armstrong" << endl;
   }
   else
   {
      cout << "the number is not armstrong";
   }

   return 0;
}
