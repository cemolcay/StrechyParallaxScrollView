//
//  TestViewController.m
//  StrechyParallaxScrollView
//
//  Created by Cem Olcay on 12/09/14.
//  Copyright (c) 2014 questa. All rights reserved.
//

#import "TestViewController.h"
#import "Masonry/Masonry.h"
#import "StrechyParallaxScrollView.h"

#define RGBCOLOR(r,g,b)     [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]

@interface TestViewController ()

@end

@implementation TestViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //top view
    CGFloat width = [[UIScreen mainScreen] bounds].size.width;
    UIImageView *topView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, width, 150)];
    [topView setImage:[UIImage imageNamed:@"bg.jpg"]];
    [topView setBackgroundColor:RGBCOLOR(128, 26, 26)];
    
    UIImageView *circle = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 80, 80)];
    [circle setImage:[UIImage imageNamed:@"profile.jpg"]];
    [circle setCenter:topView.center];
    [circle.layer setMasksToBounds:YES];
    [circle.layer setCornerRadius:40];
    [topView addSubview:circle];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 120, width, 20)];
    [label setText:@"Strechy Parallax Demo"];
    [label setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:20]];
    [label setTextAlignment:NSTextAlignmentCenter];
    [label setTextColor:[UIColor whiteColor]];
    [topView addSubview:label];

    
    //masonary constraints for parallax view subviews (optional)
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo (circle.mas_bottom).offset (10);
        make.centerX.equalTo (topView);
    }];
    [circle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo ([NSValue valueWithCGSize:CGSizeMake(80, 80)]);
        make.center.equalTo (topView);
    }];
    
    
    //create strechy parallax scroll view
    StrechyParallaxScrollView *strechy = [[StrechyParallaxScrollView alloc] initWithFrame:self.view.frame andTopView:topView];
    [self.view addSubview:strechy];
    
    //add dummy scroll view items
    float itemStartY = topView.frame.size.height + 10;
    for (int i = 1; i <= 10; i++) {
        [strechy addSubview:[self scrollViewItemWithY:itemStartY andNumber:i]];
        itemStartY += 190;
    }
    
    //set scrollable area (classic uiscrollview stuff)
    [strechy setContentSize:CGSizeMake(width, itemStartY)];
}

- (UILabel *)scrollViewItemWithY:(CGFloat)y andNumber:(int)num {
    UILabel *item = [[UILabel alloc] initWithFrame:CGRectMake(10, y, [UIScreen mainScreen].bounds.size.width-20, 180)];
    [item setBackgroundColor:[self randomColor]];
    [item setText:[NSString stringWithFormat:@"Item %d", num]];
    [item setTextAlignment:NSTextAlignmentCenter];
    [item setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:26]];
    [item setTextColor:[UIColor whiteColor]];
    return item;
}

- (UIColor *)randomColor {
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
