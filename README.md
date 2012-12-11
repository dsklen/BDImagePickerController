## Example Usage

### Presenting the image picker
```objective-c
ELCImagePickerController *controller = [[ELCImagePickerController alloc] initImagePicker];
[controller setDelegate:self];
[self presentModalViewController:controller animated:YES];
[controller release];
```

### Receiving image picker delegate methods

The ELCImagePickerController will return the select images back to the ELCImagePickerControllerDelegate. The delegate contains to methods very similar to the UIImagePickerControllerDelegate. Instead of returning one dictionary representing a single image the controller sends back an array of similarly structured dictionaries. The two delegate methods are:
```objective-c
- (void)elcImagePickerController:(ELCImagePickerController *)picker didFinishPickingMediaWithInfo:(NSArray *)info;
- (void)elcImagePickerControllerDidCancel:(ELCImagePickerController *)picker;
```

## License

The MIT License

Copyright (c) 2012 Burnside Digital[Burnside Digital](http://www.burnsidedigital.com/) (formerly ELC Technologies)

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.