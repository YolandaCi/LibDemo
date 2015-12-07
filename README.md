# 动态库和静态库demo
参考文章：http://www.samirchen.com/create-a-framework/
<br />
# 注意点：
<br />
1)动态库仅支持iOS8.0以上，如果要支持7.x还是要编译静态库；
<br /> 
2)进行universal版本编译时，参考文章里面提供的合并脚本有问题，编译出来的framework在真机上无法运行，提示错误：
<br />
<preview><code>
/Users/yixiaoluo/ProjectProject/Demo1/Build/Products/Debug-iphoneos/GBKitDemo.app/Frameworks/GBKit.framework: unsealed contents present in the root directory of an embedded framework 
<preview /><code />
这里提供一个版本:
<preview><code>
# Sets the target folders and the final framework product.
FMK_NAME=${PROJECT_NAME}
# Install dir will be the final output to the framework.
# The following line create it in the root folder of the current project.
INSTALL_DIR=${SRCROOT}/Products/${FMK_NAME}.framework
# Working dir will be deleted after the framework creation.
WRK_DIR=build
DEVICE_DIR=${WRK_DIR}/Release-iphoneos/${FMK_NAME}.framework
SIMULATOR_DIR=${WRK_DIR}/Release-iphonesimulator/${FMK_NAME}.framework
# -configuration ${CONFIGURATION}
# Clean and Building both architectures.
xcodebuild -configuration "Release" -target "${FMK_NAME}" -sdk iphoneos clean build
xcodebuild -configuration "Release" -target "${FMK_NAME}" -sdk iphonesimulator clean build
# Cleaning the oldest.
if [ -d "${INSTALL_DIR}" ]
then
rm -rf "${INSTALL_DIR}"
fi
mkdir -p "${INSTALL_DIR}"
cp -R "${DEVICE_DIR}/" "${INSTALL_DIR}/"
# Uses the Lipo Tool to merge both binary files (i386 + armv6/armv7) into one Universal final product.
lipo -create "${DEVICE_DIR}/${FMK_NAME}" "${SIMULATOR_DIR}/${FMK_NAME}" -output "${INSTALL_DIR}/${FMK_NAME}"
#rm -r "${WRK_DIR}"
open "${INSTALL_DIR}"
<code/><preview />
