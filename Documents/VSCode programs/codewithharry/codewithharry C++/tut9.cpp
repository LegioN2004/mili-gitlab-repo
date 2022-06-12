// the first notes of control structures is in the copy 

#include<iostream>
using namespace std;
int main()
{
    // cout<<"This is tutorial 9";
    int age;
    cout<<"Tell me your age"<<endl;
    cin>>age;
   
//    1. Selection control structure If-else ladder , ladder means if else else if comes sequentially
    // if((age<18) && (age>0))
    // {
    //     cout<<"You cannot come to my party"<<endl; 
    // }
    // else if (age==18)
    // {
    // cout<<"You will get a kid pass to enter the party"<<endl;
    // }
    // else if(age<1)
    // {
    //     cout<<"You are not yet born"<<endl;
    // }
    
    
    
    // else
    // {
    //     cout<<"You can come to the party"<<endl;

    // }
    
    
    // 2. Selection control structure:Switch case statements
    switch (age) // this is code snippets
    {
    case 18:    // this 18 is the default value that should be printed otherwise it will show no special cases
                // as given in the cout statement which will show this if cases are not given as input
     
        cout<<"You are 18"<<endl;
        break;                        // break : this means that we have to come out from this current position 
    //only if the required value (18) is achieved , here case means the default output that we shall get 
    // after getting the output the compiler get down and print anything that will be left out after this 
    // break statement 
    
        
    case 22:
        
        cout<<"You are 22"<<endl; // is there is no break statement the all the cases will get printed
                                    // so the value that is taken will be printed and the others too which is not accepted
        break;                   // so break is used, it means the case value is got then idahr se niklo and exit karo
    
  
        
    case 2:
        cout<<"You are 2"<<endl;
        break;                   
    
    default: 
    cout<<"No special cases"<<endl;
        break;
    
    }
    
    cout<<"Done with switch case statements"<<endl; 
    
    
    return 0;

}         