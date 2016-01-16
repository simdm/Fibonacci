//
//  LSTools.m
//  Fibonacci
//
//  Created by simdm on 1/16/16.
//  Copyright © 2016 alushu. All rights reserved.
//

#import "LSTools.h"

@implementation LSTools

+ (UILabel*)getLabelFrame:(CGRect)rect
                     text:(NSString*)text
                     font:(UIFont*)font
                textColor:(UIColor*)color
            textAlignment:(NSTextAlignment)textAlignment
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
    label.frame = rect;
    label.text = text;
    label.font = font;
    label.textColor = color;
    label.textAlignment = textAlignment;
    return label;
}

+ (float)setLabelAttributed:(UILabel*)label LineSpacing:(float)height constraint:(CGSize)constraint font:(UIFont*)font text:(NSString*)text
{
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
    [paragraphStyle setLineSpacing:height];//调整行间距
    
    //求高度
    NSString *tempText;
    if (label == nil) {
        
        if (text == nil) {
            return 0.0f;
        }
        
        tempText = text;
    }
    else {
        tempText = label.text;
        //行间距
        NSMutableAttributedString *labelAttributedString = [[NSMutableAttributedString alloc] initWithString:label.text];
        [labelAttributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [label.text length])];
        label.attributedText = labelAttributedString;
    }
    
    NSAttributedString *attributedText = [[NSAttributedString alloc]initWithString:tempText attributes: @{NSParagraphStyleAttributeName:paragraphStyle, NSFontAttributeName:font}];
    CGRect rect = [attributedText boundingRectWithSize:constraint
                                               options:NSStringDrawingUsesLineFragmentOrigin
                                               context:nil];
    return ceil(rect.size.height);
}


@end
