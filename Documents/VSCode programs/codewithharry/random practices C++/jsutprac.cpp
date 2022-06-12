#include<iostream>
using namespace std;

class Student
{
    private:
    int m;

    public:
    int c, s, r;
    void studentData(int c1, char s1, int r1);
    void getstudentData()
    {
    cout<<"The class of the student is "<<c<<endl;
    cout<<"The section of the student is "<<s<<endl;
    cout<<"The roll no of the student is "<<r<<endl;

    }
    
};

void Student :: studentData(int c1, char s1, int r1){
    c=c1;
s=s1;
r=r1;
}


int main(){
    Student harry;
    // harry.m=360;
    harry.studentData(1,6,100);
    harry.getstudentData();

    return 0;
}