//
//  NGTSignalObserver.h
//  NGTObserverDemo
//
//  Created by JoeXu on 2017/7/23.
//  Copyright © 2017年 NightXu. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "NGTSignalDispose.h"

@interface NGTSignalObserver : NSObject

@property (nonatomic,strong) NGTSignalSource *source;

@property (nonatomic,strong) NGTSignalDispose *dispose;


- (instancetype)doNext:(NGTSignalDisposeNext)block;
- (instancetype)doFilter:(NGTSignalDisposeFilter)block;
- (instancetype)doMap:(NGTSignalDisposeMap)block;

@end
