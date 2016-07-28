//
//  NSAttributedString+Category.h
//  PKWSevers
//
//  Created by chenguangjiang on 16/5/23.
//  Copyright © 2016年 peikua. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface NSAttributedString (Category)
//由于系统计算富文本的高度不正确，自己写了方法
- (CGFloat)heightWithContainWidth:(CGFloat)width;
@end
