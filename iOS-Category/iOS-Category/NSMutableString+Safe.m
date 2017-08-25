//
//  NSMutableString+Safe.m
//  iOS-Category
//
//  Created by 庄BB的MacBook on 2017/8/24.
//  Copyright © 2017年 BBFC. All rights reserved.
//

#import "NSMutableString+Safe.h"

@implementation NSMutableString (Safe)
- (void)safeInsertString:(NSString *)aString atIndex:(NSUInteger)loc
{
    if (aString == nil) {
        return;
    } else if (loc > self.length) {
        return;
    } else {
        [self insertString:aString atIndex:loc];
    }
}

- (void)safeAppendString:(NSString *)aString
{
    if (aString == nil) {
        return;
    } else {
        [self appendString:aString];
    }
}

- (void)safeSetString:(NSString *)aString
{
    if (aString == nil) {
        return;
    } else {
        [self setString:aString];
    }
}

- (NSUInteger)safeReplaceOccurrencesOfString:(NSString *)target withString:(NSString *)replacement options:(NSStringCompareOptions)options range:(NSRange)searchRange
{
    NSUInteger location = searchRange.location;
    NSUInteger length = searchRange.length;
    
    if (target == nil || replacement == nil) {
        return 0;
    } else if (location + length > self.length) {
        return 0;
    } else {
        return [self replaceOccurrencesOfString:target withString:replacement options:options range:searchRange];
    }
}

@end
