.PHONY: build clean

build:
	hugo

clean:
	rm -rf public resources/_gen
