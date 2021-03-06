BDImagePickerController
=======

**A clone of the UIImagePickerController using the Assets Library Framework allowing for multiple asset selection**

## Example Usage

### Presenting the image picker

```objective-c
BDImagePickerController *imagePicker = [[BDImagePickerController alloc] initWithDelegate:self];
    
[self presentModalViewController:imagePicker animated:YES];
```

### Receiving image picker delegate methods

```objective-c
- (void)imagePickerController:(BDImagePickerController *)picker didFinishPickingMediaWithInfo:(NSArray *)info;
- (void)imagePickerControllerDidCancel:(BDImagePickerController *)picker;
```

## License

The MIT License

Copyright (c) 2012 [Burnside Digital](http://www.burnsidedigital.com/) (formerly ELC Technologies)

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
