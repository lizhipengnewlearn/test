//
//  LoanModel.m
//  partTimeJob
//
//  Created by mac on 17/8/10.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "Loan.h"
@implementation Loan

@dynamic lending_count;
@dynamic repay_money;
@dynamic success_rate;
@dynamic title;
@dynamic repay_unit;
@dynamic describe;
@dynamic gourl_ios;
@dynamic corner_index;
@dynamic logo_url;
@dynamic imageFile;


+(NSString *)parseClassName{
    return @"Loan";

}

@end
