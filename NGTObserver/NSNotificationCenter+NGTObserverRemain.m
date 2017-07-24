//
//  NSNotificationCenter+NGTObserverRemain.m
//  NGTObserverDemo
//
//  Created by JoeXu on 2017/7/24.
//  Copyright © 2017年 NightXu. All rights reserved.
//

#import "NSNotificationCenter+NGTObserverRemain.h"


#import <objc/runtime.h>

#import "NGTNotificationSignalSource.h"
#import "NGTSignalObserver.h"

@implementation NSNotificationCenter (NGTObserverRemain)
- (NSMutableSet *)ngt_remainingNotificationObservers{
    NSMutableSet *output = objc_getAssociatedObject(self, _cmd);
    if (output == nil) {
        output = [NSMutableSet set];
        objc_setAssociatedObject(self, _cmd, output, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return output;
}

- (void)ngt_addNotificationObserver:(NGTSignalObserver *)observer{
    if (![observer.source isKindOfClass:[NGTNotificationSignalSource class]]) {return;}
    NGTNotificationSignalSource *source = (NGTNotificationSignalSource *)observer.source;
    if(source.name == nil || [source.name isEqualToString:@""]) return;
    
    NSArray *foundNotificationObservers = [self ngt_remainingNotificationObserversForName:source.name];
    for (NGTSignalObserver *remainingObserver in foundNotificationObservers) {
        if ([observer isEqual:remainingObserver]) {
            return;
        }
    }
    
    
    [self.ngt_remainingNotificationObservers addObject:observer];
}

- (void)ngt_removeNotificationObserver:(NGTSignalObserver *)observer{
    if (![observer.source isKindOfClass:[NGTNotificationSignalSource class]]) {return;}
    NGTNotificationSignalSource *source = (NGTNotificationSignalSource *)observer.source;
    if(source.name == nil || [source.name isEqualToString:@""]) return;
    
    NSArray *foundNotificationObservers = [self ngt_remainingNotificationObserversForName:source.name];
    for (NGTSignalObserver *remainingoObserver in foundNotificationObservers) {

        if ([observer isEqual:remainingoObserver]) {
            [self removeObserver:observer.source name:source.name object:observer.source];
            [self.ngt_remainingNotificationObservers removeObject:remainingoObserver];
            return;
        }
    }
}

- (void)ngt_removeAllNotificationObservers{
    for (NGTSignalObserver *remainingoObserver in self.ngt_remainingNotificationObservers) {
        
        NGTNotificationSignalSource *source = (NGTNotificationSignalSource *)remainingoObserver.source;
        [self removeObserver:remainingoObserver.source name:source.name object:source];
    }
    
    [self.ngt_remainingNotificationObservers removeAllObjects];
}


- (NSArray<NGTSignalObserver *> *)ngt_remainingNotificationObserversForName:(NSString *)name{
    
    NSMutableArray *output = @[].mutableCopy;
    for (NGTSignalObserver *remainingoObserver in self.ngt_remainingNotificationObservers) {
        NGTNotificationSignalSource *source = (NGTNotificationSignalSource *)remainingoObserver.source;
        
        if ([name isEqualToString:source.name]) {
            [output addObject:remainingoObserver];
        }
        
    }
    return output;
}

@end
