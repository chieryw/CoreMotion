//
//  ViewController.m
//  TestCoreMotion
//
//  Created by chiery on 14/11/6.
//  Copyright (c) 2014年 qunar. All rights reserved.
//

#import "ViewController.h"
#import <CoreMotion/CoreMotion.h>

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *imageView;

@property (nonatomic, strong) CMMotionManager *motionManager;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _motionManager = [[CMMotionManager alloc] init];
    // 设置更新频率
    _motionManager.deviceMotionUpdateInterval = 0.01;
    // 开始更新
    [_motionManager startDeviceMotionUpdates];
    
    // 如果设备的运动检测器是有效的
    if (_motionManager.deviceMotionAvailable) {
        // 有效释内存
        __weak typeof(self) weakSelf = self;
        [_motionManager startDeviceMotionUpdatesToQueue:[NSOperationQueue currentQueue] withHandler:^(CMDeviceMotion *motion, NSError *error) {
            double rotation = atan2(motion.gravity.x, motion.gravity.y) - M_PI;
            weakSelf.imageView.transform = CGAffineTransformMakeRotation(rotation);
        }];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
