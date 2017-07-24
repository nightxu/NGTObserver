//
//  NGTObjectSignalSource.m
//  NGTObserverDemo
//
//  Created by JoeXu on 2017/7/23.
//  Copyright © 2017年 NightXu. All rights reserved.
//

#import "NGTObjectSignalSource.h"
@interface NGTObjectSignalSource()

@property (nonatomic,copy,readwrite) NSString *keypath;

@end

@implementation NGTObjectSignalSource

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    BOOL prior = [[change valueForKey:NSKeyValueChangeNotificationIsPriorKey] boolValue];
    if (prior) {return;}
    
    NSKeyValueChange changeKind = [[change objectForKey:NSKeyValueChangeKindKey] integerValue];
    if (changeKind != NSKeyValueChangeSetting) return;
    id oldVal = [change objectForKey:NSKeyValueChangeOldKey];
    if (oldVal == [NSNull null]) oldVal = nil;
    id newVal = [change objectForKey:NSKeyValueChangeNewKey];
    if (newVal == [NSNull null]) newVal = nil;
    
    
    if (self.output){
        [self.output signalSource:self value:newVal];
    }
}

@end

NGTObjectSignalSource *NGTObjectSignalSourceMake(NSObject *object,NSString *keypath){
    if (object == nil || keypath == nil || [keypath isEqualToString:@""]){
        return nil;
    }
    NGTObjectSignalSource *output = [[NGTObjectSignalSource alloc] init];
    output.keypath = keypath;
    [object addObserver:output
             forKeyPath:keypath
                options:NSKeyValueObservingOptionPrior|NSKeyValueObservingOptionNew
                context:nil];
    
    return output;
}











