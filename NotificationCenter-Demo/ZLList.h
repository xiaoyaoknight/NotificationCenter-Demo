//
//  ZLList.h
//  NotificationCenter-Demo
//
//  Created by 王泽龙 on 2019/9/3.
//  Copyright © 2019 王泽龙. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZLNode.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZLList : NSObject

@property ZLNode *head;//定义链表的头

+ (void)insert:(id)data linkList:(ZLList *)linkList;//插入结点

+ (id)listWithData:(id)data;//工厂方法
@end

NS_ASSUME_NONNULL_END
