//
//  ZLNotification.h
//  NotificationCenter-Demo
//
//  Created by 王泽龙 on 2019/9/3.
//  Copyright © 2019 王泽龙. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/****************    Notifications    ****************/

@class NSString, NSDictionary, NSOperationQueue;

@interface ZLNotification : NSObject

@property (readonly, copy) NSString *name;
@property (nullable, readonly, retain) id object;
@property (nullable, readonly, copy) NSDictionary *userInfo;

- (instancetype)initWithName:(NSString *)name object:(nullable id)object userInfo:(nullable NSDictionary *)userInfo NS_AVAILABLE(10_6, 4_0) ;
+ (instancetype)notificationWithName:(NSString *)aName object:(nullable id)anObject;
+ (instancetype)notificationWithName:(NSString *)aName object:(nullable id)anObject userInfo:(nullable NSDictionary *)aUserInfo;
@end

NS_ASSUME_NONNULL_END
