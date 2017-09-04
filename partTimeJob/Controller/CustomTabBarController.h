//
//  CustomTabBarController.h
//  partTimeJob
//
//  Created by mac on 17/8/8.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeViewController.h"
#import "LoanViewController.h"
#import "MyViewController.h"
@interface CustomTabBarController : UITabBarController
@property (nonatomic, strong)HomeViewController *homeView;
@property (nonatomic, strong)LoanViewController *loanView;
@property (nonatomic, strong)MyViewController *myView;
@property (nonatomic, assign)int pageNumber;
@end
