../tools/build.py --clean --linker-flag='-Wl,-Map=output.map' --lto OFF --profile=micro --toolchain=../cmake/toolchain_linux_armv7l.cmake
if [ "x$1" != "x" ]
then
  python ../tools/run-tests.py --jerry-tests
fi
