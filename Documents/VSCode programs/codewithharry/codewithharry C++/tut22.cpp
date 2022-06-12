#include <iostream>
#include <string>
using namespace std;

class binary {
private: // by default members of the class is always private
  void chk_bin(void);
  string s;

public:
  void read(void); // (void) means that it takes nothing
  void ones_compliment(void);
  void display(void);
};

void binary ::read(void) {
  cout << "Enter a binary no"
       << endl; // it tells to take whatever value is given to s in string s
  cin >> s;
}

void binary ::chk_bin(void) { // to check if the binary no is present or not
  for (int i = 0; i < s.length(); i++) {
    if (s.at(i) != '0' &&
        s.at(i) !=
            '1') // string ke andar jo index hai if that is not equal to 0
    {
      cout << "Incorrect binary format" << endl;
      exit(0);
    }
  }
}

void binary ::ones_compliment(
    void) // interchange the value of  1 as 0 and 0 as 1 wherever present
{
  chk_bin(); // one member function is called inside the other member function
             // of the same class it is called nesting of member functions
  for (int i = 0; i < s.length(); i++) {
    if (s.at(i) == '0') {
      s.at(i) = '1';
    } else //(s.at(i) == '1')
    {
      s.at(i) = '0';
    }
  }
}
void binary ::display(
    void) // interchange the value of  1 as 0 and 0 as 1 wherever present
{
  cout << "Displaying your binary number" << endl;
  for (int i = 0; i < s.length(); i++) {
    cout << s.at(i);
  }
  cout << endl;
}

int main() { // yahan pe sab bahar se call hone wale functions likhe gaye hai

  binary b;
  b.read(); // to read if it's a binary no
  // b.chk_bin(); // to check if it's a binary no or not
  b.display();
  b.ones_compliment();
  b.display();
  return 0;
}

// previous concepts

/* OOPs - classes and objects
C++ --> intiallly called --> C with classes by stroustroup
class --> extension of structures (in C)
structures had limitations
                            --> members are public
                            --> no methods
.classes --> structures + more
.classes can have methods and properties
.classes --> can make few members as private and few as public
.structures in C++ are typedef
.you cna declare objects along with the class declaration like this
eg     class Employee{
             // classs definition
         }harry , rohan , human;

harry.salary = 8 // makes no sense if salary is private since private member can
get any values directly

*Nesting of member functions ( it means if we have a function already made and
it is using a private variable then we can call another function from this
function without using a dot
*/
