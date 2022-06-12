#include <iostream>
using namespace std;

string getDayofWeek(int dayNum) {
  string dayName;
  // long method
  // if(dayNum==0){
  //   dayName ==' sunday ';
  // }
  //     else if(dayNum == 1){
  //       dayN
  //     }
  // }

  switch (dayNum) {
  case 0:
    dayName = "Sunday";
    break;
  case 1:
    dayName = "Monday";
    break;
  case 2:
    dayName = "Tuesday";
    break;
  case 3:
    dayName = "Wednesday";
    break;
  case 4:
    dayName = "Thursday";
    break;
  case 5:
    dayName = "Friday";
    break;
  case 6:
    dayName = "Saturday";
    break;
  default:
    dayName = "Invalid Day Number";
  }

  return dayName;
}
int main() {
  cout << getDayofWeek(10);

  return 0;
}
