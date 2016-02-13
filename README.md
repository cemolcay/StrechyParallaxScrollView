StrechyParallaxScrollView
=========================

uiscrollview with strechy and parallax top view


Demo
====

![alt tag](https://raw.githubusercontent.com/cemolcay/StrechyParallaxScrollView/master/StrechyParallaxScrollView/demo.gif)


Install
-------

### Manual

Copy StrechyParallaxScrollView.h/m files to your project.

### CocoaPods

``` ruby
	pod 'StrechyParallaxScrollView', '~> 0.1'
```

Usage
-----


    //create the top view
    UIView *topView = [UIView new];
    ...
    
    //create scroll view with top view just created
    StrechyParallaxScrollView *strechy = [[StrechyParallaxScrollView alloc] initWithFrame:self.view.frame andTopView:topView];
    
    //add it to your controllers view
    [self.view addSubview:strechy];
    


Optional Values
---------------
`CGFloat parallaxWeight`: parallax speed of top view

`BOOL strechs`: enable/disable streching behaviour (enabled default)

`BOOL parallax`: enable/disable parallax behaviour (enabled default)
