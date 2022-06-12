//Arrays and pointer 
// notes in notepad
 #include<iostream>
 using namespace std;
 
 int main(){
    //Array example
    int marks[4]={23,45,56,79}; // one way of declaring array
    //  int mathMarks[4];
    //  mathMarks[0]=227;
    //  mathMarks[1]=257;
    //  mathMarks[2]=247;
    //  mathMarks[3]=2267; 
    //   cout<<"These are mathMarks"<<endl;

    //  cout<<mathMarks[0]<<endl;    // cout shows that you can print or cahnge the values
    //  cout<<mathMarks[1]<<endl;   
    //  cout<<mathMarks[2]<<endl;
    //  cout<<mathMarks[3]<<endl;
    //  cout<<"These are marks"<<endl;
     
    //  cout<<marks[0]<<endl;
    //  cout<<marks[1]<<endl;
    //  //if we want to change any values of an array of particular address we can do that only we have to write it before the cout of that address
    //  marks[2]=455;
    //  cout<<marks[2]<<endl;
    //  cout<<marks[3]<<endl;
   
    // now printing the marks using loop

     for(int i=0; i<4; i++)
     {
         cout<<"The value of marks "<< i <<" is "<<marks[i]<<endl;
     }

    // now writing these marks in while and do-while loop
     
     //while loop part
     
    //   int i=0;
    //      while( i<4);
    //  {
    //      cout<<"The value of marks is "<<i<< marks[i]<<endl;
    //      i++;
    //   }

  // do-while loop part
    // int i=0;
    // do 
    // {
    //     cout<<"The value of the marks "<<i<<" is "<< marks[i]<<endl;
    //     i++;
    // }while(i<4);
   


    // pointers and arrays
                              //(here * simply points to the value to where it is located )
    int *p=marks; // *p points to the first value of the marks array or address store karta he array ke starting ka 
    cout<<*(p++)<<endl; // this will show the value of p and then increment the value of p and it shows the incremented output in cout 
    cout<<*(++p)<<endl;// firstly value of *p is 23 and *p++ is 2345 and if we again use *++p then the value becomes 2356 i.e the next value of array is printed (second last) 
    //  cout<<"The value of *p is "<<*p<<endl; // here *p shows the value at p but p stores the address
    //  cout<<"The value of *p(p+1) is "<<*(p+1)<<endl; // to print the other values we need to use brackets before * and then add p
    //  cout<<"The value of *p(p+2) is "<<*(p+2)<<endl; //  with 1,2,3 respectively to get the respective values serial 
    //  cout<<"The value of *p(p+3) is "<<*(p+3)<<endl;

return 0;
 }
