#include <iostream>
#include <stdio.h>
#include <conio.h>
using namespace std;
char name[30], add[60], meterno[10];
int phn, units;
float amt;
void input()
{
    cout << "Enter the consumer's name:";
    gets(name);
    cout << "Enter the meter no, :";
    gets(meterno);
    cout << "Enter the consumer's phone no ";
    cin >> phn;
    cout << "Enter the address of the consumer:" << endl;
    gets(add);
    cout << "Enter the no of units consumed:";
    cin >> units;
    cout << "\n";
    cout << endl
         << "\t\t*************************************************\n";
}

float calc()
{
    if (units > 124)
        amt = (124 * 5.40) + ((units - 124) * 6.65);
    else      
        amt = units * 5.40;
    return (amt);
}

void displ()
{
    cout << endl
         << "\t\t **UJJWALA POWER DISTRIBUTION(P) LTD. ** \t\t" << endl;
    cout << endl
         << "\t Consumer name             :" << name << "\tMeter no.:" << meterno << endl;
    cout << "\tAddress                          :" << add << endl;
    cout << "\tPhone number                      :" << phn << endl;
    cout << "\tTotal units consumed                           :" << units << endl;
    cout << "\tCharge of total energy consumed :" << calc() << endl;
    cout << "\tFixed charge                            :50" << endl;
    cout << "\tNet amount payable                           :" << amt + 50 << endl;
    cout << "        **To be paid before 20th day of the month **" << endl;
    cout << endl
         << "\tFor any queries or complaints email us at updltd@comp.com ";
}
int main()
{
    // textbackground(WHITE);
    // textcolour(RED);
    // clrscr();
    input();
    displ();
    getch();
    return 0;
}
