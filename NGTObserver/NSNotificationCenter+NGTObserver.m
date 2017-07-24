//
//  NSNotification+NGTObserver.m
//  NGTObserverDemo
//
//  Created by JoeXu on 2017/7/24.
//  Copyright © 2017年 NightXu. All rights reserved.
//

#import "NSNotificationCenter+NGTObserver.h"

#import "NGTNotificationSignalSource.h"

@implementation NSNotificationCenter (NGTObserver)

- (NGTSignalObserver *)ngt_observerForNotificationName:(NSString *)name{
    if (name == nil || [name isEqualToString:@""]) {
        return nil;
    }
    
    NGTNotificationSignalSource *source = NGTNotificationSignalSourceMake(self,name);
    NGTSignalDispose *dispose = [[NGTSignalDispose alloc] init];
    source.output = dispose;
    
    NGTSignalObserver *observer = [[NGTSignalObserver alloc] init];
    observer.source = source;
    observer.dispose = dispose;
    
    return observer;
}

@end
