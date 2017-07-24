//
//  NGTObjectSignalSource.h
//  NGTObserverDemo
//
//  Created by JoeXu on 2017/7/23.
//  Copyright © 2017年 NightXu. All rights reserved.
//

#import "NGTSignalSource.h"



@interface NGTObjectSignalSource : NGTSignalSource
@property (nonatomic,copy,readonly) NSString *keypath;
@end

FOUNDATION_EXPORT NGTObjectSignalSource *NGTObjectSignalSourceMake(NSObject *object,NSString *keyPath);
