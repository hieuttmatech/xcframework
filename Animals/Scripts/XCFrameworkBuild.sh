#!/bin/sh

#  XCFrameworkBuld.sh
#  FlexiPlayer
#
#  Created by Przemyslaw Stajniak on 28/12/2020.
#  

echo "XCFrameworkBuild Script Start"
FINAL_PRODUCT_NAME="AnimalsSDK"
IOS_SCHEME_NAME="${FINAL_PRODUCT_NAME}"

# Prebuild cleanup
rm -rf "${PROJECT_DIR}/Archives/${FINAL_PRODUCT_NAME}.xcframework"
rm -rf "${PROJECT_DIR}/Archives/${FINAL_PRODUCT_NAME}_iOS_Simulator.xcarchive"
rm -rf "${PROJECT_DIR}/Archives/${FINAL_PRODUCT_NAME}_iOS_Device.xcarchive"

# iOS builds
xcodebuild archive -scheme "${IOS_SCHEME_NAME}" -configuration Debug -sdk iphonesimulator -archivePath "./Archives/${FINAL_PRODUCT_NAME}_iOS_Simulator.xcarchive" SKIP_INSTALL=NO BUILD_LIBRARY_FOR_DISTRIBUTION=YES

xcodebuild archive -scheme "${IOS_SCHEME_NAME}" -configuration Release -archivePath "./Archives/${FINAL_PRODUCT_NAME}_iOS_Device.xcarchive" SKIP_INSTALL=NO BUILD_LIBRARY_FOR_DISTRIBUTION=YES

xcodebuild -create-xcframework \
-framework "./Archives/${FINAL_PRODUCT_NAME}_iOS_Device.xcarchive/Products/Library/Frameworks/${FINAL_PRODUCT_NAME}.framework" \
-framework "./Archives/${FINAL_PRODUCT_NAME}_iOS_Simulator.xcarchive/Products/Library/Frameworks/${FINAL_PRODUCT_NAME}.framework" \
-output "./Archives/${FINAL_PRODUCT_NAME}.xcframework"
# Compressing stage
#cd Archives
#zip -r "${FINAL_PRODUCT_NAME}.xcframework.zip" "${FINAL_PRODUCT_NAME}.xcframework"
#cd ..

# Cleanup
rm -rf "${PROJECT_DIR}/Archives/${FINAL_PRODUCT_NAME}_iOS_Simulator.xcarchive"
rm -rf "${PROJECT_DIR}/Archives/${FINAL_PRODUCT_NAME}_iOS_Device.xcarchive"

# Full command:

# Param from build scrip: "${SRCROOT}/Scripts/XCFrameworkBuild.sh" "CPFlexiPlayer" "CPFlexiPlayer iOS" "CPFlexiPlayer tvOS"

# o day FINAL_PRODUCT_NAME="${1}" = CPFlexiPlayer
# o day IOS_SCHEME_NAME="${2}" = CPFlexiPlayer iOS
# o day IOS_SCHEME_NAME="${3}" = CPFlexiPlayer tvOS

#echo "XCFrameworkBuild Script Start"
#FINAL_PRODUCT_NAME="${1}" # Param from build scrip
#IOS_SCHEME_NAME="${2}"  # Param from build scrip
#TVOS_SCHEME_NAME="${3}"  # Param from build scrip

#
#echo "XCFrameworkBuild FINAL_PRODUCT_NAME: ${FINAL_PRODUCT_NAME}"
#echo "XCFrameworkBuild IOS_SCHEME_NAME: ${IOS_SCHEME_NAME}"
#echo "XCFrameworkBuild TVOS_SCHEME_NAME: ${TVOS_SCHEME_NAME}"
#
## Prebuild cleanup
#rm -rf "${PROJECT_DIR}/Archives/${FINAL_PRODUCT_NAME}.xcframework"
#rm -rf "${PROJECT_DIR}/Archives/${FINAL_PRODUCT_NAME}_iOS_Simulator.xcarchive"
#rm -rf "${PROJECT_DIR}/Archives/${FINAL_PRODUCT_NAME}_iOS_Device.xcarchive"
#rm -rf "${PROJECT_DIR}/Archives/${FINAL_PRODUCT_NAME}_macOS_Catalyst.xcarchive"
#rm -rf "${PROJECT_DIR}/Archives/${FINAL_PRODUCT_NAME}_tvOS_Simulator.xcarchive"
#rm -rf "${PROJECT_DIR}/Archives/${FINAL_PRODUCT_NAME}_tvOS_Device.xcarchive"
#rm -rf "${PROJECT_DIR}/Archives/${FINAL_PRODUCT_NAME}_macOS_Device.xcarchive"
#
## iOS builds
#xcodebuild archive -scheme "${IOS_SCHEME_NAME}" -destination "platform=iOS Simulator,name=iPhone 11" -sdk iphonesimulator -archivePath "${PROJECT_DIR}/Archives/${FINAL_PRODUCT_NAME}_iOS_Simulator.xcarchive" SKIP_INSTALL=NO
#
#xcodebuild archive -scheme "${IOS_SCHEME_NAME}" -destination "generic/platform=iOS" -archivePath "${PROJECT_DIR}/Archives/${FINAL_PRODUCT_NAME}_iOS_Device.xcarchive" SKIP_INSTALL=NO
#
#xcodebuild archive -scheme "${IOS_SCHEME_NAME}" -destination "platform=macOS,variant=Mac Catalyst" -archivePath "${PROJECT_DIR}/Archives/${FINAL_PRODUCT_NAME}_macOS_Catalyst.xcarchive" SKIP_INSTALL=NO
#
## tvOS builds
#xcodebuild archive -scheme "${TVOS_SCHEME_NAME}" -destination "platform=tvOS Simulator,name=Apple TV" -sdk appletvsimulator -archivePath "${PROJECT_DIR}/Archives/${FINAL_PRODUCT_NAME}_tvOS_Simulator.xcarchive" SKIP_INSTALL=NO
#
#xcodebuild archive -scheme "${TVOS_SCHEME_NAME}" -destination "generic/platform=tvOS" -archivePath "${PROJECT_DIR}/Archives/${FINAL_PRODUCT_NAME}_tvOS_Device.xcarchive" SKIP_INSTALL=NO
#
#xcodebuild -create-xcframework \
#-framework "${PROJECT_DIR}/Archives/${FINAL_PRODUCT_NAME}_iOS_Device.xcarchive/Products/Library/Frameworks/${FINAL_PRODUCT_NAME}.framework" \
#-framework "${PROJECT_DIR}/Archives/${FINAL_PRODUCT_NAME}_macOS_Catalyst.xcarchive/Products/Library/Frameworks/${FINAL_PRODUCT_NAME}.framework" \
#-framework "${PROJECT_DIR}/Archives/${FINAL_PRODUCT_NAME}_iOS_Simulator.xcarchive/Products/Library/Frameworks/${FINAL_PRODUCT_NAME}.framework" \
#-framework "${PROJECT_DIR}/Archives/${FINAL_PRODUCT_NAME}_tvOS_Device.xcarchive/Products/Library/Frameworks/${FINAL_PRODUCT_NAME}.framework" \
#-framework "${PROJECT_DIR}/Archives/${FINAL_PRODUCT_NAME}_tvOS_Simulator.xcarchive/Products/Library/Frameworks/${FINAL_PRODUCT_NAME}.framework" \
#-output "${PROJECT_DIR}/Archives/${FINAL_PRODUCT_NAME}.xcframework"
#
## Compressing stage
##cd Archives
##zip -r "${FINAL_PRODUCT_NAME}.xcframework.zip" "${FINAL_PRODUCT_NAME}.xcframework"
##cd ..
#
## Cleanup
#rm -rf "${PROJECT_DIR}/Archives/${FINAL_PRODUCT_NAME}_iOS_Simulator.xcarchive"
#rm -rf "${PROJECT_DIR}/Archives/${FINAL_PRODUCT_NAME}_iOS_Device.xcarchive"
#rm -rf "${PROJECT_DIR}/Archives/${FINAL_PRODUCT_NAME}_macOS_Catalyst.xcarchive"
#rm -rf "${PROJECT_DIR}/Archives/${FINAL_PRODUCT_NAME}_tvOS_Simulator.xcarchive"
#rm -rf "${PROJECT_DIR}/Archives/${FINAL_PRODUCT_NAME}_tvOS_Device.xcarchive"

#end


