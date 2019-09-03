//
//  ZLNode.m
//  NotificationCenter-Demo
//
//  Created by 王泽龙 on 2019/9/3.
//  Copyright © 2019 王泽龙. All rights reserved.
//

#import "ZLNode.h"

@implementation ZLNode

- (instancetype)init {
    
    self = [super init];
    if (self) {
        self.data = 0;
        self.next = nil;
    }
    return self;
    
}

- (id)initWithData:(id)data {
    
    self = [super init];
    if (self) {
        self.data = data;
        self.next = nil;
    }
    return self;
    
}
@end
