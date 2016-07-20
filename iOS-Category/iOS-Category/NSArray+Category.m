//
//  NSArray+Category.m
//  iOS-Category
//
//  Created by 庄BB的MacBook on 16/7/20.
//  Copyright © 2016年 BBFC. All rights reserved.
//

#import "NSArray+Category.h"

@implementation NSArray (Category)
- (NSInteger)integerAtIndex:(NSInteger)index
{
    NSNumber *number = [self objectAt:index];
    return [number intValue];
}

+ (NSArray *)arrayNamed:(NSString *)name
{
    NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:@"plist"];
    return [NSArray arrayWithContentsOfFile:path];
}

- (id)objectAt:(NSUInteger)index {
    if (self && [self isKindOfClass:[NSArray class]] && self.count > index) {
        return [self objectAtIndex:index];
    }
    return nil;
}

- (NSString *)toJSONStringForArray
{
    NSData *paramsJSONData = [NSJSONSerialization dataWithJSONObject:self options:0 error:nil];
    return [[NSString alloc] initWithData:paramsJSONData encoding:NSUTF8StringEncoding];
}
@end
