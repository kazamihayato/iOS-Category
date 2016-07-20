//
//  NSMutableAttributedString+Category.h
//  iOS-Category
//
//  Created by 庄BB的MacBook on 16/7/20.
//  Copyright © 2016年 BBFC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIColor+BGHexColor.h"
@interface NSMutableAttributedString (Category)
/**
 *  直接返回NSAttributedString
 *
 *  @param prefixString prefixString description
 *  @param suffixString suffixString description
 *
 *  @return 直接返回NSAttributedString  默认了颜色 字体
 */
+ (NSAttributedString *)attributeStringWithPrefixString:(NSString *)prefixString
                                           suffixString:(NSString *)suffixString;


/**
 *  直接返回NSAttributedString
 *
 *  @param prefixString 前面的string
 *  @param prefixFont   字体大小
 *  @param prefixColor  字体颜色
 *  @param suffixString 后面拼接的string
 *  @param suffixFont   字体大小
 *  @param suffixColor  字体颜色
 *
 *  @return 直接返回NSAttributedString
 */
+ (NSAttributedString *)attributeStringWithPrefixString:(NSString *)prefixString
                                             prefixFont:(CGFloat)prefixFont
                                            prefixColor:(UInt32)prefixColor
                                           suffixString:(NSString *)suffixString
                                             suffixFont:(CGFloat)suffixFont
                                            suffixColor:(UInt32)suffixColor;

/**
 *  string在前 图片在后
 *
 *  @param prefixString     prefixString description
 *  @param subffixImageName subffixImageName description
 *
 *  @return return value description
 */
+ (NSMutableAttributedString *)attributeStringWithPrefixString:(NSString *)prefixString
                                              subffixImageName:(NSString *)subffixImageName;


/**
 *  图片在前 string在后
 *
 *  @param subffixString   subffixString description
 *  @param prefixImageName prefixImageName description
 *
 *  @return return value description
 */
+ (NSMutableAttributedString *)attributeStringWithSubffixString:(NSString *)subffixString
                                                prefixImageName:(NSString *)prefixImageName;

/**
 *  <#Description#>
 *
 *  @param subffixString <#subffixString description#>
 *  @param image         <#image description#>
 *  @param rect          <#rect description#>
 *
 *  @return <#return value description#>
 */
+ (NSMutableAttributedString *)attributeStringWithSubffixString:(NSString *)subffixString
                                                    prefixImage:(UIImage *)image
                                                      imageRect:(CGRect)rect;
@end
