//
//  NGTSignalObserver.m
//  NGTObserverDemo
//
//  Created by JoeXu on 2017/7/23.
//  Copyright © 2017年 NightXu. All rights reserved.
//

#import "NGTSignalObserver.h"

@implementation NGTSignalObserver


- (instancetype)doNext:(NGTSignalDisposeNext)block{
    NGTSignalDispose *lastDispose = [self findLastDispose];
    [lastDispose doNext:block];
    return self;
}
- (instancetype)doFilter:(NGTSignalDisposeFilter)block{
    NGTSignalDispose *lastDispose = [self findLastDispose];
    [lastDispose doFilter:block];
    return self;
}
- (instancetype)doMap:(NGTSignalDisposeMap)block{
    NGTSignalDispose *lastDispose = [self findLastDispose];
    [lastDispose doMap:block];
    return self;
}

- (NGTSignalDispose *)findLastDispose{
    
    NGTSignalDispose *output = self.dispose;
    while (output.childDispose) {
        output = output.childDispose;
    }
    
    return output;
}
- (void)dealloc{
//    NSLog(@"%@ --- will dealloc",self);

    self.source = nil;
    self.dispose = nil;
}
@end
