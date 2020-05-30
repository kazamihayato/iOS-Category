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
// 快速创建富文本字符串，包含了Str 颜色 字体  字体间距 行间距 range
+ (NSAttributedString *)attributedWithString:(NSString *)string
                                        font:(UIFont*)font
                                       color:(UIColor *)color;

+ (NSAttributedString *)attributedWithString:(NSString *)string
                                        font:(UIFont*)font
                                       color:(UIColor *)color
                                 wordSpacing:(CGFloat)wordSpacing
                                 lineSpacing:(CGFloat)lineSpacing;

+ (NSAttributedString *)attributedWithString:(NSString *)string
                                        font:(UIFont*)font
                                       color:(UIColor *)color
                            wordSpacing:(CGFloat)wordSpacing
                                 lineSpacing:(CGFloat)lineSpacing
                                       range:(NSRange)range;

//html片段转为富文本放在Label、Button上显示，这样HTML标签才会生效
+ (NSAttributedString*)htmlToAttString:(NSString*)string;


//由于系统计算富文本的高度不正确，自己写了方法
- (CGFloat)heightWithContainWidth:(CGFloat)width;
@end
