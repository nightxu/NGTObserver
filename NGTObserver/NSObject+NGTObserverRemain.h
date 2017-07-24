//
//  NSObject+NGTObserverMake.h
//  NGTObserverDemo
//
//  Created by JoeXu on 2017/7/24.
//  Copyright © 2017年 NightXu. All rights reserved.
//

#import <Foundation/Foundation.h>

@class NGTSignalObserver;

@interface NSObject (NGTObserverRemain)

- (void)ngt_addObserver:(NGTSignalObserver *)observer;

- (void)ngt_removeObserver:(NGTSignalObserver *)observer;

- (void)ngt_removeAllObservers;

- (NSArray<NGTSignalObserver *> *)ngt_remainingObserversForKeyPath:(NSString *)keypath;
@end





