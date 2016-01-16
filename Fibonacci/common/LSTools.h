//
//  LSTools.h
//  Fibonacci
//
//  Created by simdm on 1/16/16.
//  Copyright © 2016 alushu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface LSTools : NSObject

+ (UILabel*)getLabelFrame:(CGRect)rect
                     text:(NSString*)text
                     font:(UIFont*)font
                textColor:(UIColor*)color
            textAlignment:(NSTextAlignment)textAlignment;

+ (float)setLabelAttributed:(UILabel*)label
                LineSpacing:(float)height
                 constraint:(CGSize)constraint
                       font:(UIFont*)font text:(NSString*)text;

@end
