#include<iostream>
using namespace std;
int main(){
 	int a ,b ,c;
 	cout<< " Enter the number " ;
 	cin>> a;
 	//for( a > 0; a/2== 0; a++)
 	if (a%2==0){
 		cout<< "The no " << a << " is even ";
 	}
 	else {
 		cout<<"The no "<< a << " is odd ";
 	}
 	// else(a==1 ) {
 	// 	cout<<"The no "<< a << " is prime ";
 	// }

 	return 0;
}