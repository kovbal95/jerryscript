COMM=../tools/build.py
COMM=$COMM" --clean"

#COMM=$COMM" --jerry-ext=OFF"#? not defined
#COMM=$COMM" --jerry-port-default=OFF"#? not defined

COMM=$COMM" --profile=micro"
COMM=$COMM" --toolchain=../cmake/toolchain_linux_armv7l.cmake"
