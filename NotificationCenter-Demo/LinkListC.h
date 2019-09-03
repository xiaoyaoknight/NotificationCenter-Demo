//
//  LinkListC.h
//  NotificationCenter-Demo
//
//  Created by 王泽龙 on 2019/9/3.
//  Copyright © 2019 王泽龙. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef struct Node {
    
    void *data;
    
    struct Node *next;
    
} Node;

typedef struct Node *LinkList;

@interface LinkListC : NSObject

+ (LinkList)insert:(id)data linkList:(LinkList)linkList;//插入结点

+ (LinkList)listInit;
@end

NS_ASSUME_NONNULL_END
