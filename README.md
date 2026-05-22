# FytcJuliaRegistries

A personal Julia registry for hosting my own Julia packages.

## Installation

To add this registry to your Julia environment, run the following in the Julia REPL:

```julia
using Pkg
pkg"registry add https://github.com/Fenyutanchan/FytcJuliaRegistries"
```

Or equivalently:

```julia
using Pkg
Pkg.Registry.add("FytcJuliaRegistries")
```

## Usage

Once the registry is added, you can install any registered package just like any other Julia package:

```julia
using Pkg
Pkg.add("PackageName")
```

## Removing the Registry

To remove this registry from your Julia environment:

```julia
using Pkg
Pkg.Registry.rm("FytcJuliaRegistries")
```

## Managing the Registry

This registry is managed with [LocalRegistry.jl](https://github.com/GunnarFarneback/LocalRegistry.jl).

### Registering a Package

To register a new package or a new version of an existing package, run from the package directory:

```julia
using LocalRegistry
register(; registry = "FytcJuliaRegistries")
```

Or specify the registry by path:

```julia
using LocalRegistry
register("MyPackage"; registry = "/path/to/FytcJuliaRegistries", push = false)
```

### Requirements

- The package must live in a git working copy (e.g., cloned via `Pkg.develop`).
- The package must have a `Project.toml` with `name`, `uuid`, and `version`.
- The package working tree must be clean (no uncommitted changes).

## License

This registry is licensed under the [MIT License](LICENSE).

Individual packages may have their own licenses — please refer to each package's repository for details.
