//
//  NSMutableDictionary+Safe.h
//  iOS-Category
//
//  Created by 庄BB的MacBook on 2018/5/18.
//  Copyright © 2018年 BBFC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableDictionary (Safe)

- (void)safeSetObject:(id)aObj forKey:(id<NSCopying>)aKey;

- (id)safeObjectForKey:(id<NSCopying>)aKey;

@end
