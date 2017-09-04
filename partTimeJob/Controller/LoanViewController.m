

//
//  LoanViewController.m
//  partTimeJob
//
//  Created by mac on 17/8/16.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "LoanViewController.h"
#import "DZNSegmentedControl.h"
#import "CustomLabel.h"
#import "ComplexTableViewController.h"
#import "LoanViewController.h"
#import "HighPassingTableViewController.h"
#import "LowerInterestTableViewController.h"
#import "QuicklyTableViewController.h"
#import "WebViewController.h"
@interface LoanViewController ()<UIScrollViewDelegate,DZNSegmentedControlDelegate,ComplexDelegate,HighPassDelegate,LowerDelegate,QuicklyDelegate>
{
    UIScrollView *mainScrollView;
    DZNSegmentedControl*_segmentControl;
    ComplexTableViewController *comPlexTableView;
    HighPassingTableViewController *highPassTableView;
    QuicklyTableViewController *quickTableView;
    LowerInterestTableViewController *lowerTableView;

}

@end

@implementation LoanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self swithInit];
    [self creatUI];

}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden=NO;
}

-(void)swithInit{
    
    [[DZNSegmentedControl appearance]setFont:[UIFont systemFontOfSize:13]];
    [[DZNSegmentedControl appearance]setSelectionIndicatorHeight:2];
    [[DZNSegmentedControl appearance] setAnimationDuration:0.5];
    _segmentControl=[[DZNSegmentedControl alloc]initWithItems:@[@"综合排序",@"通过率高",@"下款最快",@"利率最低"]];
    _segmentControl.frame=CGRectMake(0, 0, SCREENWIDTH, 47);
    _segmentControl.font=[UIFont systemFontOfSize:13];
    _segmentControl.backgroundColor=COLOR(249, 249, 249);
    _segmentControl.delegate=self;
    _segmentControl.bouncySelectionIndicator=NO;
    [_segmentControl setTitleColor:THEMEBLUECOLOR forState:UIControlStateSelected];
    [_segmentControl setTitleColor:SUBTITLECOLOR forState:UIControlStateNormal];
    [_segmentControl addTarget:self action:@selector(selectedSegmentIndex:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:_segmentControl];
    
    UIView *lineView=[[UIView alloc]initWithFrame:CGRectMake(0, 47, SCREENWIDTH, 0.5)];
    lineView.backgroundColor=LINECOLOR;
    [self.view addSubview:lineView];
}

- (void)pushWebView:(Loan *)loanModel{
    WebViewController *webView=[[WebViewController alloc]init];
    webView.titleName=loanModel.title;
    webView.url=loanModel.gourl_ios;
    webView.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:webView animated:YES];
}
- (UIBarPosition)positionForBar:(id <UIBarPositioning>)view
{
    return UIBarPositionBottom;
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    CGPoint curPoint=mainScrollView.contentOffset;
    _segmentControl.selectedSegmentIndex=curPoint.x/mainScrollView.frame.size.width;
    
}


-(void)selectedSegmentIndex:(DZNSegmentedControl*)segmentControl{
    

    if(segmentControl.selectedSegmentIndex==0)
    {
        mainScrollView.contentOffset=CGPointMake(0, 0);

    }
    else if(segmentControl.selectedSegmentIndex==1)
    {
        mainScrollView.contentOffset=CGPointMake(SCREENWIDTH, 0);

    }
    else if(segmentControl.selectedSegmentIndex==2)
    {
        mainScrollView.contentOffset=CGPointMake(SCREENWIDTH*2, 0);

    }
    else if(segmentControl.selectedSegmentIndex==3)
    {
        mainScrollView.contentOffset=CGPointMake(SCREENWIDTH*3, 0);
        
    }

}
- (void)creatUI{
    
    self.view.backgroundColor=[UIColor whiteColor];
    CustomLabel *titleLabel=[[CustomLabel alloc]initWithFrame:CGRectMake(0, 0, 60, 40) andSize:14 andTextColor:THEMEBLACKCOLOR];
    titleLabel.textAlignment=NSTextAlignmentCenter;
    titleLabel.text=@"贷款";
    self.navigationItem.titleView=titleLabel;
    if(self.isFromHome==YES)
    {
        mainScrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 47, SCREENWIDTH, SCREENHEIGHT-64-47)];
        mainScrollView.contentSize=CGSizeMake(SCREENWIDTH*4, SCREENHEIGHT-64-47);

    }
    else
    {
        mainScrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 47, SCREENWIDTH, SCREENHEIGHT-64-49-47)];
        mainScrollView.contentSize=CGSizeMake(SCREENWIDTH*4, SCREENHEIGHT-64-47-49);

    }
    mainScrollView.bounces=NO;
    mainScrollView.showsHorizontalScrollIndicator=NO;
    mainScrollView.showsVerticalScrollIndicator=NO;
    mainScrollView.pagingEnabled=YES;
    mainScrollView.delegate=self;
    [self.view addSubview:mainScrollView];
    
    comPlexTableView=[[ComplexTableViewController alloc]init];
    comPlexTableView.view.frame=CGRectMake(0, 0, SCREENWIDTH, mainScrollView.frame.size.height);
    comPlexTableView.delegate=self;
    [mainScrollView addSubview:comPlexTableView.view];
    
    highPassTableView=[[HighPassingTableViewController alloc]init];
    highPassTableView.view.frame=CGRectMake(SCREENWIDTH, 0, SCREENWIDTH, mainScrollView.frame.size.height);
    highPassTableView.delegate=self;
    [mainScrollView addSubview:highPassTableView.view];
    
    quickTableView=[[QuicklyTableViewController alloc]init];
    quickTableView.view.frame=CGRectMake(SCREENWIDTH*2, 0, SCREENWIDTH, mainScrollView.frame.size.height);
    quickTableView.delegate=self;
    [mainScrollView addSubview:quickTableView.view];
    
    lowerTableView=[[LowerInterestTableViewController alloc]init];
    lowerTableView.view.frame=CGRectMake(SCREENWIDTH*3, 0, SCREENWIDTH, mainScrollView.frame.size.height);
    lowerTableView.delegate=self;
    [mainScrollView addSubview:lowerTableView.view];
    
    [comPlexTableView refreshData];
     [highPassTableView refreshData];
    [quickTableView refreshData];
     [lowerTableView refreshData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
