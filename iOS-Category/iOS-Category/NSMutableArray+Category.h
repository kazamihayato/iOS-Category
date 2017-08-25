//
//  NSMutableArray+Category.h
//  PKWSevers
//
//  Created by peikua on 16/5/25.
//  Copyright © 2016年 peikua. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (Category)

//建议每次对Array操作时都用以下方法，提高健壮性
- (void)safeAddObject:(id)object;

- (void)safeInsertObject:(id)object atIndex:(NSUInteger)index;

- (void)safeInsertObjects:(NSArray *)objects atIndexes:(NSIndexSet *)indexs;

- (void)safeRemoveObjectAtIndex:(NSUInteger)index;

- (void)safeRemoveObjectsInRange:(NSRange)range;

@end
