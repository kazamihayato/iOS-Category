//
//  NSString+Safe.m
//  iOS-Category
//
//  Created by 庄BB的MacBook on 2017/8/24.
//  Copyright © 2017年 BBFC. All rights reserved.
//

#import "NSString+Safe.h"

@implementation NSString (Safe)
+ (instancetype)noNULLStringWithFormat:(NSString *)format, ... NS_FORMAT_FUNCTION(1, 2) {
    va_list arglist;
    va_start(arglist, format);
    NSString *outStr = [[NSString alloc] initWithFormat:format arguments:arglist];
    va_end(arglist);

    if ([outStr containsString:@"(null)"])
        return [outStr stringByReplacingOccurrencesOfString:@"(null)" withString:@""];
    return outStr;
}


- (NSString *)safeSubstringFromIndex:(NSUInteger)from
{
    if (from > self.length) {
        return nil;
    } else {
        return [self substringFromIndex:from];
    }
}

- (NSString *)safeSubstringToIndex:(NSUInteger)to
{
    if (to > self.length) {
        return nil;
    } else {
        return [self substringToIndex:to];
    }
}

- (NSString *)safeSubstringWithRange:(NSRange)range
{
    NSUInteger location = range.location;
    NSUInteger length = range.length;
    if (location+length > self.length) {
        return nil;
    } else {
        return [self substringWithRange:range];
    }
}

- (NSRange)safeRangeOfString:(NSString *)aString
{
    if (aString == nil) {
        return NSMakeRange(NSNotFound, 0);
    } else {
        return [self rangeOfString:aString];
    }
}

- (NSRange)safeRangeOfString:(NSString *)aString options:(NSStringCompareOptions)mask
{
    if (aString == nil) {
        return NSMakeRange(NSNotFound, 0);
    } else {
        return [self rangeOfString:aString options:mask];
    }
}

- (NSString *)safeStringByAppendingString:(NSString *)aString
{
    if (aString == nil) {
        return [self stringByAppendingString:@""];
    } else {
        return [self stringByAppendingString:aString];
    }
}

- (NSString *)safeStringByReplacingCharactersInRange:(NSRange)aRange withString:(NSString *)aString
{
    if (aString == nil || ![aString isKindOfClass:[NSString class]]) {
        return self;
    }
    return [self safeStringByReplacingCharactersInRange:aRange withString:aString];
}

@end
