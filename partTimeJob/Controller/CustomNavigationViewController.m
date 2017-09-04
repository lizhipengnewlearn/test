
//
//  CustomNavigationViewController.m
//  partTimeJob
//
//  Created by mac on 17/8/16.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "CustomNavigationViewController.h"

@interface CustomNavigationViewController ()

@end

@implementation CustomNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.edgesForExtendedLayout=UIRectEdgeNone;
    self.navigationBar.translucent=NO;
    self.navigationBar.barTintColor=COLOR(249, 249, 249);
    self.navigationBar.shadowImage=[[UIImage alloc]init];
    [self.navigationBar setBackgroundImage:[[UIImage alloc]init] forBarMetrics:UIBarMetricsDefault];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
