//
//  NSObject+Swizzle.h
//  iOS-Category
//
//  Created by 庄BB的MacBook on 2017/8/23.
//  Copyright © 2017年 BBFC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Swizzle)

+ (BOOL)overrideMethod:(SEL)origSel withMethod:(SEL)altSel;

+ (BOOL)overrideClassMethod:(SEL)origSel withClassMethod:(SEL)altSel;

+ (BOOL)exchangeMethod:(SEL)origSel withMethod:(SEL)altSel;

+ (BOOL)exchangeClassMethod:(SEL)origSel withClassMethod:(SEL)altSel;

@end
