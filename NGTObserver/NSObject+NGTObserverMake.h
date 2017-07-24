//
//  NSObject+NGTObserverMake.h
//  NGTObserverDemo
//
//  Created by JoeXu on 2017/7/24.
//  Copyright © 2017年 NightXu. All rights reserved.
//

#import <Foundation/Foundation.h>


#import "NSObject+NGTObserver.h"

#import "NSObject+NGTObserverRemain.h"

#import "NSObject+NGTObserverAutoDealloc.h"


#import "NGTObserverToolMacro.h"



#define __NGTObserver(OBJ,KEYPATH,L)\
({\
NGTSignalObserver *__NGT_PASTE__(_ngt_o_,L) = [OBJ ngt_observerForKeyPath:@ngt_getKeypath(OBJ,KEYPATH)];\
[OBJ ngt_addObserver:__NGT_PASTE__(_ngt_o_,L)];\
[OBJ ngt_swizzleDeallocIfNeed];\
__NGT_PASTE__(_ngt_o_,L);\
})

#define __NGTObserverFree(OBJ,OBSERVER)\
[OBJ ngt_removeObserver:OBSERVER]


#define __NGTObserverFreeKeyPath(OBJ,KEYPATH,L)\
({\
NSArray *__NGT_PASTE__(_ngt_foundObserver_,L) = [OBJ ngt_remainingObserversForKeyPath:@ngt_getKeypath(OBJ,KEYPATH)];\
for (NGTSignalObserver *__NGT_PASTE__(_ngt_observer_,L) in __NGT_PASTE__(_ngt_foundObserver_,L)) {\
    __NGTObserverFree(__NGT_PASTE__(_ngt_observer_,L));\
}\
})

// 添加监听
#define NGTObserver(OBJ,KEYPATH) __NGTObserver(OBJ,KEYPATH,__COUNTER__)


#define NGTObserverFree(OBJ,OBSERVER)\
__NGTObserverFree(OBJ,OBSERVER)


#define NGTObserverFreeKeyPath(OBJ,KEYPATH,L)\
__NGTObserverFreeKeyPath(OBJ,KEYPATH,__COUNTER__)

@interface NSObject (NGTObserverMake)

@end







