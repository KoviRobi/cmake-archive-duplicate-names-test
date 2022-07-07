To compile, do

```
cmake -Bbuild -GNinja
ninja -C build
```

Or just do `nix build` if you have `nix` with `--experimental-features
nix-command`.

The expected output is an error for the last two cases, and everything else
linking.
```
[1/14] Building C object CMakeFiles/B.dir/b.c.o
[2/14] Building C object CMakeFiles/obj_A.dir/a.c.o
[3/14] Building C object CMakeFiles/obj_B.dir/b.c.o
[4/14] Building C object CMakeFiles/A.dir/a.c.o
[5/14] Building C object CMakeFiles/test_should_error.dir/test.c.o
[6/14] Building C object CMakeFiles/test_b_first.dir/test.c.o
[7/14] Building C object CMakeFiles/test_a_first.dir/test.c.o
[8/14] Building C object CMakeFiles/test_should_error_obj.dir/test.c.o
[9/14] Linking C static library libB.a
[10/14] Linking C static library libA.a
[11/14] Linking C executable test_should_error_obj
FAILED: test_should_error_obj
: && /nix/store/aq67a6bzcjyh6rcjj78miirqjl9rav72-gcc-wrapper-11.3.0/bin/gcc -O3 -DNDEBUG  CMakeFiles/obj_A.dir/a.c.o CMakeFiles/obj_B.dir/b.c.o CMakeFiles/test_should_error_obj.dir/test.c.o -o test_should_error_obj   && :
/nix/store/9izhv7bayzj8sr7m5n7c4qw1qk2fhq9s-binutils-2.38/bin/ld: CMakeFiles/obj_B.dir/b.c.o: in function `answer':
b.c:(.text+0x0): multiple definition of `answer'; CMakeFiles/obj_A.dir/a.c.o:a.c:(.text+0x0): first defined here
collect2: error: ld returned 1 exit status
[12/14] Linking C executable test_a_first
[13/14] Linking C executable test_b_first
[14/14] Linking C executable test_should_error
FAILED: test_should_error
: && /nix/store/aq67a6bzcjyh6rcjj78miirqjl9rav72-gcc-wrapper-11.3.0/bin/gcc -O3 -DNDEBUG  CMakeFiles/test_should_error.dir/test.c.o -o test_should_error  -Wl,--whole-archive  libA.a  libB.a  -Wl,--no-whole-archive && :
/nix/store/9izhv7bayzj8sr7m5n7c4qw1qk2fhq9s-binutils-2.38/bin/ld: libB.a(b.c.o): in function `answer':
b.c:(.text+0x0): multiple definition of `answer'; libA.a(a.c.o):a.c:(.text+0x0): first defined here
collect2: error: ld returned 1 exit status
ninja: build stopped: subcommand failed.
```
