//
//  NGTNotificationSignalSource.m
//  NGTObserverDemo
//
//  Created by JoeXu on 2017/7/24.
//  Copyright © 2017年 NightXu. All rights reserved.
//

#import "NGTNotificationSignalSource.h"
@interface NGTNotificationSignalSource()
@property (nonatomic,copy,readwrite) NSString *name;
@end
@implementation NGTNotificationSignalSource

- (void)noticationMethod:(NSNotification *)notif{
    if (self.output) {
        [self.output signalSource:self value:notif];
    }
}


@end

NGTNotificationSignalSource *NGTNotificationSignalSourceMake(NSNotificationCenter *notificationCenter,NSString *name){
    if (name == nil || [name isEqualToString:@""]) {
        return nil;
    }
    NGTNotificationSignalSource *source = [[NGTNotificationSignalSource alloc] init];
    source.name = name;
    [notificationCenter addObserver:source
                           selector:@selector(noticationMethod:)
                               name:name
                             object:source];
    return source;
}
