//
//  ZLNode.h
//  NotificationCenter-Demo
//
//  Created by 王泽龙 on 2019/9/3.
//  Copyright © 2019 王泽龙. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZLNode : NSObject

@property id data; //数据域

@property ZLNode *next; //指针域，指向下个节点

- (id)initWithData:(id)data; //结点初始化
@end

NS_ASSUME_NONNULL_END
