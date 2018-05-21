//
//  NSDictionary+Safe.h
//  iOS-Category
//
//  Created by 庄BB的MacBook on 2018/5/18.
//  Copyright © 2018年 BBFC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Safe)

- (id)safeObjectForKey:(NSString *)key;

- (void)safeSetValue:(id)object forKey:(id)key;

- (id)objectForKeyCustom:(id)aKey;

- (id)safeKeyForValue:(id)value;

@end
