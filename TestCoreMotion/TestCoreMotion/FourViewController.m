//
//  FourViewController.m
//  TestCoreMotion
//
//  Created by chiery on 14/11/6.
//  Copyright (c) 2014年 qunar. All rights reserved.
//

#import "FourViewController.h"

@interface FourViewController ()
{
    UIImageView *_imageView;
}

@end

@implementation FourViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    _imageView.image = [UIImage imageNamed:@"2"];
    [self.view addSubview:_imageView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
