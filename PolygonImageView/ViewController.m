//
//  ViewController.m
//  PentagonImageView
//
//  Created by Adrián Bouza Correa on 19/3/15.
//  Copyright (c) 2015 adboco. All rights reserved.
//

#import "ViewController.h"
#import "PolygonImageView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    PolygonImageView *imageView = [[PolygonImageView alloc] initWithFrame:CGRectMake(20, 20, 200, 300) borderColor:[UIColor colorWithRed:0.086 green:0.627 blue:0.522 alpha:1.000] borderWidth:10.0f sides:9];
    [imageView setCornerRadius:10];
    [imageView setImage:[UIImage imageNamed:@"test"]];
    [imageView setContentMode:UIViewContentModeScaleAspectFit];
    
    [self.view addSubview:imageView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
