//
//  NGTObserverToolMacro.h
//  NGTObserverDemo
//
//  Created by JoeXu on 2017/7/24.
//  Copyright © 2017年 NightXu. All rights reserved.
//

#ifndef NGTObserverToolMacro_h
#define NGTObserverToolMacro_h


//__NGT_PASTE__
#define __NGT_PASTE__(A,B) A##B


// 对象-属性 >> KeyPath
#define ngt_getKeypath1(OBJ) \
(((void)(NO && ((void)OBJ,NO)),strchr(# OBJ,'.')+1))
#define ngt_getKeypath(OBJ,PATH) \
(((void)(NO && ((void)OBJ.PATH,NO)),# PATH))


#endif /* NGTObserverToolMacro_h */
