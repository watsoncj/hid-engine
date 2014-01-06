# hid-engine

Node.js USB/HID sequence-based event trigger

## Usage

`npm install hid-engine`


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
