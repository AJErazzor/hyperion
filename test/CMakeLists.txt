# Needed for testing non-public components
include_directories(../libsrc)

# Add the simple test executable 'TestSpi'
add_executable(test_spi
		TestSpi.cpp)
target_link_libraries(test_spi
		hyperion)

add_executable(test_configfile
		TestConfigFile.cpp)
target_link_libraries(test_configfile
		hyperion)

add_executable(test_ImageRgb
		TestRgbImage.cpp)
target_link_libraries(test_ImageRgb
		hyperion-utils)

add_executable(test_colortransform
	TestColorTransform.cpp)
target_link_libraries(test_colortransform
	hyperion)

add_executable(test_image2ledsmap
		TestImage2LedsMap.cpp)
target_link_libraries(test_image2ledsmap
		hyperion)

if (ENABLE_DISPMANX)
	add_subdirectory(dispmanx2png)
endif (ENABLE_DISPMANX)

add_executable(test_blackborderdetector
		TestBlackBorderDetector.cpp)
target_link_libraries(test_blackborderdetector
		hyperion)

add_executable(test_blackborderprocessor
		TestBlackBorderProcessor.cpp)
target_link_libraries(test_blackborderprocessor
		hyperion)

add_executable(spidev_test spidev_test.c)
add_executable(gpio2spi switchPinCtrl.c)
