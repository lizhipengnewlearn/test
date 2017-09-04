

//
//  CustomActionButton.m
//  partTimeJob
//
//  Created by mac on 17/8/18.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "CustomActionButton.h"

@implementation CustomActionButton

- (CustomActionButton *)initWithFrame:(CGRect)frame andImageName:(NSString *)imageName andTitle:(NSString *)titleString
{
    self=[super initWithFrame:frame];
    if(self)
    {
        self.ima=[[UIImageView alloc]initWithFrame:CGRectMake((frame.size.width-35)/2, 15, 35, 35)];
        self.ima.image=[UIImage imageNamed:imageName];
        [self addSubview:self.ima];
        self.titLabel=[[CustomLabel alloc]initWithFrame:CGRectMake(0, self.ima.frame.size.height+self.ima.frame.origin.y+8, frame.size.width, 12)andSize:11 andTextColor:THEMEBLACKCOLOR];
        self.titLabel.textAlignment=NSTextAlignmentCenter;
        self.titLabel.text=titleString;
        [self addSubview:self.titLabel];
    }
    return self;
}

@end
