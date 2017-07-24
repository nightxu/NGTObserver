//
//  NSNotificationCenter+NGTObserverRemain.h
//  NGTObserverDemo
//
//  Created by JoeXu on 2017/7/24.
//  Copyright © 2017年 NightXu. All rights reserved.
//

#import <Foundation/Foundation.h>

@class NGTSignalObserver;

@interface NSNotificationCenter (NGTObserverRemain)

- (void)ngt_addNotificationObserver:(NGTSignalObserver *)observer;

- (void)ngt_removeNotificationObserver:(NGTSignalObserver *)observer;

- (void)ngt_removeAllNotificationObservers;


- (NSArray<NGTSignalObserver *> *)ngt_remainingNotificationObserversForName:(NSString *)name;
@end
