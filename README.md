# nix-packages

Nix packages published by [Wimpy's World](https://github.com/wimpysworld). Use them directly in your NixOS configuration or Nix flake via the flake input below.

## Quick Start

Add this flake as an input:

```nix
{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    wimpysworld-nix-packages = {
      url = "github:wimpysworld/nix-packages";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
}
```

Then reference packages in your configuration:

```nix
environment.systemPackages = [
  inputs.wimpysworld-nix-packages.packages.${system}.tailor
];
```

## Packages

| Package | Description |
|---------|-------------|
| [`tailor`](pkgs/tailor/) | GitHub community health file manager |

## Supported Systems

- `x86_64-linux`
- `aarch64-linux`
- `aarch64-darwin`

## Contributing

Contributions are welcome. See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines and [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md) for community standards. Report security issues privately per [SECURITY.md](SECURITY.md).
