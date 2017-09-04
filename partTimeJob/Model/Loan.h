//
//  LoanModel.h
//  partTimeJob
//
//  Created by mac on 17/8/10.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVOSCloud/AVOSCloud.h>
#import "AVObject+SubClass.h"

@interface Loan : AVObject<AVSubclassing>
@property (nonatomic, strong)NSNumber *lending_count;//已放款人数
@property (nonatomic, strong)NSNumber *repay_money;//还款钱数
@property (nonatomic, strong)NSNumber *success_rate;//成功几率
@property (nonatomic, strong)NSString *title;//贷款名称
@property (nonatomic, strong)NSString *repay_unit;//月还款里面的月
@property (nonatomic, strong)NSString *describe;//描述
@property (nonatomic, strong)NSString *gourl_ios;//跳转路径
@property (nonatomic, strong)NSNumber *corner_index;//已放款人数
@property (nonatomic, strong)NSString *logo_url;//描述
@property (nonatomic, strong)AVFile *imageFile;//图片文件
@end
