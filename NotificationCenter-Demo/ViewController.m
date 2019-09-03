//
//  ViewController.m
//  NotificationCenter-Demo
//
//  Created by 王泽龙 on 2019/9/3.
//  Copyright © 2019 王泽龙. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
#import "ZLNotificationCenter.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [[ZLNotificationCenter defaultCenter] addObserver:self selector:@selector(test:) name:NotificationKey object:nil];
}

- (IBAction)push:(id)sender {
    [self.navigationController pushViewController:[SecondViewController new] animated:YES];
}

- (void)test:(ZLNotification *)notification {
    
    if ([notification.name isEqualToString:NotificationKey]) {
        NSLog(@"---------");
    }
    
}
@end
