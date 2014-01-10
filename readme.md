# hid-engine

Node.js USB/HID sequence-based event trigger

The goal of hid-engine is to make it easy to trigger actions via USB devices such as game controllers.

## Installation

### Debian/Ubuntu Specifics: 

Be sure to install the libusb-1.0-0-dev package:

`sudo aptitude install libusb-1.0-0-dev`

### NPM

Install the hid-engine package.

`npm install hid-engine --save`

## Usage

Configure it in your app. This example logs to the console when the [Konami code](http://en.wikipedia.org/wiki/Konami_Code) is entered.

```javascript
var HidEngine = require('hid-engine');
new HidEngine({
  // Retro-bit NES Adapter
  vendorId: 4754,
  productId: 17987,
  commands: [
    {
      // Konami code
      code: [ 0, 8, 0, 8, 0, 4, 0, 4, 0, 2, 0, 1, 0, 2, 0, 1, 0, 512, 0, 256, 0 ],
      exec: function() {
        console.log('Pew Pew');
      }
    }
  ]
});
```

- vendorId & productId - uniquely identify the USB device
- commands - array of sequences to listen for
- code - sequence that triggers the exec callback
- exec - callback that is invoked when the code sequence is entered

To lookup the vendor and product IDs, list available devices.

`console.log HidEngine.devices()`

## Debian/Ubuntu USB Permissions: 

Grant access to the USB device to non-root users. Be sure to update the vendor and product IDs.

**/etc/udev/rules.d/50-nintendo.rules**
````
ATTRS{idVendor}=="1292", ATTRS{idProduct}=="4643", SUBSYSTEMS=="usb", ACTION=="add", MODE="0666", GROUP="plugdev"
````

Reload the config with: `sudo udevadm control --reload-rules`

Ensure your user is in the plugdev group: `sudo usermod -a -G plugdev myuser`

Disconnect and re-connect your USB device.
