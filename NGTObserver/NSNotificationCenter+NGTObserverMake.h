//
//  NSNotificationCenter+NGTObserverMake.h
//  NGTObserverDemo
//
//  Created by JoeXu on 2017/7/24.
//  Copyright © 2017年 NightXu. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "NSNotificationCenter+NGTObserver.h"

#import "NSNotificationCenter+NGTObserverRemain.h"

#import "NSObject+NGTObserverAutoDealloc.h"


#import "NGTObserverToolMacro.h"



#define __NGTNotifyObserver(CENTER,NAME,L)\
({\
NGTSignalObserver *__NGT_PASTE__(_ngt_o_,L) = [CENTER ngt_observerForNotificationName:NAME];\
[CENTER ngt_addNotificationObserver:__NGT_PASTE__(_ngt_o_,L)];\
__NGT_PASTE__(_ngt_o_,L);\
})

#define __NGTNotifyObserverFree(CENTER,OBSERVER) [CENTER ngt_removeNotificationObserver:OBSERVER]

#define __NGTNotifyObserverFreeForName(CENTER,NAME,L)\
({\
NSArray *__NGT_PASTE__(foundNotificationObservers_,L) = [CENTER ngt_remainingNotificationObserversForName:NAME];\
for (NGTSignalObserver *__NGT_PASTE__(remainingoObserver_,L) in __NGT_PASTE__(foundNotificationObservers_,L)) {\
    __NGTNotifyObserverFree(__NGT_PASTE__(remainingoObserver_,L));\
}\
})


#define __NGTNotifyObserverPOST(CENTER,NAME,L)\
({\
NSArray *__NGT_PASTE__(_ngt_foundNotificationObservers_,L) = [CENTER ngt_remainingNotificationObserversForName:NAME];\
for (NGTSignalObserver *__NGT_PASTE__(remainingoObserver_,L) in __NGT_PASTE__(_ngt_foundNotificationObservers_,L)) {\
    [CENTER postNotificationName:NAME object:__NGT_PASTE__(remainingoObserver_,L).source];\
}\
})

// 添加监听
#define NGTNotifyObserver(NAME)\
__NGTNotifyObserver([NSNotificationCenter defaultCenter],NAME,__COUNTER__)


#define NGTNotifyObserverFree(OBSERVER)\
__NGTNotifyObserverFree([NSNotificationCenter defaultCenter],OBSERVER)

#define NGTNotifyObserverFreeForName(NAME)\
__NGTNotifyObserverFreeForName([NSNotificationCenter defaultCenter],NAME,__COUNTER__)







#define NGTNotifyObserverPOST(NAME)\
__NGTNotifyObserverPOST([NSNotificationCenter defaultCenter],NAME,__COUNTER__)


@interface NSNotificationCenter (NGTObserverMake)

@end
