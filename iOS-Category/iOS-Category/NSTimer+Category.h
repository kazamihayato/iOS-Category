//
//  NSTimer+Category.h
//  PKWSevers
//
//  Created by chenguangjiang on 16/6/27.
//  Copyright © 2016年 peikua. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (Category)
+ (void)execHelperBlock:(NSTimer *)timer;

+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)seconds block:(void (^)(NSTimer *timer))block repeats:(BOOL)repeats;

+ (NSTimer *)timerWithTimeInterval:(NSTimeInterval)seconds block:(void (^)(NSTimer *timer))block repeats:(BOOL)repeats;
@end
