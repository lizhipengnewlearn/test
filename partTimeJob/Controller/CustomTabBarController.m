//
//  CustomTabBarController.m
//  partTimeJob
//
//  Created by mac on 17/8/8.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "CustomTabBarController.h"
#import "CustomNavigationViewController.h"
#import "LoginViewController.h"
@interface CustomTabBarController ()

@end

@implementation CustomTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self viewControllerInit];
    self.edgesForExtendedLayout=UIRectEdgeNone;
}
#pragma mark 主页面
- (HomeViewController *)homeView{

    if(_homeView==nil)
    {
        _homeView=[[HomeViewController alloc]init];
    }
    return _homeView;
}

#pragma mark 贷款
- (LoanViewController *)loanView{
    
    if(_loanView==nil)
    {
        _loanView=[[LoanViewController alloc]init];
    }
    return _loanView;
}

#pragma 我的页面
- (MyViewController *)myView{

    if(_myView==nil)
    {

        _myView=[[MyViewController alloc]init];
    }
        return _myView;
}


- (void)viewControllerInit{

    UIViewController *pageOne=[self makeRootByNavigationController:self.homeView];
    UIViewController *pageTwo=[self makeRootByNavigationController:self.loanView];
    UIViewController *pageThird=[self makeRootByNavigationController:self.myView];
    self.viewControllers=@[pageOne,pageTwo,pageThird];

    UITabBar *tabBar=self.tabBar;
    UITabBarItem *tabBarItem1=[tabBar.items objectAtIndex:0];
    UITabBarItem *tabBarItem2=[tabBar.items objectAtIndex:1];
    UITabBarItem *tabBarItem3=[tabBar.items objectAtIndex:2];
    tabBarItem1.title=@"首页";
    tabBarItem1.image=[[UIImage imageNamed:@"首页未选择"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    tabBarItem1.selectedImage=[[UIImage imageNamed:@"首页已选择"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];

    tabBarItem2.title=@"贷款";
    tabBarItem2.image=[[UIImage imageNamed:@"贷款未选择"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    tabBarItem2.selectedImage=[[UIImage imageNamed:@"贷款已选择"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];

    tabBarItem3.title=@"我的";
    tabBarItem3.image=[[UIImage imageNamed:@"我的未选择"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    tabBarItem3.selectedImage=[[UIImage imageNamed:@"我的已选择"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];

}

- (CustomNavigationViewController*)makeRootByNavigationController:(UIViewController*)childVc{
    
    return [[CustomNavigationViewController alloc]initWithRootViewController:childVc];

}
- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{

    if([item.title isEqualToString:@"首页"])
    {
        self.pageNumber=0;
    }
    else if([item.title isEqualToString:@"贷款"])
    {
        self.pageNumber=1;
    }
    else{
        if(![AVUser currentUser])
        {
            LoginViewController *loginView=[[LoginViewController alloc]init];
            loginView.hidesBottomBarWhenPushed=YES;
            [self.navigationController pushViewController:loginView animated:YES];
        }
    }
}

-(void)viewWillAppear:(BOOL)animated
{

    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
    self.selectedIndex=_pageNumber;


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
