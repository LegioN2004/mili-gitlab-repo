//pythagorean triplet practice
#include<iostream>
using namespace std;

int main(){
   int a,b,c;
   cout<<"Enter the number";
   cin>>a>>b>>c;

   int max = a;
   if(b > max){
      max = b;
   }
   if(c > max){
      max = c;
   }

   if (max == a){
      if(a*a == (b*b + c*c)){
         cout<<true << endl;
      }
   }       
   else{
      cout<<"false"<<endl;
   }
   elseif( max == b ) {
      if(b*b == (a*a + c*c)){
         cout<<true << endl;
      }
   }       
   else{
      cout<<"false"<<endl;
   }

   else if( max == b ) {
      if(c*c == (a*a + b*b)){
         cout<<true << endl;
      }
   }       
   else{
      cout<<"false"<<endl;
   }

   return 0; 
}

