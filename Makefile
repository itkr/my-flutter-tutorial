.PHONY: launch run

run: launch
	flutter run

launch:
	flutter emulators --launch Pixel_2_API_30

format:
	flutter format ./lib
