contract C {
    struct S {
        uint8[1] m1;
        int24[] m2;
    }
    function f() public pure returns (bool correct) {
        S memory s;
        s.m2 = new int24[](1);
        assembly {
            mstore(add(s, 64), 257)
            mstore(add(s, 128), 0xdeadbeef)
        }
        uint8 x = s.m1[0];
        int24 y = s.m2[0];
        uint r1;
        uint r2;
        assembly {
            r1 := x
            r2 := y
        }
        correct = (r1 == 0x0101) && (r2 == 0xdeadbeef) && (x == 0x01) && (y == int24(0xadbeef));
    }
}
// ====
// compileViaYul: false
// ----
// f() -> true
