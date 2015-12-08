//
//  GBViewController.m
//  GBKit
//
//  Created by yixiaoluo on 15/12/7.
//  Copyright © 2015年 yixiaoluo. All rights reserved.
//

#import "GBViewController.h"

@interface GBViewController ()

@property (nonatomic) UIImageView *imageView;

@end

@implementation GBViewController

- (instancetype)init
{
    self = [super initWithNibName:@"GBKit.framework/GBViewController" bundle:nil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIImage *image = [UIImage imageNamed:@"GBKit.framework/img_02"];
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:imageView];
    self.imageView = imageView;
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    
    self.imageView.frame = self.view.bounds;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
