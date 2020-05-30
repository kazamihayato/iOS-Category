//
//  NSDate+Category.h
//  iOS-Category
//
//  Created by zhuangbb on 2020/5/30.
//  Copyright © 2020 BBFC. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDate (Category)
#pragma mark - 返回NSString部分

/// NSDate转格式显示
/// @param date 例如：[NSDate date]
/// @param formatter @"yyyy-MM-dd"
+ (NSString *)dateToString:(NSDate *)date dateFormatter:(NSString *)formatter;

/// 时间戳转格式显示
/// @param timeInterval
/// @param formatter @"yyyy-MM-dd"
+ (NSString *)timeIntervalToString:(NSTimeInterval)timeInterval dateFormatter:(NSString *)formatter;

#pragma mark - 返回NSDate部分

/// 根据显示时间的字符串返回NSDate
/// @param timeString 例如：1980-01-01
/// @param format @"yyyy-MM-dd"
+ (NSDate *)dateWithDateString:(NSString *)timeString formatString:(NSString *)format;

/// 在已有NSDate的情况下，加减具体数字的年月日，获取未来或者过去的NSDate
/// @param presentDate
/// @param year 小于0为过去，大于0则为未来
/// @param month
/// @param day
+ (NSDate *)dateWithPresentDate:(NSDate*)presentDate year:(NSInteger)year month:(NSInteger)month day:(NSInteger)day;

/// 根据具体的年月日获取NSDate
/// @param year
/// @param month
/// @param day
+ (NSDate *)dateWithYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day;

#pragma mark - 返回整型部分
/// 根据前后NSDate，获取中间差了多少天
/// @param startDate 开始时间
/// @param endDate 结束时间
+ (NSInteger)daysBetweenStartDate:(NSDate *)startDate endDate:(NSDate *)endDate;

/// 获取传入Date对应的月份有多少天
/// @param date
+ (NSInteger)totaldaysInMonth:(NSDate *)date;

// 是否和当前同一天
+ (BOOL)isCurrentDay:(NSDate *)date;
@end

NS_ASSUME_NONNULL_END
