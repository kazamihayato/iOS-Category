//
//  NSString+Safe.h
//  iOS-Category
//
//  Created by 庄BB的MacBook on 2017/8/24.
//  Copyright © 2017年 BBFC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Safe)
//避免Format所得的字符串带有null
+ (instancetype)noNULLStringWithFormat:(NSString *)format, ... NS_FORMAT_FUNCTION(1,2);

- (NSString *)safeSubstringFromIndex:(NSUInteger)from;

- (NSString *)safeSubstringToIndex:(NSUInteger)to;

- (NSString *)safeSubstringWithRange:(NSRange)range;

- (NSRange)safeRangeOfString:(NSString *)aString;

- (NSRange)safeRangeOfString:(NSString *)aString options:(NSStringCompareOptions)mask;

- (NSString *)safeStringByAppendingString:(NSString *)aString;

- (NSString *)safeStringByReplacingCharactersInRange:(NSRange)aRange withString:(NSString *)aString;
@end
