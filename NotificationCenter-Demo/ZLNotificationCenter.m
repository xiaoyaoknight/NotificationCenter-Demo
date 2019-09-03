//
//  ZLNotificationCenter.m
//  NotificationCenter-Demo
//
//  Created by 王泽龙 on 2019/9/3.
//  Copyright © 2019 王泽龙. All rights reserved.
//

#import "ZLNotificationCenter.h"
#import "LinkListC.h"
#import "ZLList.h"

@interface ZLNotificationCenter ()

/// 数组方式
@property (nonatomic, strong) NSMutableArray *observers;

@property LinkList linkListC;

@property (nonatomic, strong) ZLList *zlList;
@end

@implementation ZLNotificationCenter

- (instancetype)init {
    
    @throw [NSException exceptionWithName:@"Cannot be involked" reason:@"Singleton" userInfo:nil];
}

+ (ZLNotificationCenter *)defaultCenter {
    
    static ZLNotificationCenter *singleton;
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        singleton = [[self alloc] initSingleton];
        
    });
    
    return singleton;
    
}

- (instancetype)initSingleton {
    
    if ([super init]) {
        
        _observers = [NSMutableArray array]; //数组初始化
        
//        _linkListC = [LinkListC listInit]; //c链表初始化
//        _zlList = [ZLList listWithData:@"0"]; //oc链表初始化
        
    }
    
    return self;
    
}

- (void)addObserver:(id)observer selector:(SEL)aSelector name:(NSString *)aName object:(id)anObject {
    
    ZLObserverModel *observerModel = [[ZLObserverModel alloc] init];
    observerModel.observer = observer;
    observerModel.selector = aSelector;
    observerModel.notificationName = aName;
    observerModel.object = anObject;
    
    [self.observers addObject:observerModel]; //采用数组形式
    
//    [ZLList insert:observerModel linkList:_zlList]; //采用oc模拟链表
    
//    [LinkListC insert:observerModel linkList:_linkListC]; //采用C链表
    
}

- (void)postNotification:(ZLNotification *)notification {
    
    //采用C链表
//    Node *p;
//    p = _linkListC;
//    while (p->next) {
//        p = p->next;
//        ZLObserverModel *observerModel = (__bridge id)p->data;
//        id observer = observerModel.observer;
//        SEL selector = observerModel.selector;
//        if (![notification.name isEqualToString:observerModel.notificationName]) {
//            return;
//        }
//
//        if (!observerModel.operationQueue) {
//#pragma clang diagnostic push
//#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
//            [observer performSelector:selector withObject:notification];
//#pragma clang diagnostic pop
//        } else {
//
//            NSBlockOperation *operation = [NSBlockOperation blockOperationWithBlock:^{
//                observerModel.block(notification);
//            }];
//
//            NSOperationQueue *operationQueue = observerModel.operationQueue;
//            [operationQueue addOperation:operation];
//        }
//    }
    
     //采用oc模拟链表
//    ZLNode *p = _zlList.head;
//    while (p) {
//        p = p.next;
//        ZLObserverModel *observerModel = p.data;
//        id observer = observerModel.observer;
//        SEL selector = observerModel.selector;
//        if (![notification.name isEqualToString:observerModel.notificationName]) {
//            return;
//        }
//
//        if (!observerModel.operationQueue) {
//#pragma clang diagnostic push
//#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
//            [observer performSelector:selector withObject:notification];
//#pragma clang diagnostic pop
//
//        } else {
//
//            NSBlockOperation *operation = [NSBlockOperation blockOperationWithBlock:^{
//                observerModel.block(notification);
//            }];
//
//            NSOperationQueue *operationQueue = observerModel.operationQueue;
//            [operationQueue addOperation:operation];
//        }
//    }
    
    //采用数组形式
    [self.observers enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {

        ZLObserverModel *observerModel = obj;
        id observer = observerModel.observer;
        SEL selector = observerModel.selector;
        if (![notification.name isEqualToString:observerModel.notificationName]) {
            return;
        }

        if (!observerModel.operationQueue) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
            [observer performSelector:selector withObject:notification];
#pragma clang diagnostic pop

        } else {

            NSBlockOperation *operation = [NSBlockOperation blockOperationWithBlock:^{
                observerModel.block(notification);
            }];

            NSOperationQueue *operationQueue = observerModel.operationQueue;
            [operationQueue addOperation:operation];
        }
    }];
}

- (void)postNotificationName:(NSString *)aName object:(id)anObject {
    
    [self postNotificationName:aName object:anObject userInfo:nil];
    
}

- (void)postNotificationName:(NSString *)aName object:(id)anObject userInfo:(NSDictionary *)aUserInfo {
    
    ZLNotification *notification = [[ZLNotification alloc] initWithName:aName object:anObject userInfo:aUserInfo];
    
    [self postNotification:notification];
    
}

- (void)removeObserver:(id)observer {
    
    [self removeObserver:observer name:nil object:nil];
    
}

- (void)removeObserver:(id)observer name:(NSString *)aName object:(id)anObject {
    
    //oc链表删除
//    [self deleteLinkList:_zlList name:aName];
    
    //c链表删除
//    [self deleteLinkListC:_linkListC name:aName];
    
    //数组形式删除
    [self.observers enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {

        ZLObserverModel *observerModel = obj;
        if (observerModel.observer == observer && aName == nil  && anObject == nil) {
            [self.observers removeObject:observerModel];
            *stop = YES;
        }

        if ([observerModel.notificationName isEqualToString:aName] && observerModel.object == anObject) {
            [self.observers removeObject:observerModel];
            *stop = YES;
        }
    }];
}

- (id <NSObject>)addObserverForName:(NSString *)name object:(id)obj queue:(NSOperationQueue *)queue usingBlock:(void (^)(ZLNotification * _Nonnull))block {
    
    ZLObserverModel *observerModel = [[ZLObserverModel alloc] init];
    observerModel.notificationName = name;
    observerModel.object = obj;
    observerModel.operationQueue = queue;
    observerModel.block = block;
    [self.observers addObject:observerModel];
    return nil;
    
}

- (void)deleteLinkList:(ZLList *)linkList name:(NSString *)aName {
    
    //oc模拟链表
    ZLNode *p = linkList.head;
    ZLNode *pre = linkList.head;
    while (p.next) {
        p = p.next;
        ZLObserverModel *model = (ZLObserverModel *)p.data;
        if (model.notificationName == aName) {
            pre.next = p.next;
        }
        pre = p.next;
        
    }
    
}

- (void)deleteLinkListC:(LinkList)linkList name:(NSString *)aName {
    
    //c链表
    Node *p, *nodePre;
    
    p = nodePre = linkList;
    
    while (p->next) {
        
        p = p->next;
        
        ZLObserverModel *model = (__bridge ZLObserverModel *)p->data;
        
        if (model.notificationName == aName) {
            
            nodePre->next = p->next;
            
        }
        
        nodePre = p->next;
        
    }
    
}
@end
