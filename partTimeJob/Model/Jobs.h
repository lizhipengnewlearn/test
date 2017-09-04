//
//  Jobs.h
//  partTimeJob
//
//  Created by mac on 17/8/12.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <AVOSCloud/AVOSCloud.h>
#import "AVObject+SubClass.h"
@interface Jobs : AVObject<AVSubclassing>
@property (nonatomic, strong)NSString *job_title;
@property (nonatomic, strong)NSString *job_address;
@property (nonatomic, strong)NSNumber *job_apply_num;
@property (nonatomic, strong)NSNumber *job_people_num;
@property (nonatomic, strong)NSString *job_description;
@property (nonatomic, strong)NSString *salary_unit;
@property (nonatomic, strong)NSNumber *job_salary;
@property (nonatomic, strong)NSString *settlement_type;
@property (nonatomic, strong)NSString *job_requirement;
@property (nonatomic, strong)NSString *job_sex;
@property (nonatomic, strong)AVFile *imageFile;
@property (nonatomic, strong)NSString *job_type;
@property (nonatomic, strong)NSDate * start_date;
@property (nonatomic, strong)NSDate * end_date;


@end
