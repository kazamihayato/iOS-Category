//
//  NSObject+PerformBlock.m
//  iOS-Category
//
//  Created by 庄BB的MacBook on 2017/8/23.
//  Copyright © 2017年 BBFC. All rights reserved.
//

#import "NSObject+PerformBlock.h"

@implementation NSObject (PerformBlock)
+ (NSException *)tryCatch:(void (^)())block
{
    NSException *result = nil;
    
    @try
    {
        block();
    }
    @catch (NSException *e)
    {
        result = e;
    }
    
    return result;
}

+ (NSException *)tryCatch:(void (^)())block finally:(void(^)())aFinisheBlock
{
    NSException *result = nil;
    
    @try
    {
        block();
    }
    @catch (NSException *e)
    {
        result = e;
    }
    @finally
    {
        aFinisheBlock();
    }
    
    return result;
}

+ (void)performInMainThreadBlock:(void(^)())aInMainBlock
{
    dispatch_async(dispatch_get_main_queue(), ^{
        
        aInMainBlock();
        
    });
}

+ (void)performInThreadBlock:(void(^)())aInThreadBlock
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        aInThreadBlock();
        
    });
}

+ (void)performInMainThreadBlock:(void(^)())aInMainBlock afterSecond:(NSTimeInterval)delay
{
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t) (delay * NSEC_PER_SEC));
    
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        
        aInMainBlock();
        
    });
}

+ (void)performInThreadBlock:(void(^)())aInThreadBlock afterSecond:(NSTimeInterval)delay
{
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t) (delay * NSEC_PER_SEC));
    
    dispatch_after(popTime, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void){
        
        aInThreadBlock();
        
    });
}

@end
