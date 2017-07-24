//
//  NGTNotificationSignalSource.h
//  NGTObserverDemo
//
//  Created by JoeXu on 2017/7/24.
//  Copyright © 2017年 NightXu. All rights reserved.
//

#import "NGTSignalSource.h"

@interface NGTNotificationSignalSource : NGTSignalSource
@property (nonatomic,copy,readonly) NSString *name;
@end

FOUNDATION_EXPORT NGTNotificationSignalSource *NGTNotificationSignalSourceMake(NSNotificationCenter *notificationCenter,NSString *name);
