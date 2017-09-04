//
//  CustomLabel.m
//  partTimeJob
//
//  Created by mac on 17/8/9.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "CustomLabel.h"

@implementation CustomLabel


- (CustomLabel *)initWithFrame:(CGRect)frame andSize:(float)size andTextColor:(UIColor *)textColor{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.font = [UIFont systemFontOfSize:size];
        self.textColor = textColor;
    }
    return self;

    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
