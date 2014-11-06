//
//  ThirdViewController.m
//  TestCoreMotion
//
//  Created by chiery on 14/11/6.
//  Copyright (c) 2014年 qunar. All rights reserved.
//

#import "ThirdViewController.h"

#import <CoreMotion/CoreMotion.h>
#import "FourViewController.h"

@interface ThirdViewController ()
{
    UIImageView *_imageView;
}
@property (nonatomic, strong) CMMotionManager *motionManager;


@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    _imageView.image = [UIImage imageNamed:@"1"];
    [self.view addSubview:_imageView];
    
    _motionManager = [[CMMotionManager alloc] init];
    _motionManager.deviceMotionUpdateInterval = 0.01;
    [_motionManager startDeviceMotionUpdates];
    
    __block BOOL showingPrompt = NO;
    double showPromptTrigger = 1.0f;
    double showAnswerTrigger = 0.8f;
    if (_motionManager.deviceMotionAvailable) {
        __weak typeof(self) weakSelf = self;
        [_motionManager startDeviceMotionUpdatesToQueue:[NSOperationQueue currentQueue]
                                            withHandler:^(CMDeviceMotion *motion, NSError *error) {
                                                // 设置变化的大小
                                                double magnitude = [weakSelf magnitudeFromAttitude:motion.attitude];
                                                if (!showingPrompt && (magnitude > showPromptTrigger)) {
                                                    showingPrompt = YES;
                                                    FourViewController *fourViewController = [[FourViewController alloc] init];
                                                    fourViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
                                                    [weakSelf presentViewController:fourViewController animated:YES completion:nil];
                                                }
                                                // hide the prompt
                                                if (showingPrompt && (magnitude < showAnswerTrigger)) {
                                                    showingPrompt = NO;
                                                    [weakSelf dismissViewControllerAnimated:YES completion:nil];
                                                }
                                                
                                            }];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (double)magnitudeFromAttitude:(CMAttitude *)attitude
{
    return (double)(sqrt(pow(attitude.roll, 2.0f) + pow(attitude.yaw, 2.0f) + pow(attitude.pitch, 2.0f)));
}

@end
