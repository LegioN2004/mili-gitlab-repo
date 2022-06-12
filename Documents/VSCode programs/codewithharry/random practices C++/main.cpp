#include<iostream>
#include<optional>

namespace A::B{
class Blah{
    public:
    void foo(){
        std::cout <<"Inside Blah::foo()\n";
    }
};
}

int main(){
std::optional<bool> blah;
    A::B::Blah;
    b.foo();
    std::cout << "Hello \n";
    return 0;
}
