# Project Guidelines

## Project Overview

This is a personal Julia package registry (`FytcJuliaRegistries`) managed with [LocalRegistry.jl](https://github.com/GunnarFarneback/LocalRegistry.jl). The registry stores metadata (versions, dependencies, compatibility) for Julia packages in TOML format.

## Registry Structure

Each registered package lives under a subdirectory organized by first letter:

```
Registry.toml          # Top-level registry metadata (name, uuid, repo, package list)
E/
  Example/
    Package.toml       # Package name, uuid, repo URL, optional subdir
    Versions.toml      # Version → git-tree-sha1 mapping
    Deps.toml          # Version → dependencies mapping
    Compat.toml        # Version → compatibility constraints
    WeakDeps.toml      # Version → weak dependencies (optional)
    WeakCompat.toml    # Version → weak compat (optional)
```

- JLL packages go under `jll/` (e.g., `jll/E/Example_jll`).
- All TOML files use sorted keys.

## Code Style

- The registry itself is TOML-based — all package metadata is stored in TOML files.
- Management scripts are written in Julia and live in the `scripts/` directory.
- Follow existing formatting in `Registry.toml` and package TOML files.
- Use 4-space indentation for TOML nested tables.
- Julia scripts follow standard Julia style conventions.

## Managing the Registry

Use LocalRegistry.jl to register packages. Do **not** manually edit package metadata files unless absolutely necessary. Helper scripts are provided in the `scripts/` directory.

### Register a new package or version

```julia
using LocalRegistry
register("PackageName"; registry = "FytcJuliaRegistries")
```

### Key requirements for registration

- The package must live in a clean git working copy.
- The package must have a valid `Project.toml` with `name`, `uuid`, and `version`.
- The package must have been committed to git before registration.

## Conventions

- Never modify `Registry.toml` `[packages]` section by hand — use `LocalRegistry.register`.
- Never change a package's UUID after registration.
- Version numbers should follow SemVer (start at `0.1.0` or `1.0.0`).
- The `repo` field in `Registry.toml` points to `https://github.com/Fenyutanchan/FytcJuliaRegistries`.
- Commit messages for registrations follow the pattern: `New package: PackageName vX.Y.Z` or `New version: PackageName vX.Y.Z`.
- AI-assisted contributions must include an `Assisted-by` trailer following the [Linux kernel convention](https://docs.kernel.org/process/coding-assistants.html):
  ```
  Assisted-by: AGENT_NAME:MODEL_VERSION
  ```
  Example: `Assisted-by: GitHub-Copilot:glm-5.1`
