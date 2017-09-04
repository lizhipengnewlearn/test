//
//  CustomHomeCell.h
//  partTimeJob
//
//  Created by mac on 17/8/8.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomLabel.h"
#import "Loan.h"
@interface CustomHomeCell : UITableViewCell
@property (nonatomic, strong)UIImageView *logoImageView;//logo图片
@property (nonatomic, strong)CustomLabel *loanNameLabel;//贷款公司的名称
@property (nonatomic, strong)CustomLabel *successPersentLabel;
@property (nonatomic, strong)UIImageView *startImageView;
@property (nonatomic, strong)CustomLabel *descriptionLabel;//描述
@property (nonatomic, strong)UIImageView *bottomImageView;//底部的阴影图片
@property (nonatomic, strong)CustomLabel *lendindCountLabel;//已放款人数
@property (nonatomic, strong)CustomLabel *repayMoneyLabel;//月还款数
@property (nonatomic,strong)UIView *starView;

- (void)setContentWithModel:(Loan*)loanModel;
@end
