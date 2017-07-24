//
//  NSObject+NGTObserver.h
//  NGTObserverDemo
//
//  Created by JoeXu on 2017/7/23.
//  Copyright © 2017年 NightXu. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "NGTSignalObserver.h"

@interface NSObject (NGTObserver)

- (NGTSignalObserver *)ngt_observerForKeyPath:(NSString *)keyPath;


@end









