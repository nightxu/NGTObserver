//
//  NGTSignalSource.h
//  NGTObserverDemo
//
//  Created by JoeXu on 2017/7/23.
//  Copyright © 2017年 NightXu. All rights reserved.
//

#import <Foundation/Foundation.h>

@class NGTSignalSource;

@protocol NGTSignalSourceOutput <NSObject>
@required
- (void)signalSource:(NGTSignalSource*)signalSource value:(id)value;
@end


@interface NGTSignalSource : NSObject

@property (nonatomic,weak) id<NGTSignalSourceOutput> output;

@end
