//
//  NSArray+Category.h
//  iOS-Category
//
//  Created by 庄BB的MacBook on 16/7/20.
//  Copyright © 2016年 BBFC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (Category)

- (NSInteger)integerAtIndex:(NSInteger)index;//取数值数组中的Integer

+ (NSArray *)arrayNamed:(NSString *)name;    //通过Plist名取到Plist文件中的数组

- (id)objectAt:(NSUInteger)index;            //防止下标数字越界而产生闪退


/**
 *  数组转成json 字符串
 *
 *  @return
 */

- (NSString *)toJSONStringForArray;
@end
