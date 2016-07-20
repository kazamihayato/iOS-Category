//
//  UIMenuItem+Category.m
//  PKWSevers
//
//  Created by chenguangjiang on 16/7/2.
//  Copyright © 2016年 peikua. All rights reserved.
//

#import "UIMenuItem+Category.h"
#import <objc/runtime.h>
static int UIMenuItem_key;

@implementation UIMenuItem (Category)

- (instancetype)initWithTitle:(NSString *)title actionBlock:(void (^)(id sender))block{
    self = [self initWithTitle:title action:@selector(invoke:)];
    objc_setAssociatedObject(self, &UIMenuItem_key, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
    return self;
}

- (void)invoke:(id)sender {
    void(^block)() = objc_getAssociatedObject(self, &UIMenuItem_key);
    if(block){
        block();
    }
    
}
@end
