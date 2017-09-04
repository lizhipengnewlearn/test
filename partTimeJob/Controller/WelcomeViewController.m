//
//  WelcomeViewController.m
//  partTimeJob
//
//  Created by mac on 17/8/16.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "WelcomeViewController.h"

@interface WelcomeViewController ()<UIScrollViewDelegate>

@end

@implementation WelcomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIScrollView *scrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT)];
    scrollView.showsHorizontalScrollIndicator=NO;
    scrollView.pagingEnabled=YES;
    scrollView.delegate=self;
    [self.view addSubview:scrollView];
    for(int i=0;i<3; i++)
    {
        UIImageView *imageView=[[UIImageView alloc]init];
        imageView.frame=CGRectMake(SCREENWIDTH*i, 0, SCREENWIDTH, SCREENHEIGHT);
        imageView.image=[UIImage imageNamed:[NSString stringWithFormat:@"welcome%d",i]];
        imageView.userInteractionEnabled=YES;
        [scrollView addSubview:imageView];
        if(i==2)
        {
            UIButton *button=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT)];
            [imageView addSubview:button];
            [button addTarget:self action:@selector(showHomeClick) forControlEvents:UIControlEventTouchUpInside];
        }
    }
    
    [scrollView setContentSize:CGSizeMake(SCREENWIDTH*3, SCREENHEIGHT)];
}

#pragma mark 进入主页面
- (void)showHomeClick
{
    
    if([self.delegate respondsToSelector:@selector(hideWelcomeController)]){
        [self.delegate hideWelcomeController];
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    if (scrollView.contentOffset.x>SCREENWIDTH*2+20)
    {
        if([self.delegate respondsToSelector:@selector(hideWelcomeController)]){
            [self.delegate hideWelcomeController];
        }
    }
}



@end
