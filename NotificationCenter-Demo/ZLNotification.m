//
//  ZLNotification.m
//  NotificationCenter-Demo
//
//  Created by 王泽龙 on 2019/9/3.
//  Copyright © 2019 王泽龙. All rights reserved.
//

#import "ZLNotification.h"

@implementation ZLNotification

- (instancetype)initWithName:(NSString *)name object:(id)object userInfo:(NSDictionary *)userInfo {
    
    if (self = [super init]) {
        _name = name;
        _object = object;
        _userInfo = userInfo;
    }
    
    return self;
    
}

+ (instancetype)notificationWithName:(NSString *)aName object:(id)anObject userInfo:(NSDictionary *)aUserInfo {
    
    return [[self alloc] initWithName:aName object:anObject userInfo:aUserInfo];
    
}

+ (instancetype)notificationWithName:(NSString *)aName object:(id)anObject {
    return [self notificationWithName:aName object:anObject userInfo:nil];
}


@end
