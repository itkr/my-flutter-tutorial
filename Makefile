.PHONY: launch run

run: launch
	flutter run

launch:
	flutter emulators --launch Pixel_2_API_30

wipe-data:
	emulator @Pixel_2_API_30 -wipe-data

format:
	flutter format ./lib

get-packages:
	flutter packages get
