//
//  NSDate+Category.m
//  iOS-Category
//
//  Created by zhuangbb on 2020/5/30.
//  Copyright © 2020 BBFC. All rights reserved.
//

#import "NSDate+Category.h"

@implementation NSDate (Category)
//内部方法、也可以自己暴露
+ (NSDateFormatter *)setDateFormatter:(NSString *)formatter {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:formatter];
    //这条很重要，不加的话。手机设置选择外国可能就会返回中文
    [dateFormatter setLocale:[NSLocale currentLocale]];
    return dateFormatter;
}

+ (NSDateComponents *)components:(NSDate *)date {
    NSDateFormatter *dateFormatter = [[self class] setDateFormatter:@"yyyy-MM-dd"];
    NSString *dateString = [NSDate timeIntervalToString:date.timeIntervalSince1970 dateFormatter:dateFormatter.dateFormat];
    NSDate *startDate = [dateFormatter dateFromString:dateString];
    NSDateComponents *components = [[NSCalendar currentCalendar] components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond | kCFCalendarUnitWeekday | kCFCalendarUnitWeekdayOrdinal) fromDate:startDate];
    
    return components;
}
#pragma mark - 返回NSString部分
+ (NSString *)dateToString:(NSDate *)date dateFormatter:(NSString *)formatter {
    NSDateFormatter *dateFormatter = [[self class] setDateFormatter:formatter];
    NSString *dateString = [dateFormatter stringFromDate:date];
    return dateString;
}

+ (NSString *)timeIntervalToString:(NSTimeInterval)timeInterval dateFormatter:(NSString *)formatter {
    NSDateFormatter *dateFormatter = [[self class] setDateFormatter:formatter];
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timeInterval];
    NSString *dateString = [dateFormatter stringFromDate:date];
    return dateString;
}
#pragma mark - 返回NSDate部分

+ (NSDate *)dateWithDateString:(NSString *)dateString formatString:(NSString *)format {
    NSDateFormatter *dateFormatter = [[self class] setDateFormatter:format];
    NSDate *date = [dateFormatter dateFromString:dateString];
    return date;
}

+ (NSDate *)dateWithPresentDate:(NSDate*)presentDate year:(NSInteger)year month:(NSInteger)month day:(NSInteger)day{
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];

    NSDateComponents *adcomps = [[NSDateComponents alloc] init];

    [adcomps setYear:year];

    [adcomps setMonth:month];

    [adcomps setDay:day];

    return [calendar dateByAddingComponents:adcomps toDate:presentDate options:0];
}

+ (NSDate *)dateWithYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day{
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSDateComponents *adcomps = [[NSDateComponents alloc] init];

    [adcomps setYear:year];

    [adcomps setMonth:month];

    [adcomps setDay:day];
    
    return [calendar dateFromComponents:adcomps];
}
#pragma mark - 返回整型部分

+ (NSInteger)daysBetweenStartDate:(NSDate *)startDate endDate:(NSDate *)endDate {
    NSDateComponents *startComponents = [NSDate components:startDate];
    NSDateComponents *endComponents = [NSDate components:endDate];
    
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitDay fromDateComponents:startComponents toDateComponents:endComponents options:nil];
    
    return components.day;
}

// 获取当前月共有多少天
+ (NSInteger)totaldaysInMonth:(NSDate *)date {
    NSRange daysInLastMonth = [[NSCalendar currentCalendar] rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:date];
    
    return daysInLastMonth.length;
}

// 日期判断

+ (BOOL)isCurrentDay:(NSDate *)date {
    BOOL result = NO;
    
    NSString *dateString = [NSDate dateToString:date dateFormatter:@"yyyy-MM-dd"];
    NSString *nowString = [NSDate dateToString:[NSDate date] dateFormatter:@"yyyy-MM-dd"];
    
    if ([dateString isEqualToString:nowString]) {
        result = YES;
    }
    
    return result;
}


@end
