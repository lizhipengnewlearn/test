//
//  CustomActionButton.h
//  partTimeJob
//
//  Created by mac on 17/8/18.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomLabel.h"
@interface CustomActionButton : UIButton
@property (nonatomic,strong)UIImageView *ima;
@property (nonatomic,strong)CustomLabel *titLabel;
- (CustomActionButton*)initWithFrame:(CGRect)frame andImageName:(NSString*)imageName andTitle:(NSString *)titleString;
@end
