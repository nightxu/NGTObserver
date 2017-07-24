//
//  ViewController.m
//  NGTObserverDemo
//
//  Created by JoeXu on 2017/7/23.
//  Copyright © 2017年 NightXu. All rights reserved.
//

#import "ViewController.h"

#import "NGTObserver.h"

@interface DemoObject : NSObject
@property (nonatomic,copy) NSString *title;
@end
@implementation DemoObject
@end

@interface ViewController ()
@property (nonatomic,strong) DemoObject *demoObj;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.demoObj = [[DemoObject alloc] init];
    
    
    [[NGTObserver(self.demoObj, title) doNext:^(NSString *title) {
        NSLog(@"123 + %@",title);
    }] doMap:^NSString *(NSString *nTitle) {
        return @"123";
    }];
    
    
   id observer = [[[[NGTObserver(self.demoObj, title) doNext:^(NSString *title) {
        NSLog(@"123 + %@",title);
    }] doMap:^NSString *(NSString *nTitle) {
        return @"123";
    }] doFilter:^BOOL(NSString *name) {
        NSLog(@"YES");
        return YES;
    }] doNext:^(NSString *name) {
        NSLog(@"%@___%@",name,name);
    }];
    self.demoObj.title = @"UUU";
    NGTObserverFree(self.demoObj,observer);
    self.demoObj.title = @"AAA";

    self.demoObj = nil;
    
    
    
    /*
    [[[NGTNotifyObserver(@"234567fghjk") doNext:^(NSNotification *notif) {
        NSLog(@"notif + %@",notif);
    }] doMap:^NSString *(NSNotification *notif) {
        return @"13";
    }] doNext:^(NSString *notifInfo) {
        
    }];

    id observer = [[[NGTNotifyObserver(@"234567fghjk") doNext:^(NSNotification *notif) {
        NSLog(@"notif + %@",notif);
    }] doMap:^NSString *(NSNotification *notif) {
        return @"13";
    }] doNext:^(NSString *notifInfo) {
        
    }];
    
    NGTNotifyObserverPOST(@"234567fghjk");
    NGTNotifyObserverFree(observer);
    NGTNotifyObserverPOST(@"234567fghjk");
     */
//    self.view.superview
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
