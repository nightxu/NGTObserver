//
//  NGTSignalDispose.m
//  NGTObserverDemo
//
//  Created by JoeXu on 2017/7/23.
//  Copyright © 2017年 NightXu. All rights reserved.
//

#import "NGTSignalDispose.h"

@implementation NGTSignalDispose


- (void)signalSource:(NGTSignalSource *)signalSource value:(id)value{
    
    id outputValue = value;
    if (self.next) {
        
        self.next(value);
        
    }else if(self.filter){
        
        BOOL canChild = self.filter(value);
        if (canChild == NO) {
            return;
        }
        
    }else if(self.map){
        
        outputValue = self.map(value);
        
    }
    
    if (self.childDispose) {
        [self.childDispose signalSource:self value:outputValue];
    }
    
}

- (void)setNext:(NGTSignalDisposeNext)next{
    _next = [next copy];
    _filter = nil;
    _map = nil;
}
- (void)setFilter:(NGTSignalDisposeFilter)filter{
    _filter = [filter copy];
    _next = nil;
    _map = nil;
}
- (void)setMap:(NGTSignalDisposeMap)map{
    _map = [map copy];
    _filter = nil;
    _next = nil;
}

@end



@implementation NGTSignalDispose (NGTDoOperation)

- (instancetype)doNext:(NGTSignalDisposeNext)block{
    self.next = block;
    self.childDispose = [[NGTSignalDispose alloc] init];
    return self.childDispose;
}
- (instancetype)doFilter:(NGTSignalDisposeFilter)block{
    self.filter = block;
    self.childDispose = [[NGTSignalDispose alloc] init];
    return self.childDispose;
}
- (instancetype)doMap:(NGTSignalDisposeMap)block{
    self.map = block;
    self.childDispose = [[NGTSignalDispose alloc] init];
    return self.childDispose;
}

@end









