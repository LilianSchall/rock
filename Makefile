all: build

build:
	cmake -S ./ -B build/ -DCMAKE_EXPORT_COMPILE_COMMANDS=1

