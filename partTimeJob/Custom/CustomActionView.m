

//
//  CustomActionView.m
//  partTimeJob
//
//  Created by mac on 17/8/18.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "CustomActionView.h"
#import "CustomActionButton.h"

@implementation CustomActionView

- (instancetype)initWithFrame:(CGRect)frame{
    
    self=[super initWithFrame:frame];
    if(self)
    {
        NSArray *array=@[@"小额极速贷",@"不查征信",@"身份证能借",@"3分钟下款"];
        for(int i=0;i<4; i++)
        {
            CustomActionButton *button=[[CustomActionButton alloc]initWithFrame:CGRectMake(25+((SCREENWIDTH-50-70*4)/3+70)*i, 0, 70, 88)andImageName:array[i] andTitle:array[i]];
            button.tag=i;
            [button addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:button];
        }
    }
    return self;
}

-(void)btnClick:(UIButton*)button{
    if(self.buttonTag)
    {
        self.buttonTag(button.tag);
    }

}
- (void)actionWithBlock:(buttonActionBlock)block{
    if(block)
    {
        self.buttonTag=block;
    }
}

@end
