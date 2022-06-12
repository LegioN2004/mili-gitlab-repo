#include<iostream>
using namespace std;

class anything{
	int a;
	int b;
	int r;

public:
	void setAny(int v1, int v2){
		a=v1;
		b=v2;
	}
		
	void setNO(){

		cout<<"The required no is "<<r;
		r=a+b;
	}
};


int main() {
	anything p, r;
	p.setAny(2 , 4);
	p.setNO();
	
	
 	

	return 0;
}

