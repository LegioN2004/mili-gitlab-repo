//program to print the reverse of a number
#include<iostream>
using namespace std;

int main(){
   int n ;
   cin >> n;

   int reverse=0 ;
   while(n>0){
      int lastdigit= n%10; // 4 > 3 > 2 > 1 -- respective values
      reverse= reverse*10 + lastdigit; // 4 > 43 > 432 > 4321
      n= n/10; // 123 > 12 > 1 > 0 it will run till n becomes 0 
   }
   cout << "the reverse of the number is " << reverse << endl;
   return 0;
}