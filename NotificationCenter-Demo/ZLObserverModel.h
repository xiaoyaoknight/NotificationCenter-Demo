//
//  ZLObserverModel.h
//  NotificationCenter-Demo
//
//  Created by 王泽龙 on 2019/9/3.
//  Copyright © 2019 王泽龙. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZLNotification.h"

NS_ASSUME_NONNULL_BEGIN

typedef void(^OperationBlock)(ZLNotification *notification);

@interface ZLObserverModel : NSObject

@property (nonatomic, weak) id observer;

@property (nonatomic, assign) SEL selector;

@property(nonatomic, copy) NSString *notificationName;

@property (nonatomic, weak) id object;

@property (nonatomic, strong) NSOperationQueue *operationQueue;

@property (nonatomic, copy) OperationBlock block;

@end

NS_ASSUME_NONNULL_END
