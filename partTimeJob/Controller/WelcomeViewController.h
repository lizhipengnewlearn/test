//
//  WelcomeViewController.h
//  partTimeJob
//
//  Created by mac on 17/8/16.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol WelcomeDelegate <NSObject>

-(void)hideWelcomeController;
@end
@interface WelcomeViewController : UIViewController
@property (nonatomic, strong)id <WelcomeDelegate>delegate;
@end
