{ pkgs }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    # Rust
    cargo
    rustc

    # Gleam
    gleam

    # Elixir
    elixir

    # Go
    go

    # Kotlin
    kotlin-native

    # Tools
    ripgrep
  ];
}
