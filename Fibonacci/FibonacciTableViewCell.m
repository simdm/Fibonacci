//
//  FibonacciTableViewCell.m
//  Fibonacci
//
//  Created by simdm on 1/16/16.
//  Copyright © 2016 alushu. All rights reserved.
//

#import "FibonacciTableViewCell.h"
#import "LSDefine.h"
#import "LSTools.h"

@implementation FibonacciTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        
        self.fibonacciLabel = [LSTools getLabelFrame:CGRectZero
                                               text:@""
                                               font:[UIFont fontWithName:@"thonburi" size:FONT_SIZE]
                                          textColor:[UIColor blackColor]
                                      textAlignment:NSTextAlignmentLeft];
        self.fibonacciLabel.numberOfLines = 0;
        [self addSubview:self.fibonacciLabel];
        
        underbarView = [UIView new];
        underbarView.backgroundColor = [UIColor grayColor];
        [self addSubview:underbarView];
        
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    float height = 0.0f;
    height += 10.0f;
    
    CGSize constraint = CGSizeMake(Screen.size.width - LEFT_MARGION*2, MAXFLOAT);
    self.fibonacciLabel.frame = CGRectMake(LEFT_MARGION,
                                   height,
                                   constraint.width,
                                   [LSTools setLabelAttributed:self.fibonacciLabel LineSpacing:1.0f constraint:constraint font:[UIFont fontWithName:@"thonburi" size:FONT_SIZE] text:nil]);
    height += self.fibonacciLabel.frame.size.height + 10.0f;
    
    underbarView.frame = CGRectMake(0, height, Screen.size.width, 1.0f);
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
