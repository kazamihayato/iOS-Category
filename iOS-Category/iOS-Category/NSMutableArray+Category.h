//
//  NSMutableArray+Category.h
//  PKWSevers
//
//  Created by peikua on 16/5/25.
//  Copyright © 2016年 peikua. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (Category)
//以下写法均防止闪退
- (void)safeAddObject:(id)object;

- (void)safeInsertObject:(id)object atIndex:(NSUInteger)index;

- (void)safeInsertObjects:(NSArray *)objects atIndexes:(NSIndexSet *)indexs;

- (void)safeRemoveObjectAtIndex:(NSUInteger)index;

- (void)safeRemoveObjectsInRange:(NSRange)range;

@end
