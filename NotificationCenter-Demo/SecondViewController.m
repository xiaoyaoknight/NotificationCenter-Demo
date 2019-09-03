//
//  SecondViewController.m
//  NotificationCenter-Demo
//
//  Created by 王泽龙 on 2019/9/3.
//  Copyright © 2019 王泽龙. All rights reserved.
//

#import "SecondViewController.h"
#import "ViewController.h"
#import "ZLNotificationCenter.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    ZLNotification *notification = [ZLNotification notificationWithName:NotificationKey object:@"aaa"];
    [[ZLNotificationCenter defaultCenter] postNotification:notification];
}

@end
