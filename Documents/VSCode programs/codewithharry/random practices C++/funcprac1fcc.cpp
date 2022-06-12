// functions are containers that can store codes and can be used to perform specific tasks . We can also use it to pass information , parameters , values , etc to use in tasks 
#include<iostream>
#include <stdio.h>

using namespace std;

void sayHi(string name, int age); // so in this way we can declare a function and give the value down there after main and it will call easily also void as a function means that no value will be passed

int main(){
//cout<< "Hello world"
//cout<<"tof"; // if we put cout statements here then it will compile serially and in sayhi the compiler will go to the func to print anything ther// and then again print the next set of commands 
sayHi("hello",100 ); // this will tell the compiler that the above sayhi function should be executed
//cout << " heeo"; and this value will get stored in the string name variable
sayHi("no one ",100 ); // this will tell the compiler that the above sayhi function should be executed
sayHi("harry",100 ); // this will tell the compiler that the above sayhi function should be executed
sayHi("tom",11100 ); // this will tell the compiler that the above sayhi function should be executed
return 0;
}
void sayHi(string name,int age ){ // since sayhi function wants a parameter name then we need to give a value from int function 
cout<< "Hello there "<<name<<" Your age is "<<age<<endl;
} // when this void part is put below the main then sayhi will not know that there was any function named such and so error will occur so we need to create function stub and it will be above the main 

