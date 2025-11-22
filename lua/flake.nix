{
  inputs.parent.url = "path:/home/rafael/.dotfiles";
  inputs.nixpkgs.follows = "parent/nixpkgs";

  outputs = { self, nixpkgs, parent, ... }:
  let
    system = "x86_64-linux";

    # Try to reuse overlays/config from the parent if it exports them.
    overlays =
      if parent ? overlays && parent.overlays ? default then
        [ parent.overlays.default ]
      else if parent ? overlays then
        builtins.attrValues parent.overlays
      else
        [];

    cfg = if parent ? nixpkgsConfig then parent.nixpkgsConfig else {};

    pkgs = import nixpkgs {
      inherit system overlays;
      config = cfg;
    };
  in {
    devShells.${system}.default = pkgs.mkShell {
      packages = with pkgs; [
        clang
        clang-tools
        glibc.dev
        bear
        pkg-config
        gdb
        criterion
        llvmPackages_20.libllvm
        llvmPackages_20.llvm
        llvmPackages.stdenv
        lldb
        vscode-extensions.vadimcn.vscode-lldb
      ];
      CC = "clang";
    };

    nativeBuildInputs = [ pkgs.pkg-config ];

    env = {
      CODELLDB_PATH =
        "${pkgs.vscode-extensions.vadimcn.vscode-lldb}/share/vscode/extensions/vadimcn.vscode-lldb/adapter/codelldb";
      LIBLLDB_PATH =
        "${pkgs.vscode-extensions.vadimcn.vscode-lldb}/share/vscode/extensions/vadimcn.vscode-lldb/lldb/lib/liblldb.so";
    };
  };
}
