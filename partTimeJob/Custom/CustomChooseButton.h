//
//  CustomChooseButton.h
//  partTimeJob
//
//  Created by mac on 17/8/19.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomLabel.h"
@interface CustomChooseButton : UIButton

- (CustomChooseButton *)initWithFrame:(CGRect)frame;
@property (nonatomic, strong)UIImageView *img;
@property (nonatomic, strong)CustomLabel *titLabel;
@end
