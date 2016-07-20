//
//  UIMenuItem+Category.h
//  PKWSevers
//
//  Created by chenguangjiang on 16/7/2.
//  Copyright © 2016年 peikua. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIMenuItem (Category)
- (instancetype)initWithTitle:(NSString *)title actionBlock:(void (^)(id sender))block;
@end
