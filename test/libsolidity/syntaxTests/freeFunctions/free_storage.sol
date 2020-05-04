struct S { uint x; }
function fun(S storage) {
}
// ----
// Warning: (42-100): Function state mutability can be restricted to pure
