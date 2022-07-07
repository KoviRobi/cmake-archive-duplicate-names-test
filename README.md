To compile, do

```
cmake -Bbuild -GNinja
ninja -C build
```

Or just do `nix build` if you have `nix` with `--experimental-features
nix-command`.
