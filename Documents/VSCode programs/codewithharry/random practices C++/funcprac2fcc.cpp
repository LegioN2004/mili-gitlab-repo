// return type statements functions to give 
#include<iostream>
using namespace std;

double cube(double num){
   // double result = num * num * num; 
 return  num * num * num; // instead we can use return directly to return the result
  //cout<< "hello "; // whenever we use return it will break the function and go to the main function  so no running of cout after return 
       // return result;
}

int main (){
    // double answer = cube(5.0); thus we're able to store a value in answer
    cout<< cube(5.0) ; //cout<< answer  ;


  return 0;
}
