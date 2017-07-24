//
//  NSNotification+NGTObserver.h
//  NGTObserverDemo
//
//  Created by JoeXu on 2017/7/24.
//  Copyright © 2017年 NightXu. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "NGTSignalObserver.h"

@interface NSNotificationCenter (NGTObserver)

- (NGTSignalObserver *)ngt_observerForNotificationName:(NSString *)name;

@end
