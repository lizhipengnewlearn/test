//
//  CustomHomeCell.m
//  partTimeJob
//
//  Created by mac on 17/8/8.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "CustomHomeCell.h"
#import <UIImageView+WebCache.h>
@implementation CustomHomeCell
{
    UIView *backView;
    CustomLabel *tuijianLabel;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self=[super initWithStyle: style reuseIdentifier:reuseIdentifier];
    if(self)
    {
        
        backView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 107)];
        backView.backgroundColor=[UIColor whiteColor];
        [self addSubview:backView];
        //logo图
        self.logoImageView=[[UIImageView alloc]initWithFrame:CGRectMake(16, 21.5, 61, 44)];
        self.logoImageView.backgroundColor=COLOR(232, 232, 232);
        self.logoImageView.image=[UIImage imageNamed:@"logo"];
        [backView addSubview:self.logoImageView];
        //贷款机构名字label
        self.loanNameLabel=[[CustomLabel alloc]initWithFrame:CGRectMake(_logoImageView.frame.size.width+_logoImageView.frame.origin.x+20, self.logoImageView.frame.origin.y, 180, 16) andSize:13 andTextColor:COLOR(51, 51, 51)];
        [backView addSubview:self.loanNameLabel];
        
         tuijianLabel=[[CustomLabel alloc]initWithFrame:CGRectMake(0, 0, 30, 14) andSize:10 andTextColor:COLOR(255, 84, 71)];
        tuijianLabel.text=@"推荐";
        tuijianLabel.textAlignment=NSTextAlignmentCenter;
        tuijianLabel.layer.borderWidth=1;
        tuijianLabel.layer.cornerRadius=2;
        tuijianLabel.layer.borderColor=COLOR(255, 84, 71).CGColor;
        [backView addSubview:tuijianLabel];
        //成功率
        self.successPersentLabel=[[CustomLabel alloc]initWithFrame:CGRectMake(self.loanNameLabel.frame.origin.x, self.loanNameLabel.frame.size.height+self.loanNameLabel.frame.origin.y+15, 40, 13) andSize:13 andTextColor:COLOR(153, 153, 153)];
        self.successPersentLabel.text=@"成功率";
        [backView addSubview:self.successPersentLabel];
        
        UIView *blueLine=[[UIView alloc]initWithFrame:CGRectMake(self.successPersentLabel.frame.origin.x, _successPersentLabel.frame.origin.y+_successPersentLabel.frame.size.height+19, 8, 1.5)];
        blueLine.backgroundColor=THEMEBLUECOLOR;
        [backView addSubview:blueLine];
        
        self.descriptionLabel=[[CustomLabel alloc]initWithFrame:CGRectMake(blueLine.frame.origin.x+blueLine.frame.size.width+5, _successPersentLabel.frame.size.height+_successPersentLabel.frame.origin.y+15, SCREENWIDTH-120, 9) andSize:11 andTextColor:COLOR(153, 153, 153)];
        [backView addSubview:self.descriptionLabel];
        
        UIView *lineView=[[UIView alloc]initWithFrame: CGRectMake(0, 106.5, SCREENWIDTH, 0.5)];
        lineView.backgroundColor=LINECOLOR;
        [backView addSubview:lineView];
        //描述
        
        self.bottomImageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, backView.frame.size.height+self.descriptionLabel.frame.origin.y+12.5, SCREENWIDTH, 10)];
        [self addSubview:self.bottomImageView];
        
        self.lendindCountLabel=[[CustomLabel alloc]initWithFrame:CGRectMake(SCREENWIDTH-116, _loanNameLabel.frame.origin.y, 100, 13) andSize:12 andTextColor:COLOR(51, 51, 51)];
        self.lendindCountLabel.textAlignment=NSTextAlignmentRight;
        [backView addSubview:self.lendindCountLabel];
        
        self.repayMoneyLabel=[[CustomLabel alloc]initWithFrame:CGRectMake(self.lendindCountLabel.frame.origin.x, self.successPersentLabel.frame.origin.y, 100, 13) andSize:12 andTextColor:COLOR(153, 153, 153)];
        self.repayMoneyLabel.textAlignment=NSTextAlignmentRight;
        [backView addSubview:self.repayMoneyLabel];
        
    }
    return  self;
}


- (void)setContentWithModel:(Loan*)loanModel
{
    if(loanModel.title)
    {
        self.loanNameLabel.text=loanModel.title;
    }
    CGSize contentSize =[self.loanNameLabel.text sizeWithFont:[UIFont systemFontOfSize:13.0] constrainedToSize:CGSizeMake(180, 16) lineBreakMode:NSLineBreakByWordWrapping];
    self.loanNameLabel.frame=CGRectMake(_logoImageView.frame.size.width+_logoImageView.frame.origin.x+20, self.logoImageView.frame.origin.y, contentSize.width, 16);
    tuijianLabel.frame=CGRectMake(contentSize.width+self.loanNameLabel.frame.origin.x+8, self.loanNameLabel.frame.origin.y+1, 30, 14);
    
    if(loanModel.imageFile.url)
    {
        [self.logoImageView sd_setImageWithURL:[NSURL URLWithString:loanModel.imageFile.url] placeholderImage:nil];
    }

    if(loanModel.repay_money)
    {
        self.repayMoneyLabel.text=[NSString stringWithFormat:@"月还款%@元",loanModel.repay_money];
    }
    if(loanModel.lending_count)
    {
        self.lendindCountLabel.text=[NSString stringWithFormat:@"%@人已放款",loanModel.lending_count];
    }
    
    if(loanModel.describe)
    {
        self.descriptionLabel.text=loanModel.describe;
    }
    
    [self.starView removeFromSuperview];
    self.starView=[[UIView alloc]initWithFrame:CGRectMake(_successPersentLabel.frame.origin.x+_successPersentLabel.frame.size.width+7, self.successPersentLabel.frame.origin.y, 100, 20)];
    [backView addSubview:self.starView];

    if(loanModel.success_rate)
    {
        NSInteger  rate=loanModel.success_rate.integerValue;
        
        for(int i=0; i<rate; i++)
        {
            UIImageView *starImageView=[[UIImageView alloc]initWithFrame:CGRectMake(i*(10+3), 1.5, 10, 10)];
            starImageView.image=[UIImage imageNamed:@"star"];
            [self.starView addSubview:starImageView];
        }
    }
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end
