#!/vendor/bin/sh

# I-link ang firmware path para sa Snapdragon 7s Gen 3
mount -o bind /vendor/firmware_mnt/image /vendor/firmware
ln -sf /vendor/firmware_mnt/image/* /vendor/firmware/
ln -sf /odm/firmware/p16u/* /vendor/firmware/
