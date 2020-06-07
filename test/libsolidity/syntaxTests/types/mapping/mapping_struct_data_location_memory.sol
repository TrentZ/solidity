pragma experimental ABIEncoderV2;
contract C {
    struct S { mapping(uint => uint) a; }
    function f(S memory) public {}
}
// ----
// TypeError: (104-112): Types containing (nested) mappings can only have a data location of "storage" and thus only be parameters or return variables for internal or library functions.
// TypeError: (104-112): Type struct C.S is only valid in storage because it contains a (nested) mapping.
