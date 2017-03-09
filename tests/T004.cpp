//#Patterns: T004
// Disable T013 - Copyright
// Disable T014 - Boost Software License

class A : public B, private C
{
//#Info: T004
public :
    A();
    ~A();
//#Info: T004
protected :
    // ...
//#Info: T004
private :
    // ...
};
