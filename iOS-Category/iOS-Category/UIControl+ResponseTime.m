//
//  UIControl+ResponseTime.m
//  BanggoPhone
//
//  Created by sam on 15/10/14.
//  Copyright © 2015年 BG. All rights reserved.


#import "UIControl+ResponseTime.h"
#import <objc/runtime.h>

@implementation UIControl (ResponseTime)

static const char *UIControl_acceptEventInterval = "UIControl_acceptEventInterval";
static const char *UIControl_ignoreEventInterval = "UIControl_ignoreEventInterval";

- (NSTimeInterval)responseTime
{
    return [objc_getAssociatedObject(self, UIControl_acceptEventInterval) doubleValue];
}
- (void)setResponseTime:(NSTimeInterval)responseTime
{
    objc_setAssociatedObject(self, UIControl_acceptEventInterval, @(responseTime), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (NSTimeInterval)ignoreEvent
{
    return [objc_getAssociatedObject(self, UIControl_ignoreEventInterval) doubleValue];
}
- (void)setIgnoreEvent:(NSTimeInterval)ignoreEvent
{
    objc_setAssociatedObject(self, UIControl_acceptEventInterval, @(ignoreEvent), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
-(void)__UResponse_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event
{
    if (self.ignoreEvent) return;
    if (self.responseTime > 0)
    {
        self.ignoreEvent = YES;
        [self performSelector:@selector(setIgnoreEvent:) withObject:@(NO) afterDelay:self.responseTime];
    }
    
    [self __UResponse_sendAction:action to:target forEvent:event];
}


+(void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        Method a = class_getInstanceMethod(self, @selector(sendAction:to:forEvent:));
        Method b = class_getInstanceMethod(self, @selector(__UResponse_sendAction:to:forEvent:));
        
        method_exchangeImplementations(a, b);
        
    });
}

@end
