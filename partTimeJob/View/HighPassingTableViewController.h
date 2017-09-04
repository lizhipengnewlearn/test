//
//  HighPassingTableViewController.h
//  partTimeJob
//
//  Created by mac on 17/8/20.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Loan.h"
@protocol HighPassDelegate <NSObject>
-(void)pushWebView:(Loan*)loanModel;
@end
@interface HighPassingTableViewController : UITableViewController
@property (nonatomic, strong)NSMutableArray *dataArray;
@property (nonatomic, weak)id<HighPassDelegate>delegate;
- (void)refreshData;

@end
