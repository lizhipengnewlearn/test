//
//  LoginViewController.m
//  partTimeJob
//
//  Created by mac on 17/8/8.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "LoginViewController.h"
#import "CustomTextField.h"
#import "MBProgressHUD+Add.h"
#import "CustomLabel.h"
#define CORNER 25
@interface LoginViewController ()
{
    CustomTextField *_accountTextField;
    CustomTextField *_vertifyCodeTextField;
    UIButton *getVertifyCodeButton;

}
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout=UIRectEdgeNone;
    self.navigationController.navigationBar.translucent=NO;
    [self creatUI];
}

- (void)viewWillAppear:(BOOL)animated{

    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden=NO;
}

- (void)creatUI{

    self.view.backgroundColor=[UIColor whiteColor];
    CustomLabel *titleLabel=[[CustomLabel alloc]initWithFrame:CGRectMake(0, 0, 60, 40) andSize:14 andTextColor:THEMEBLACKCOLOR];
    titleLabel.text=@"登录";
    self.navigationItem.titleView=titleLabel;
    self.title=@"登录";
    UIImageView *logoImageView=[[UIImageView alloc]initWithFrame:CGRectMake((SCREENWIDTH-90)/2, 99, 90, 90)];
    logoImageView.image=[UIImage imageNamed:@"logo"];
    [self.view addSubview:logoImageView];
    _accountTextField=[[CustomTextField alloc]initWithFrame:CGRectMake(30, logoImageView.frame.size.height+logoImageView.frame.origin.y+38, SCREENWIDTH-60, 48) andTextSize:14 andTextColor:COLOR(51, 51, 51) andBackGroundColor:[UIColor clearColor] andPlaceolder:@"请输入您的手机号"];
    _accountTextField.textAlignment=NSTextAlignmentCenter;
    UIView *lineView=[[UIView alloc]initWithFrame:CGRectMake(30, _accountTextField.frame.size.height+_accountTextField.frame.origin.y+1, SCREENWIDTH-60, 0.5)];
    lineView.backgroundColor=LINECOLOR;
    [self.view addSubview:_accountTextField];
    [self.view addSubview:lineView];
    
    
    getVertifyCodeButton =[[UIButton alloc]initWithFrame:CGRectMake(SCREENWIDTH-30-109, lineView.frame.origin.y+17, 109, 48)];
    getVertifyCodeButton.titleLabel.font=[UIFont systemFontOfSize:14];
    getVertifyCodeButton.layer.cornerRadius=24;
    [getVertifyCodeButton setTitle:@"获取验证码" forState:UIControlStateNormal];
    [getVertifyCodeButton addTarget:self action:@selector(getvertifyButtonClick) forControlEvents:UIControlEventTouchUpInside];
    
    getVertifyCodeButton.backgroundColor=THEMEBLUECOLOR;
    [self.view addSubview:getVertifyCodeButton];
    
    _vertifyCodeTextField=[[CustomTextField alloc]initWithFrame:CGRectMake(30, lineView.frame.size.height+lineView.frame.origin.y+22, SCREENWIDTH-60-109-35, 48) andTextSize:14 andTextColor:COLOR(51, 51, 51) andBackGroundColor:[UIColor clearColor] andPlaceolder:@"验证码"];
    _vertifyCodeTextField.textAlignment=NSTextAlignmentCenter;
    //_vertifyCodeTextField.backgroundColor=[UIColor redColor];
    [self.view addSubview:_vertifyCodeTextField];
    
    UIView *secondView=[[UIView alloc]initWithFrame:CGRectMake(30, _vertifyCodeTextField.frame.size.height+_vertifyCodeTextField.frame.origin.y, SCREENWIDTH-60-109-35, 0.5)];
    secondView.backgroundColor=LINECOLOR;
    [self.view addSubview:secondView];
    

    
    UIButton *loginButon=[[UIButton alloc]initWithFrame:CGRectMake(30, secondView.frame.size.height+secondView.frame.origin.y+50, SCREENWIDTH-60, 50)];
    [loginButon setTitle:@"完成" forState:UIControlStateNormal];
    [loginButon setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    loginButon.layer.masksToBounds=YES;
    loginButon.layer.cornerRadius=CORNER;
    loginButon.backgroundColor=THEMEBLUECOLOR;
    [loginButon addTarget:self action:@selector(loginButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginButon];
    
}
#pragma mark 获取验证码
-(void)getvertifyButtonClick{

    AVShortMessageRequestOptions *options = [[AVShortMessageRequestOptions alloc] init];
    options.TTL = 10;                      // 验证码有效时间为 10 分钟
    options.applicationName = @"考拉贷款";  // 应用名称
    options.operation = @"登录";        // 操作名称
    [AVSMS requestShortMessageForPhoneNumber:_accountTextField.text                                     options:options
                                    callback:^(BOOL succeeded, NSError * _Nullable error) {
                                        if (succeeded) {
                                            __block int timeout=59; //倒计时时间
                                            dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
                                            dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
                                            dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
                                            dispatch_source_set_event_handler(_timer, ^{
                                                if(timeout<=0){ //倒计时结束，关闭
                                                    dispatch_source_cancel(_timer);
                                                    dispatch_async(dispatch_get_main_queue(), ^{
                                                        //设置界面的按钮显示 根据自己需求设置
                                                        
                                                        [getVertifyCodeButton setTitle:@"重新获取" forState:UIControlStateNormal];
                                                        getVertifyCodeButton.userInteractionEnabled = YES;
                                                        
                                                    });
                                                }else{
                                                    //            int minutes = timeout / 60;
                                                    int seconds = timeout % 60;
                                                    NSString *strTime = [NSString stringWithFormat:@"%.2d", seconds];
                                                    dispatch_async(dispatch_get_main_queue(), ^{
                                                        //设置界面的按钮显示 根据自己需求设置
                                                        NSLog(@"____%@",strTime);
                                                        [getVertifyCodeButton setTitle:@""forState:UIControlStateNormal];
                                                        [getVertifyCodeButton setTitle:[NSString stringWithFormat:@"%@秒后重试",strTime] forState:UIControlStateNormal];
                                                        getVertifyCodeButton.userInteractionEnabled = NO;
                                                        
                                                    });
                                                    timeout--;
                                                }
                                            });
                                            dispatch_resume(_timer);
                                            

                                        } else {
                                            /* 请求失败 */
                                            [getVertifyCodeButton setTitle:@"重新获取" forState:UIControlStateNormal];
                                            getVertifyCodeButton.enabled = YES;
                                            
                                        }
                                    }];
    
}
#pragma mark 登录
- (void)loginButtonClick{
    
    
    [AVUser signUpOrLoginWithMobilePhoneNumberInBackground:_accountTextField.text smsCode:_vertifyCodeTextField.text block:^(AVUser * _Nullable user, NSError * _Nullable error) {
        if(!error)//error 为空表示登录成功
        {
            if(user)
            {
                int value=(arc4random()%1000000)+9999;
                [user setObject:[NSString stringWithFormat:@"a%d",value] forKey:@"randomName"];
                [user saveEventually];
                [[NSNotificationCenter defaultCenter]postNotificationName:LOGINSUCCESS object:nil];
            }
            [self.navigationController popViewControllerAnimated:YES];
        }
        else
        {
            [MBProgressHUD showError:[[error userInfo] objectForKey:@"error"] toView:self.view];
            
        }

    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
