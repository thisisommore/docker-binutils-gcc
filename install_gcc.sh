cd /tmp/src

# wget https://ftp.gnu.org/gnu/gcc/gcc-4.9.1/gcc-4.9.1.tar.bz2
wget https://github.com/gcc-mirror/gcc/archive/refs/tags/releases/gcc-13.2.0.tar.gz
tar -xvf gcc-13.2.0.tar.gz
cd gcc-releases-gcc-13.2.0
wget https://gmplib.org/download/gmp/gmp-6.3.0.tar.xz
wget https://www.mpfr.org/mpfr-current/mpfr-4.2.1.tar.xz
wget https://ftp.gnu.org/gnu/mpc/mpc-1.3.1.tar.gz

tar -xf gmp-6.3.0.tar.xz && mv -v gmp-6.3.0 gmp && rm -rf  gmp-6.3.0.tar.xz
tar -xf mpfr-4.2.1.tar.xz && mv -v mpfr-4.2.1 mpfr && rm -rf  mpfr-4.2.1.tar.xz
tar -xf mpc-1.3.1.tar.gz && mv -v mpc-1.3.1 mpc && rm -rf  mpc-1.3.1.tar.xz

export PREFIX="/usr/local/i386elfgcc"
export TARGET=i386-elf
export PATH="$PREFIX/bin:$PATH"
mkdir ../gcc-build
cd ../gcc-build
# ../gcc-releases-gcc-13.2.0/configure -v --build=x86_64-linux-gnu --host=x86_64-linux-gnu --target=x86_64-linux-gnu --prefix=/usr/local/gcc-11.1.0 --enable-checking=release --enable-languages=c,c++,fortran --disable-multilib --program-suffix=-11.1
# ../gcc-4.9.1/configure --target=$TARGET --prefix="$PREFIX" --disable-nls --disable-libssp --enable-languages=c --without-headers
../gcc-releases-gcc-13.2.0/configure --target=$TARGET --prefix="$PREFIX" --disable-nls --disable-libssp --enable-languages=c --without-headers
# make -j 32
# make install-strip
make all-gcc 
make all-target-libgcc 
make install-gcc 
make install-target-libgcc 