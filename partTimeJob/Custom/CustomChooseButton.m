//
//  CustomChooseButton.m
//  partTimeJob
//
//  Created by mac on 17/8/19.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "CustomChooseButton.h"

@implementation CustomChooseButton


- (CustomChooseButton *)initWithFrame:(CGRect)frame{
    
    self=[super initWithFrame:frame];
    if(self)
    {

        self.titLabel=[[CustomLabel alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height) andSize:13 andTextColor:SUBTITLECOLOR];
        self.titLabel.text=@"请选择";
        [self addSubview:self.titLabel];
        self.img=[[UIImageView alloc]initWithFrame:CGRectMake(frame.size.width-13, (frame.size.height-8)/2, 13, 8)];
        self.img.image=[UIImage imageNamed:@"下拉箭头"];
        [self addSubview:self.img];
    }
    return self;
}
@end
