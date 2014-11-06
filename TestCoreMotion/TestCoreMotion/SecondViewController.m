//
//  SecondViewController.m
//  TestCoreMotion
//
//  Created by chiery on 14/11/6.
//  Copyright (c) 2014年 qunar. All rights reserved.
//

#import "SecondViewController.h"
#import <CoreMotion/CoreMotion.h>
#import "ThirdViewController.h"

@interface SecondViewController ()
@property (nonatomic, strong) CMMotionManager *motionManager;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    _motionManager = [[CMMotionManager alloc] init];
    _motionManager.deviceMotionUpdateInterval = 0.01;
    [_motionManager startDeviceMotionUpdates];
    if (_motionManager.deviceMotionAvailable) {
        __weak typeof(self) weakSelf = self;
        [_motionManager startDeviceMotionUpdatesToQueue:[NSOperationQueue currentQueue]
                                           withHandler:^(CMDeviceMotion *motion, NSError *error) {
                                               if (motion.userAcceleration.x < -1.f) {
                                                   [weakSelf.navigationController popViewControllerAnimated:YES];
                                               }
                                           }];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)click:(id)sender {
    ThirdViewController *viewController = [ThirdViewController new];
    [self.navigationController pushViewController:viewController animated:YES];
}

@end
