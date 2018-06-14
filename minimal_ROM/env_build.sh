COMM=../tools/build.py
COMM=$COMM" --clean"

COMM=$COMM" --jerry-cmdline=ON"
COMM=$COMM" --jerry-cmdline-snapshot=OFF"
COMM=$COMM" --jerry-debugger=OFF"
COMM=$COMM" --jerry-ext=OFF"
COMM=$COMM" --snapshot-exec ON"
COMM=$COMM" --snapshot-save OFF"
COMM=$COMM" --jerry-libc=ON"
COMM=$COMM" --jerry-libm=ON"
COMM=$COMM" --jerry-port-default=OFF"
COMM=$COMM" --jerry-cmdline-test=OFF"

COMM=$COMM" --js-parser=OFF"

COMM=$COMM" --profile=micro"
COMM=$COMM" --toolchain=../cmake/toolchain_linux_armv7l.cmake"
