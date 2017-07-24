//
//  NSObject+NGTObserver.m
//  NGTObserverDemo
//
//  Created by JoeXu on 2017/7/23.
//  Copyright © 2017年 NightXu. All rights reserved.
//

#import "NSObject+NGTObserver.h"

#import "NGTObjectSignalSource.h"
@implementation NSObject (NGTObserver)
- (NGTSignalObserver *)ngt_observerForKeyPath:(NSString *)keyPath{
    if (keyPath == nil || [keyPath isEqualToString:@""]) {
        return nil;
    }
    
    NGTObjectSignalSource *source = NGTObjectSignalSourceMake(self, keyPath);
    NGTSignalDispose *dispose = [[NGTSignalDispose alloc] init];
    source.output = dispose;
    
    NGTSignalObserver *observer = [[NGTSignalObserver alloc] init];
    observer.source = source;
    observer.dispose = dispose;
    
    return observer;
}


@end
