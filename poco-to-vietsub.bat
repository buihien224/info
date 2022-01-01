@echo off
cd %cd%/adb
type bless.txt
echo "- Go to Bootloader and Enter"
pause
fastboot.exe devices
fastboot.exe erase metadata
powershell -nop -c "& {sleep 2}"
echo "- Flash twrp ...."
fastboot.exe flash boot_a rom/twrp.img
powershell -nop -c "& {sleep 1}"
fastboot.exe reboot bootloader
powershell -nop -c "& {sleep 10}"
echo "Wait .. Do Not Disconnect"
fastboot.exe reboot fastboot
powershell -nop -c "& {sleep 1}"
fastboot.exe devices
fastboot.exe flash system_a rom/system.img
fastboot.exe flash vendor_a rom/vendor.img
fastboot.exe flash product_a rom/product.img
fastboot.exe flash system_ext_a rom/system_ext.img
fastboot.exe flash odm_a rom/odm.img
powershell -nop -c "& {sleep 1}"
fastboot.exe reboot bootloader
powershell -nop -c "& {sleep 1}"
fastboot.exe devices
fastboot.exe flash boot_a rom/boot.img
fastboot.exe flash cust rom/cust.img
fastboot.exe flash userdata rom/userdata.img
powershell -nop -c "& {sleep 3}"
fastboot.exe reboot
cls
echo " "
echo  " "
echo " "
type donate.txt   
pause
