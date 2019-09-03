//
//  ZLNotificationCenter.h
//  NotificationCenter-Demo
//
//  Created by 王泽龙 on 2019/9/3.
//  Copyright © 2019 王泽龙. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZLNotification.h"
#import "ZLObserverModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZLNotificationCenter : NSObject

+ (ZLNotificationCenter *)defaultCenter;

- (void)addObserver:(id)observer selector:(SEL)aSelector name:(nullable NSString *)aName object:(nullable id)anObject;

- (void)postNotification:(ZLNotification *)notification;

- (void)postNotificationName:(NSString *)aName object:(nullable id)anObject;

- (void)postNotificationName:(NSString *)aName object:(nullable id)anObject userInfo:(nullable NSDictionary*)aUserInfo;

- (void)removeObserver:(id)observer;

- (void)removeObserver:(id)observer name:(nullable NSString *)aName object:(nullable id)anObject;

- (id)addObserverForName:(nullable NSString *)name object:(nullable id)obj queue:(nullable NSOperationQueue *)queue usingBlock:(void(^)(ZLNotification *note))block NS_AVAILABLE(10_6,4_0);

@end

NS_ASSUME_NONNULL_END
