
//
//  CustomShadowView.m
//  partTimeJob
//
//  Created by mac on 17/8/11.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "CustomShadowView.h"

@implementation CustomShadowView

- (instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame: frame];
    if(self)
    {
        self.backgroundColor=[UIColor whiteColor];
        self.layer.shadowColor = COLOR(253, 249, 204).CGColor;
        self.layer.shadowOpacity = 1.0f;
        self.layer.shadowRadius = 4.f;
        self.layer.shadowOffset = CGSizeMake(0,0);
        
        self.moneyLabel=[[CustomLabel alloc]initWithFrame:CGRectMake(3, 15, self.frame.size.width-6, 17) andSize:17 andTextColor:COLOR(51, 51, 51)];
        self.moneyLabel.textAlignment=NSTextAlignmentCenter;
        [self addSubview:self.moneyLabel];
        self.monthLabel=[[CustomLabel alloc]initWithFrame:CGRectMake(3, self.frame.size.height-11-17-30+self.moneyLabel.frame.size.height+self.moneyLabel.frame.origin.y, self.moneyLabel.frame.size.width, 12) andSize:11 andTextColor:COLOR(102, 102, 102)];
        self.monthLabel.textAlignment=NSTextAlignmentCenter;
        [self addSubview:self.monthLabel];

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
