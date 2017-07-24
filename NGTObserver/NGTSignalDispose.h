//
//  NGTSignalDispose.h
//  NGTObserverDemo
//
//  Created by JoeXu on 2017/7/23.
//  Copyright © 2017年 NightXu. All rights reserved.
//

#import "NGTSignalSource.h"

typedef void (^NGTSignalDisposeNext)(id);
typedef id (^NGTSignalDisposeMap)(id);
typedef BOOL (^NGTSignalDisposeFilter)(id);


@interface NGTSignalDispose : NGTSignalSource<NGTSignalSourceOutput>

@property (nonatomic,strong) NGTSignalDispose *childDispose;

@property (nonatomic,copy) NGTSignalDisposeNext next;
@property (nonatomic,copy) NGTSignalDisposeMap map;
@property (nonatomic,copy) NGTSignalDisposeFilter filter;

@end



@interface NGTSignalDispose (NGTDoOperation)

- (instancetype)doNext:(NGTSignalDisposeNext)block;
- (instancetype)doFilter:(NGTSignalDisposeFilter)block;
- (instancetype)doMap:(NGTSignalDisposeMap)block;

@end
