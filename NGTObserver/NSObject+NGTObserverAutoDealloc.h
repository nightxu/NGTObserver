//
//  NSObject+NGTObserverAutoDealloc.h
//  NGTObserverDemo
//
//  Created by JoeXu on 2017/7/23.
//  Copyright © 2017年 NightXu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (NGTObserverAutoDealloc)

- (void)ngt_swizzleDeallocIfNeed;

@end
