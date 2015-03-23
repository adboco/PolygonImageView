# PolygonImageView
PolygonImageView is a subclass of UIImageView that allows put a polygonal frame to an image.

## Screenshot
![ScreenShot](https://lh4.googleusercontent.com/-kl4YlYtNxhw/VQtH1d49KHI/AAAAAAAAARQ/LcegcfNwESw/w704-h1250-no/iOS%2BSimulator%2BScreen%2BShot%2B19.3.2015%2B22.26.58.png)

## Installation
Copy ```PolygonImageView.h``` and ```PolygonImageView.m``` into your Xcode Project.

## Usage
### Code
``` objective-c
#import "PolygonImageView.h"

...

- (void)viewDidLoad {
    [super viewDidLoad];
    
    PolygonImageView *polygonImageView = [[PolygonImageView alloc] initWithFrame:CGRectMake(20, 20, 200, 300) borderColor:[UIColor colorWithRed:0.086 green:0.627 blue:0.522 alpha:1.000] borderWidth:10.0f sides:9];
    [polygonImageView setCornerRadius:10];
    [polygonImageView setImage:[UIImage imageNamed:@"test"]];
    
    [self.view addSubview:polygonImageView];
}
```
### Storyboard
Set PolygonImageView as ```Class``` in ```Show the Identity inspector -> Custom Class```.
![Storyboard Example](https://lh6.googleusercontent.com/-JYeaSaHzL2c/VQw_a-lal7I/AAAAAAAAAR8/XX6URpIw9cU/w1382-h1000-no/storyboard.png "Custom class")
<br>Edit the PolygonImageView properties.
![Storyboard Example](https://lh6.googleusercontent.com/-nA8NhcUEnZ0/VQw_gVJIEmI/AAAAAAAAASE/RoU528zIfGs/w1456-h1000-no/storyboard2.png "Polygon Image View: properties")
### Animate
```objective-c
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [polygonImageView spinAnimationWithDuration:0.6];
}
```

## License
The MIT License
```
Copyright (c) 2015 adboco. All rights reserved.

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
```
