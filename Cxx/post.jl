Pkg.clone("https://github.com/Keno/Cxx.jl")
cd(Pkg.dir("Cxx"))
run(`git checkout $(ENV["CXX_VERSION"])`)
Pkg.build("Cxx")
cd("/julia")
run(`rm -rf /julia/usr-staging`)
run(`mv /julia/deps/srccache/llvm-svn/include /mods/`)
run(`rm -rf /julia/deps`)
run(`mkdir -p /julia/deps/srccache/llvm-svn`)
run(`mv /mods/include /julia/deps/srccache/llvm-svn`)