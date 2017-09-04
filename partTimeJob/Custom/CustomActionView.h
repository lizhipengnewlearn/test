//
//  CustomActionView.h
//  partTimeJob
//
//  Created by mac on 17/8/18.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^buttonActionBlock)(NSInteger tag);
@interface CustomActionView : UIView
@property (nonatomic,copy)buttonActionBlock buttonTag;
- (void)actionWithBlock:(buttonActionBlock)block;

@end
