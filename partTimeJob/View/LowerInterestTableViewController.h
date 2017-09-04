//
//  LowerInterestTableViewController.h
//  partTimeJob
//
//  Created by mac on 17/8/20.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Loan.h"
@protocol LowerDelegate <NSObject>
-(void)pushWebView:(Loan*)loanModel;
@end

@interface LowerInterestTableViewController : UITableViewController
@property (nonatomic, strong)NSMutableArray *dataArray;
@property (nonatomic, weak)id<LowerDelegate>delegate;
- (void)refreshData;
@end
