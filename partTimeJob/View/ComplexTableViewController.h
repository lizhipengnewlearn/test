//
//  ComplexTableViewController.h
//  partTimeJob
//
//  Created by mac on 17/8/20.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Loan.h"
#import <MJRefresh/MJRefresh.h>

@class ComplexTableViewController;
@protocol ComplexDelegate <NSObject>
-(void)pushWebView:(Loan*)loanModel;
@end
@interface ComplexTableViewController : UITableViewController
@property (nonatomic, strong)NSMutableArray *dataArray;
@property (nonatomic, weak)id<ComplexDelegate>delegate;
- (void)refreshData;
@end
