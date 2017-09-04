
//
//  HomeViewController.m
//  partTimeJob
//
//  Created by mac on 17/8/8.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "HomeViewController.h"
#import "CustomHomeCell.h"
#import "LoginViewController.h"
#import "MBProgressHUD+Add.h"
#import "Loan.h"
#import "WebViewController.h"
#import "SDCycleScrollView.h"
#import "Banner.h"
#import "Jobs.h"
#import "CustomActionView.h"
#import "LoanViewController.h"
#import <MJRefresh/MJRefresh.h>
@interface HomeViewController ()<UITableViewDelegate,UITableViewDataSource,SDCycleScrollViewDelegate>
{
    UITableView *_tableView;
    NSMutableArray *_dataArray;
    SDCycleScrollView *_cycleScrollView;
    NSMutableArray *_bannerArray;
    UITableView *_jobTableView;

}
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout=UIRectEdgeNone;
    self.navigationController.navigationBar.hidden=YES;
    [self creatLoanTableView];
}
- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden=YES;
}
#pragma 刷新登录状态

#pragma mark 创建一个tableView
- (void)creatLoanTableView{
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT-49) style:UITableViewStylePlain];
    _dataArray=[[NSMutableArray alloc]init];
    _bannerArray=[[NSMutableArray alloc]init];
    _tableView.mj_header= [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(refreshData)];
    _tableView.backgroundColor=[UIColor whiteColor];
    _tableView.separatorStyle=NO;
    _tableView.delegate=self;
    _tableView.tableFooterView=[[UIView alloc]init];
    _tableView.dataSource=self;
    [self.view addSubview:_tableView];
    [_tableView.mj_header beginRefreshing];

}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{

    if (section==0)
    {
        NSMutableArray *urlArray=[[NSMutableArray alloc]init];
        for(Banner *bannerModel in _bannerArray)
        {
            [urlArray addObject:bannerModel.imageFile.url];
        }
        if(urlArray.count>0)
        {
            
            UIView *headView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 209+88)];
            _cycleScrollView =[[SDCycleScrollView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 209)];
            _cycleScrollView.imageURLStringsGroup = urlArray;
            _cycleScrollView.backgroundColor=[UIColor whiteColor];
            _cycleScrollView.pageControlStyle = SDCycleScrollViewPageContolStyleClassic;
            _cycleScrollView.delegate=self;
            _cycleScrollView.scrollDirection = UICollectionViewScrollDirectionHorizontal;
            [_cycleScrollView setExclusiveTouch:YES];
            
            [headView addSubview:_cycleScrollView];
            
            CustomActionView *customView=[[CustomActionView alloc]initWithFrame:CGRectMake(0, _cycleScrollView.frame.origin.y+_cycleScrollView.frame.size.height, SCREENWIDTH, 88)];
            
            [customView actionWithBlock:^(NSInteger tag) {
                if(tag==0)
                {
                    LoanViewController *loanview=[[LoanViewController alloc]init];
                    loanview.isFromHome=YES;
                    loanview.hidesBottomBarWhenPushed=YES;
                    [self.navigationController pushViewController:loanview animated:YES];
                }
                else if(tag==1)
                {
                    LoanViewController *loanview=[[LoanViewController alloc]init];
                    loanview.isFromHome=YES;
                    loanview.hidesBottomBarWhenPushed=YES;
                    [self.navigationController pushViewController:loanview animated:YES];
                }
                else if(tag==2)
                {
                    LoanViewController *loanview=[[LoanViewController alloc]init];
                    loanview.isFromHome=YES;
                    loanview.hidesBottomBarWhenPushed=YES;
                    [self.navigationController pushViewController:loanview animated:YES];
                }
                else if(tag==3)
                {
                    LoanViewController *loanview=[[LoanViewController alloc]init];
                    loanview.isFromHome=YES;
                    loanview.hidesBottomBarWhenPushed=YES;
                    [self.navigationController pushViewController:loanview animated:YES];
                }
            }];

            [headView addSubview:customView];
            return headView;
        }
        else
        {
            
            UIView *headView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 209+88)];
            UIImageView *bannerImage=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 209)];
            bannerImage.image=[UIImage imageNamed:@"banner"];
            [headView addSubview:bannerImage];
            CustomActionView *customView=[[CustomActionView alloc]initWithFrame:CGRectMake(0, _cycleScrollView.frame.origin.y+_cycleScrollView.frame.size.height, SCREENWIDTH, 88)];
            [customView actionWithBlock:^(NSInteger tag) {
                if(tag==0)
                {
                    [self pushLoanView];

                }
                else if(tag==1)
                {
                    [self pushLoanView];

                }
                else if(tag==2)
                {
                    [self pushLoanView];

                }
                else if(tag==3)
                {
                    [self pushLoanView];
                }
            }];

            [headView addSubview:customView];
            return headView;
        }
    }
    
    else if(section==1)
    {
        UIView *view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 47)];
        view.backgroundColor=COLOR(249, 249, 249);
        UIImageView *hotImage=[[UIImageView alloc]initWithFrame:CGRectMake(16, 17, 9, 13)];
        hotImage.image=[UIImage imageNamed:@"热门推荐"];
        [view addSubview:hotImage];
        CustomLabel *tuijian=[[CustomLabel alloc]initWithFrame:CGRectMake(hotImage.frame.size.width+hotImage.frame.origin.x+5, 0, 100, 47) andSize:13 andTextColor:COLOR(51, 51, 51)];
        tuijian.text=@"热门推荐";
             [view addSubview:tuijian];
        return view;
    }
    else
    {
        return nil;
    }
}
- (void)pushLoanView{

    LoanViewController *loanview=[[LoanViewController alloc]init];
    loanview.isFromHome=YES;
    loanview.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:loanview animated:YES];

}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    if(section==0)
    {
        if(_bannerArray.count>0)
        {
            
            return 209+88;
        }
        else
        {
            return 0;
        }
        
        
    }
    else if(section==1)
    {
        
        return 47;
    }
    else
    {
        return 0;
    }
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(section==0)
    {
        return 0;
    }
    else
    {
        return _dataArray.count;
        
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
   
    if(indexPath.section==0)
    {
        return 0;
        
    }
    else
    {
        
        return 107;
    }

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    if(indexPath.section==0)
    {
        return nil;
    }
    else if(indexPath.section==1)
    {
        static NSString *reuseIdentiCell=@"cell";
        CustomHomeCell *cell=[tableView dequeueReusableCellWithIdentifier:reuseIdentiCell];
        if(!cell)
        {
            cell=[[CustomHomeCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentiCell];
        }
        Loan *loanModel=_dataArray[indexPath.row];
        [cell setContentWithModel:loanModel];
        cell.selectionStyle=NO;
        return cell;
        
    }
    else
    {
        return nil;
    }


}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    WebViewController *webView=[[WebViewController alloc]init];
    Loan *loanModel=_dataArray[indexPath.row];
    webView.url=loanModel.gourl_ios;    
    webView.titleName=loanModel.title;
    webView.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:webView animated:YES];
    
}


- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didScrollToIndex:(NSInteger)index
{

}

-(void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{

    WebViewController *webView=[[WebViewController alloc]init];
    Banner *bannerModel=_bannerArray[index];
    if(bannerModel.banner_gourl_ios)
    {
        webView.url=bannerModel.banner_gourl_ios;
        webView.titleName=bannerModel.banner_title;
        webView.hidesBottomBarWhenPushed=YES;
        [self.navigationController pushViewController:webView animated:YES];

    }
}

#pragma mark 刷新
- (void)refreshData{
    
    AVQuery *query=[AVQuery queryWithClassName:@"Loan"];
    [query orderByDescending:@"sort"];
    [query whereKey:@"isActive" equalTo:@(YES)];
    query.limit=1000;
    [query findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
       if(!error)
       {
           [_tableView.mj_header endRefreshing];
           if(objects.count>0)
           {
               [_dataArray removeAllObjects];
               [_dataArray addObjectsFromArray:objects];
           }
           [_tableView reloadData];

       }
        else
        {
            [_tableView.mj_header endRefreshing];
            [MBProgressHUD showError:@"网络错误" toView:self.view];
        }
    }];
    
    
    AVQuery *bannerQuery=[AVQuery queryWithClassName:@"Banner"];
    [bannerQuery findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
        if(!error)
        {
            if(objects.count>0)
            {
                [_bannerArray removeAllObjects];
                [_bannerArray addObjectsFromArray:objects];
            }
            [_tableView reloadData];
        }
    }];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}


@end
