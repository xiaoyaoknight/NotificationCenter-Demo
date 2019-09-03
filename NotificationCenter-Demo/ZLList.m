//
//  ZLList.m
//  NotificationCenter-Demo
//
//  Created by 王泽龙 on 2019/9/3.
//  Copyright © 2019 王泽龙. All rights reserved.
//

#import "ZLList.h"
#import "ZLNotificationCenter.h"

@implementation ZLList

- (instancetype)initWithData:(id)data {
    
    self = [super init];
    
    if (self) {
        
        self.head = [[ZLNode alloc] init];
        self.head.data = data;
        self.head.next = nil;
    }
    
    return self;
    
}

+ (id)listWithData:(id)data {
    
    ZLList *firstNode = [[ZLList alloc] initWithData:data];
    
    return firstNode;
    
}

+ (void)insert:(id)data linkList:(ZLList *)linkList {
    
    ZLNode *p = linkList.head;
    
    while (p.next) {
        
        p = p.next;
        
    }
    
    ZLNode *node = [[ZLNode alloc] init];
    
    node.data = data;
    
    node.next = p.next;
    
    p.next = node;
    
}

@end
