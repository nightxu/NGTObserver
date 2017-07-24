//
//  NSObject+NGTObserverMake.m
//  NGTObserverDemo
//
//  Created by JoeXu on 2017/7/24.
//  Copyright © 2017年 NightXu. All rights reserved.
//

#import "NSObject+NGTObserverRemain.h"

#import <objc/runtime.h>

#import "NGTObjectSignalSource.h"
#import "NGTSignalObserver.h"

@implementation NSObject (NGTObserverRemain)

- (NSMutableSet *)ngt_remainingObservers{
    
    NSMutableSet *output = objc_getAssociatedObject(self, _cmd);
    if (output == nil) {
        output = [NSMutableSet set];
        objc_setAssociatedObject(self, _cmd, output, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return output;
}

- (void)ngt_addObserver:(NGTSignalObserver *)observer{
    NGTObjectSignalSource *source = (NGTObjectSignalSource *)observer.source;
    NSArray *foundObservers = [self ngt_remainingObserversForKeyPath:source.keypath];

    for (NGTSignalObserver *remainingobserver in foundObservers) {

        if ([observer isEqual:remainingobserver]) {
            return;
        }
    }
    
    [self.ngt_remainingObservers addObject:observer];
    
}

- (void)ngt_removeObserver:(NGTSignalObserver *)observer{
    NGTObjectSignalSource *source = (NGTObjectSignalSource *)observer.source;

    NSArray *foundObservers = [self ngt_remainingObserversForKeyPath:source.keypath];
    for (NGTSignalObserver *remainingobserver in foundObservers) {
        
        if ([observer isEqual:remainingobserver]) {
            [self removeObserver:source forKeyPath:source.keypath];
            [self.ngt_remainingObservers removeObject:remainingobserver];
            return;
        }
    }
}

- (void)ngt_removeAllObservers{
    
    for (NGTSignalObserver *observer in self.ngt_remainingObservers) {
        NGTObjectSignalSource *source = (NGTObjectSignalSource *)observer.source;
        [self removeObserver:observer.source forKeyPath:source.keypath];
    }
    
    [self.ngt_remainingObservers removeAllObjects];
}

- (NSArray<NGTSignalObserver *> *)ngt_remainingObserversForKeyPath:(NSString *)keypath{

    NSMutableArray *output = @[].mutableCopy;
    for (NGTSignalObserver *observer in self.ngt_remainingObservers) {
        NGTObjectSignalSource *source = (NGTObjectSignalSource *)observer.source;
        if ([keypath isEqualToString:source.keypath]) {
            [output addObject:observer];
        }
        
    }
    return output;
}

@end
