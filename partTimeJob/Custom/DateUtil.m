//
//  DateUtil.m
//  partTimeJob
//
//  Created by mac on 17/8/13.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "DateUtil.h"

@implementation DateUtil
+(NSString *)stringFromDate:(NSDate *)date{

    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *destDateString = [dateFormatter stringFromDate:date];
    return destDateString;
}

+(NSString *)timeStringFromDate:(NSDate*)date{

    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"HH:mm"];
    NSString *destDateString = [dateFormatter stringFromDate:date];
    return destDateString;

}
@end
