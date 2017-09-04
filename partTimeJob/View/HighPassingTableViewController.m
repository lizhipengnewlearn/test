//
//  HighPassingTableViewController.m
//  partTimeJob
//
//  Created by mac on 17/8/20.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "HighPassingTableViewController.h"
#import "CustomHomeCell.h"
#import "Loan.h"
#import <MJRefresh/MJRefresh.h>
@interface HighPassingTableViewController ()

@end

@implementation HighPassingTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self creatDataSource];

    
}
- (void)creatDataSource{
    
    self.dataArray=[[NSMutableArray alloc]init];
    self.tableView.separatorStyle=NO;
    self.tableView.mj_header= [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(refreshData)];

    self.tableView.delegate=self;
    self.tableView.dataSource=self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)refreshData{
    
    AVQuery *query=[AVQuery queryWithClassName:@"Loan"];
    [query orderByDescending:@"orderByPassingRate"];
    [query whereKey:@"isActive" equalTo:@(YES)];
    query.limit=1000;
    [query findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
        if(!error)
        {
            [self.tableView.mj_header endRefreshing];
            if(objects.count>0)
            {
                [_dataArray removeAllObjects];
                [_dataArray addObjectsFromArray:objects];
            }
            [self.tableView reloadData];
            
        }
        else
        {
            [self.tableView.mj_header endRefreshing];

        }
    }];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArray.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 107;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellId=@"cellId";
    CustomHomeCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if(cell==nil)
    {
        cell=[[CustomHomeCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    Loan *loanModel=_dataArray[indexPath.row];
    [cell setContentWithModel:loanModel];
    cell.selectionStyle=NO;

    return cell;

}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    Loan *loanModel=_dataArray[indexPath.row];
    if([self.delegate respondsToSelector:@selector(pushWebView:)])
    {
        [self.delegate pushWebView:loanModel];
    }
}



@end
