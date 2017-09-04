//
//  Banner.h
//  partTimeJob
//
//  Created by mac on 17/8/10.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <AVOSCloud/AVOSCloud.h>

@interface Banner : AVObject<AVSubclassing>
@property (nonatomic, strong)AVFile *imageFile;
@property (nonatomic, strong)NSString *banner_gourl_ios;
@property (nonatomic, strong)NSString *banner_title;
@property (nonatomic, strong)NSString *banner_url;
@end
