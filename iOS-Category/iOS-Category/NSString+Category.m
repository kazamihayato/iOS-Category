//
//  PK-ios
//
//  Created by peikua on 15/9/15.
//  Copyright (c) 2015年 peikua. All rights reserved.
//

#import "NSString+Category.h"

@implementation NSString (Category)

+ (NSString*) getSecrectStringWithPhoneNumber:(NSString*)phoneNum
{
    if (phoneNum.length==11) {
        NSMutableString *newStr = [NSMutableString stringWithString:phoneNum];
        NSRange range = NSMakeRange(3, 7);
        [newStr replaceCharactersInRange:range withString:@"*****"];
        return newStr;
    }
    return nil;
}

+ (NSString*) getSecrectStringWithAccountNo:(NSString*)accountNo
{
    NSMutableString *newStr = [NSMutableString stringWithString:accountNo];
    NSRange range = NSMakeRange(4, 8);
    if (newStr.length>12) {
        [newStr replaceCharactersInRange:range withString:@" **** **** "];
    }
    return newStr;
}

+ (NSString*) stringMobileFormat:(NSString *)mobile {
    if (mobile.length==11) {
        NSMutableString* value = [[NSMutableString alloc] initWithString:mobile];
        [value insertString:@"-" atIndex:3];
        [value insertString:@"-" atIndex:8];
        return value;
    }
    
    return nil;
}

+ (NSString*) stringChineseFormat:(double)value{
    
    if (value / 100000000 >= 1) {
        return [NSString stringWithFormat:@"%.0f亿",value/100000000];
    }
    else if (value / 10000 >= 1 && value / 100000000 < 1) {
        return [NSString stringWithFormat:@"%.0f万",value/10000];
    }
    else {
        return [NSString stringWithFormat:@"%.0f",value];
    }
}

+(NSString *)countNumAndChangeformat:(NSString *)num
{
    NSNumberFormatter *moneyFormatter = [[NSNumberFormatter alloc] init];
    moneyFormatter.positiveFormat = @"###,###";
    //如要增加小数点请自行修改为@"###,###,##"
    return [moneyFormatter stringFromNumber:[num toNumber]];
}

-(CGFloat)heightWithFontSize:(CGFloat)fontSize width:(CGFloat)width
{
    NSDictionary *attrs = @{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]};
    return  [self boundingRectWithSize:CGSizeMake(width, 0) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attrs context:nil].size.height;
}

- (CGFloat) widthWithFontSize:(CGFloat)fontSize height:(CGFloat)maxHeight
{
    NSDictionary *attrs = @{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]};
    return  [self boundingRectWithSize:CGSizeMake(0, maxHeight) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attrs context:nil].size.width;
}

- (NSNumber*)toNumber
{
    NSNumberFormatter *formatter=[[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    NSNumber *number=[formatter numberFromString:self];
    return number;
}

/*抹除运费小数末尾的0*/
- (NSString *)removeUnwantedZero {
    if ([[self substringWithRange:NSMakeRange(self.length- 3, 3)] isEqualToString:@"000"]) {
        return [self substringWithRange:NSMakeRange(0, self.length-4)]; // 多一个小数点
    } else if ([[self substringWithRange:NSMakeRange(self.length- 2, 2)] isEqualToString:@"00"]) {
        return [self substringWithRange:NSMakeRange(0, self.length-2)];
    } else if ([[self substringWithRange:NSMakeRange(self.length- 1, 1)] isEqualToString:@"0"]) {
        return [self substringWithRange:NSMakeRange(0, self.length-1)];
    } else {
        return self;
    }
}

//去掉前后空格
- (NSString *)trimmedString{
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet decimalDigitCharacterSet]];
}


@end







