//
//  WebViewController.m
//  partTimeJob
//
//  Created by mac on 17/8/10.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "WebViewController.h"
#import "MBProgressHUD+Add.h"
#import "CustomLabel.h"
@interface WebViewController ()<UIWebViewDelegate>

@end

@implementation WebViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    CustomLabel *titleLabel=[[CustomLabel alloc]initWithFrame:CGRectMake(0, 0, 100, 40) andSize:14 andTextColor:THEMEBLACKCOLOR];
    titleLabel.textAlignment=NSTextAlignmentCenter;
    titleLabel.text=self.titleName;
    self.navigationItem.titleView=titleLabel;
    self.edgesForExtendedLayout=UIRectEdgeNone;
    UIWebView *webView=[[UIWebView alloc]init];
    webView.frame = CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT-64);
    [self.view addSubview:webView];
    webView.delegate=self;
    NSString *urlString=[[NSString stringWithFormat:@"%@",self.url]stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL *URL =[NSURL URLWithString:urlString];// 貌似tel:// 或者 tel: 都行
    [webView loadRequest:[NSURLRequest requestWithURL:URL]];
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden=NO;
    
}
- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    
}

- (void)webViewDidStartLoad:(UIWebView *)webView{
    [MBProgressHUD showHUDAddedTo:webView animated:YES];
}

-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    [MBProgressHUD hideAllHUDsForView:webView animated:YES];
}

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    NSLog(@" error = %@", [error description]);
    [MBProgressHUD hideAllHUDsForView:webView animated:YES];
    [MBProgressHUD showError:@"加载出错" toView:webView];
}

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
