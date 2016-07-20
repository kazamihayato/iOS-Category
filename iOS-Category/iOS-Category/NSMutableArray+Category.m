//
//  NSMutableArray+Category.m
//  PKWSevers
//
//  Created by peikua on 16/5/25.
//  Copyright © 2016年 peikua. All rights reserved.
//

#import "NSMutableArray+Category.h"

@implementation NSMutableArray (Category)

-(void)addNoNilObject:(id)object
{
    if (object == nil) {
        return;
    }
    [self addObject:object];
}

@end
