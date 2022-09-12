.PHONY: run create-emulator format get-packages init launch wipa-data

DEFAULT_EMULATOR_NAME := my-flutter-tutorial

run: launch
	flutter run

create-emulator:
	flutter emulators --create --name ${DEFAULT_EMULATOR_NAME}

launch:
	# flutter emulators --launch Pixel_2_API_30
	flutter emulators --launch ${DEFAULT_EMULATOR_NAME}

wipe-data:
	# emulator @Pixel_2_API_30 -wipe-data
	emulator @${DEFAULT_EMULATOR_NAME} -wipe-data -quit-after-boot 600

format:
	flutter format ./lib

get-packages:
	flutter packages get

# TODO: initdata ?
init: get-packages create-emulator wipe-data run
