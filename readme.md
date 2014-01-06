# hid-engine

Node.js USB/HID sequence-based event trigger

The goal of hid-engine is to make it easy to trigger actions via USB devices such as game controllers.

## Usage

Install the hid-engine package.

`npm install hid-engine --save`

Configure it in your app. This example logs to the console after the [Konami code](http://en.wikipedia.org/wiki/Konami_Code) is entered.

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
