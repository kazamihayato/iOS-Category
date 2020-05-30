//
//  NSAttributedString+Category.m
//  PKWSevers
//
//  Created by chenguangjiang on 16/5/23.
//  Copyright © 2016年 peikua. All rights reserved.
//

#import "NSAttributedString+Category.h"
#import <CoreText/CoreText.h>
@implementation NSAttributedString (Category)
+ (NSAttributedString *)attributedWithString:(NSString *)string
                                        font:(UIFont*)font
                                       color:(UIColor *)color{
    return [self attributedWithString:string font:font color:color wordSpacing:0 lineSpacing:0 range:NSMakeRange(0, string.length)];
}

+ (NSAttributedString *)attributedWithString:(NSString *)string
                                        font:(UIFont*)font
                                       color:(UIColor *)color
                                 wordSpacing:(CGFloat)wordSpacing
                                 lineSpacing:(CGFloat)lineSpacing{
    return  [self attributedWithString:string font:font color:color wordSpacing:wordSpacing lineSpacing:lineSpacing range:NSMakeRange(0, string.length)];
}


+ (NSAttributedString *)attributedWithString:(NSString *)string
                                        font:(UIFont*)font
                                       color:(UIColor *)color
                                 wordSpacing:(CGFloat)wordSpacing
                                 lineSpacing:(CGFloat)lineSpacing
                                       range:(NSRange)range{
    if (string==NULL || string.length==0) {
        return [[NSAttributedString alloc] initWithString:@""];
    }
    NSRange getRange = NSIntersectionRange(NSMakeRange(0, string.length), range);
    NSMutableDictionary* muAttbutes = [NSMutableDictionary dictionary];
    if(color){
        [muAttbutes setObject:color forKey:NSForegroundColorAttributeName];
    }
    
    if(font){
        [muAttbutes setObject:font forKey:NSFontAttributeName];
    }
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    
    if (wordSpacing > 0) {
        [muAttbutes setObject:@(wordSpacing) forKey:NSKernAttributeName];
        
    }
    
    if (lineSpacing > 0) {
        [paragraphStyle setLineSpacing:lineSpacing];
        [muAttbutes setObject:paragraphStyle forKey:NSParagraphStyleAttributeName];
        
    }
    
    
    NSDictionary * attributes = [NSDictionary dictionaryWithDictionary:muAttbutes];
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:string];
    [attributedString addAttributes:attributes range:getRange];
    
    return attributedString;
    
}


+ (NSAttributedString*)htmlToAttString:(NSString*)string{
    NSData* data = [string dataUsingEncoding:NSUnicodeStringEncoding];
    NSDictionary* options = @{
        NSDocumentTypeDocumentOption: NSHTMLTextDocumentType
    };
    return [[NSAttributedString alloc]initWithData:data options:options documentAttributes:nil error:nil];
}


- (CGFloat)heightWithContainWidth:(CGFloat)width{
    int total_height = 0;
    CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString((CFAttributedStringRef)self);
    CGRect drawingRect = CGRectMake(0, 0, width, 100000);
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, NULL, drawingRect);
    CTFrameRef textFrame = CTFramesetterCreateFrame(framesetter,CFRangeMake(0,0), path, NULL);
    CGPathRelease(path);
    CFRelease(framesetter);
    
    NSArray *linesArray = (NSArray *) CTFrameGetLines(textFrame);
    if(linesArray.count == 0)return 0;
    CGPoint origins[[linesArray count]];
    CTFrameGetLineOrigins(textFrame, CFRangeMake(0, 0), origins);
    int line_y = (int) origins[[linesArray count] -1].y;
    CGFloat ascent;
    CGFloat descent;
    CGFloat leading;
    CTLineRef line = (__bridge CTLineRef) [linesArray objectAtIndex:[linesArray count]-1];
    CTLineGetTypographicBounds(line, &ascent, &descent, &leading);
    
    total_height = 100000 - line_y + (int) descent +1;
    CFRelease(textFrame);
    return total_height;
}
@end
