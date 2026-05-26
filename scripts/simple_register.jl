#! /usr/bin/env julia
#
# Copyright (c) 2026 Quan-feng WU <wuquanfeng@ihep.ac.cn>
#
# This software is released under the MIT License.
# https://opensource.org/licenses/MIT

import Pkg
joinpath(dirname(@__DIR__), "Project.toml") |> Pkg.activate
Pkg.instantiate()

using ArgParse
using LocalRegistry

function main()
    s = ArgParseSettings()
    @add_arg_table! s begin
        "path"
            help = "path to the Julia package to register"
            required = true
    end
    args = parse_args(ARGS, s)

    pkg_path = abspath(args["path"])
    @info "Registering package at: $pkg_path"

    register(pkg_path; registry = dirname(@__DIR__))

    @info "Registration complete!"
end

main()
