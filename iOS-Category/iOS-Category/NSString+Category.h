//
//  PK-ios
//
//  Created by peikua on 15/9/15.
//  Copyright (c) 2015年 peikua. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

@interface NSString (Category)


+ (NSString*) countNumAndChangeformat:(NSString *)num;

//电话号码加*显示
+ (NSString*) getSecrectStringWithPhoneNumber:(NSString*)phoneNum;

//银行卡号加*显示
+ (NSString*) getSecrectStringWithAccountNo:(NSString*)accountNo;

//计算文字高度
- (CGFloat   ) heightWithFontSize:(CGFloat)fontSize width:(CGFloat)width;

/**抹除运费小数末尾的0*/
- (NSString *) removeUnwantedZero;

//去掉前后空格
- (NSString *) trimmedString;

@end


@interface NSString (urlEncode)
- (NSString *)URLEncodedString;
@end


@interface NSString (Base64)
+ (NSString *)base64StringFromData:(NSData *)data length:(NSUInteger)length;
@end


@interface NSString (Format)
+ (NSString*) stringMobileFormat:(NSString*)mobile;
+ (NSString*) stringChineseFormat:(double)value;
@end