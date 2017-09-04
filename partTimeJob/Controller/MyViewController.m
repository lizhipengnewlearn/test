
//
//  MyViewController.m
//  partTimeJob
//
//  Created by mac on 17/8/16.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "MyViewController.h"
#import "LoginViewController.h"
#import "CustomLabel.h"
#import "CustomTextField.h"
#import "CustomChooseButton.h"
#define marginer 37
#import "CustomPickerView.h"
#import "MBProgressHUD+Add.h"
#import "VertifyObject.h"
@interface MyViewController ()
{
    UIScrollView *scrollView;
    CustomLabel *randomName;
    CustomTextField *userNameTextField;
    CustomTextField*userIDNumber;
    CustomTextField *limtAmountForMonthTextField;
    CustomTextField *monthlyIncomeTextField;

    CustomChooseButton *degreeButton;//学历
    CustomChooseButton *socialSecurityButton;//社保
    CustomChooseButton *carButton;
    CustomChooseButton *occupationButton;//职业
    
    AVUser *currentUser;
    
}
@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self refreshData];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(refreshData) name:LOGINSUCCESS object:nil];
}


- (void)refreshData{
    
    if([AVUser currentUser])
    {
        [self creatUI];

    }
}

-(void)creatUI{
    
    CustomLabel *titleLabel=[[CustomLabel alloc]initWithFrame:CGRectMake(0, 0, 60, 40) andSize:14 andTextColor:THEMEBLACKCOLOR];
    titleLabel.textAlignment=NSTextAlignmentCenter;
    titleLabel.text=@"我的";
    self.navigationItem.titleView=titleLabel;
    scrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT-64)];
    [self.view addSubview:scrollView];
    UIView *topView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 141)];
    topView.backgroundColor=THEMEBLUECOLOR;
    [scrollView addSubview:topView];
    UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake((SCREENWIDTH-65)/2, 30, 65, 65)];
    imageView.layer.cornerRadius=32.5;
    imageView.image=[UIImage imageNamed:@"logo"];
    [topView addSubview:imageView];
    
    
    randomName=[[CustomLabel alloc]initWithFrame:CGRectMake(0, imageView.frame.size.height+imageView.frame.origin.y+15, SCREENWIDTH, 14) andSize:13 andTextColor:[UIColor whiteColor]];
    randomName.text=[[AVUser currentUser] objectForKey:@"randomName"];
    randomName.textAlignment=NSTextAlignmentCenter;
    [topView addSubview:randomName];
    
    
    UIView *grayView=[[UIView alloc]initWithFrame:CGRectMake(0, topView.frame.size.height+topView.frame.origin.y, SCREENWIDTH, 30)];
    
    UIView *lineView=[[UIView alloc]initWithFrame:CGRectMake(0, grayView.frame.size.height-0.5, SCREENWIDTH, 0.5)];
    lineView.backgroundColor=LINECOLOR;
    [grayView addSubview:lineView];
    grayView.backgroundColor=COLOR(249, 249, 249);
    [scrollView addSubview:grayView];
    UIView *blueView=[[UIView alloc]initWithFrame:CGRectMake(37, 13.5, 8, 1.5)];
    blueView.backgroundColor=THEMEBLUECOLOR;
    [grayView addSubview:blueView];
    CustomLabel *label=[[CustomLabel alloc]initWithFrame:CGRectMake(blueView.frame.size.width+blueView.frame.origin.x+8, 9, SCREENWIDTH-55, 12)andSize:12 andTextColor:THEMEBLUECOLOR];
    label.textAlignment=NSTextAlignmentLeft;
    label.text=@"请填写真实信息，否则可能导致审核不通过";
    [grayView addSubview:label];
    //姓名
    CustomLabel *nameLabel=[[CustomLabel alloc]initWithFrame:CGRectMake(marginer, grayView.frame.size.height+grayView.frame.origin.y+14, 100, 12)andSize:11 andTextColor:SUBTITLECOLOR];
    nameLabel.text=@"本人姓名";
    [scrollView addSubview:nameLabel];
    userNameTextField=[[CustomTextField alloc]initWithFrame:CGRectMake(marginer, nameLabel.frame.size.height+nameLabel.frame.origin.y+18, SCREENWIDTH-marginer*2, 14) andTextSize:13 andTextColor:THEMEBLACKCOLOR andBackGroundColor:[UIColor whiteColor] andPlaceolder:@"请输入姓名"];
    if([[AVUser currentUser] objectForKey:@"userRealName"])
    {
        userNameTextField.text=[[AVUser currentUser] objectForKey:@"userRealName"];
        userNameTextField.userInteractionEnabled=NO;
        userNameTextField.enabled=NO;
        userNameTextField.textColor=SUBTITLECOLOR;
    }
    [scrollView addSubview:userNameTextField];
    UIView *firstSepView=[[UIView alloc]initWithFrame:CGRectMake(marginer, userNameTextField.frame.size.height+userNameTextField.frame.origin.y+10, SCREENWIDTH-marginer*2, 0.5)];
    firstSepView.backgroundColor=LINECOLOR;
    [scrollView addSubview:firstSepView];
    
    //身份证号limitAmountForMonth
    CustomLabel *idenfyLabel=[[CustomLabel alloc]initWithFrame:CGRectMake(marginer, firstSepView.frame.size.height+firstSepView.frame.origin.y+14, 120, 12) andSize:11 andTextColor:SUBTITLECOLOR];
    idenfyLabel.text=@"本人身份证号";
    [scrollView addSubview:idenfyLabel];
    userIDNumber=[[CustomTextField alloc]initWithFrame:CGRectMake(marginer, idenfyLabel.frame.size.height+idenfyLabel.frame.origin.y+18, SCREENWIDTH-marginer*2, 14) andTextSize:13 andTextColor:THEMEBLACKCOLOR andBackGroundColor:[UIColor clearColor] andPlaceolder:@"请输入身份证号"];
    
    if([[AVUser currentUser]objectForKey:@"userIdCardNo"])
    {
        userIDNumber.text=[[AVUser currentUser]objectForKey:@"userIdCardNo"];
        userIDNumber.enabled=NO;
        userIDNumber.textColor=SUBTITLECOLOR;
    }
    [scrollView addSubview:userIDNumber];
    UIView *secondSepViw=[[UIView alloc]initWithFrame:CGRectMake(marginer, userIDNumber.frame.size.height+userIDNumber.frame.origin.y+10, SCREENWIDTH-marginer*2, 0.5)];
    secondSepViw.backgroundColor=LINECOLOR;
    [scrollView addSubview:secondSepViw];
    
    //最高可承受的月还款金额
    CustomLabel *moeneyLabel=[[CustomLabel alloc]initWithFrame:CGRectMake(marginer, secondSepViw.frame.size.height+secondSepViw.frame.origin.y+14, 120, 12) andSize:11 andTextColor:SUBTITLECOLOR];
    moeneyLabel.text=@"最高可承受月还款金额";
    [scrollView addSubview:moeneyLabel];
    limtAmountForMonthTextField=[[CustomTextField alloc]initWithFrame:CGRectMake(marginer, moeneyLabel.frame.size.height+moeneyLabel.frame.origin.y+18, SCREENWIDTH-marginer*2, 14) andTextSize:13 andTextColor:THEMEBLACKCOLOR andBackGroundColor:[UIColor clearColor] andPlaceolder:@"请输入每月可承受还款金额"];
    limtAmountForMonthTextField.keyboardType=UIKeyboardTypeNumberPad;
    if([[AVUser currentUser]objectForKey:@"limitAmountForMonth"])
    {
        NSNumber *limitString=[[AVUser currentUser]objectForKey:@"limitAmountForMonth"];
        
        limtAmountForMonthTextField.text=[NSString stringWithFormat:@"%@",limitString];
    }
    [scrollView addSubview:limtAmountForMonthTextField];
    UIView *thirdSepView=[[UIView alloc]initWithFrame:CGRectMake(marginer, limtAmountForMonthTextField.frame.size.height+limtAmountForMonthTextField.frame.origin.y+10, SCREENWIDTH-marginer*2, 0.5)];
    thirdSepView.backgroundColor=LINECOLOR;
    [scrollView addSubview:thirdSepView];
    //受教育啊程度
    CustomLabel *degreeLabel=[[CustomLabel alloc]initWithFrame:CGRectMake(marginer, thirdSepView.frame.size.height+thirdSepView.frame.origin.y+14, 120, 12) andSize:11 andTextColor:SUBTITLECOLOR];
    degreeLabel.text=@"受教育程度";
    [scrollView addSubview:degreeLabel];
    degreeButton=[[CustomChooseButton alloc]initWithFrame:CGRectMake(marginer, degreeLabel.frame.size.height+degreeLabel.frame.origin.y+8, SCREENWIDTH-marginer*2, 33)];
    degreeButton.tag=101;
    if([[AVUser currentUser]objectForKey:@"degree"])
    {
        degreeButton.titLabel.text=[[AVUser currentUser]objectForKey:@"degree"];
        degreeButton.titLabel.textColor=THEMEBLACKCOLOR;
    }
    [degreeButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:degreeButton];
    
    UIView *forthSepView=[[UIView alloc]initWithFrame:CGRectMake(marginer, degreeButton.frame.size.height+degreeButton.frame.origin.y, SCREENWIDTH-marginer*2, 0.5)];
    forthSepView.backgroundColor=LINECOLOR;
    [scrollView addSubview:forthSepView];
    //现单位是否缴纳社保
    CustomLabel *socaiLabel=[[CustomLabel alloc]initWithFrame:CGRectMake(marginer, forthSepView.frame.size.height+forthSepView.frame.origin.y+14, SCREENWIDTH-marginer*2, 12) andSize:11 andTextColor:SUBTITLECOLOR];
    socaiLabel.text=@"现单位是否缴纳社保";
    [scrollView addSubview:socaiLabel];
    socialSecurityButton=[[CustomChooseButton alloc]initWithFrame:CGRectMake(marginer, socaiLabel.frame.size.height+socaiLabel.frame.origin.y+8, SCREENWIDTH-marginer*2, 33)];
    socialSecurityButton.tag=102;
    if([[AVUser currentUser]objectForKey:@"socialSecurityType"])
    {
        socialSecurityButton.titLabel.text=[[AVUser currentUser]objectForKey:@"socialSecurityType"];
        socialSecurityButton.titLabel.textColor=THEMEBLACKCOLOR;
    }

    [socialSecurityButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:socialSecurityButton];
    UIView *fifthSepView=[[UIView alloc]initWithFrame:CGRectMake(marginer, socialSecurityButton.frame.size.height+socialSecurityButton.frame.origin.y, SCREENWIDTH-marginer*2, 0.5)];
    fifthSepView.backgroundColor=LINECOLOR;
    [scrollView addSubview:fifthSepView];
    
    //车辆情况
    CustomLabel *carLabel=[[CustomLabel alloc]initWithFrame:CGRectMake(marginer, fifthSepView.frame.size.height+fifthSepView.frame.origin.y+14, SCREENWIDTH-marginer*2, 12) andSize:11 andTextColor:SUBTITLECOLOR];
    carLabel.text=@"车辆情况";
    [scrollView addSubview:carLabel];
    carButton=[[CustomChooseButton alloc]initWithFrame:CGRectMake(marginer, carLabel.frame.size.height+carLabel.frame.origin.y+8, SCREENWIDTH-marginer*2, 33)];
    carButton.tag=103;
    if([[AVUser currentUser]objectForKey:@"isHaveCar"])
    {
        carButton.titLabel.text=[[AVUser currentUser]objectForKey:@"isHaveCar"];
        carButton.titLabel.textColor=THEMEBLACKCOLOR;
    }

    [carButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:carButton];
    UIView *sixSepView=[[UIView alloc]initWithFrame:CGRectMake(marginer, carButton.frame.size.height+carButton.frame.origin.y, SCREENWIDTH-marginer*2, 0.5)];
    sixSepView.backgroundColor=LINECOLOR;
    [scrollView addSubview:sixSepView];

    //职业
    
    CustomLabel *jobLabel=[[CustomLabel alloc]initWithFrame:CGRectMake(marginer, sixSepView.frame.size.height+sixSepView.frame.origin.y+14, SCREENWIDTH-marginer*2, 12) andSize:11 andTextColor:SUBTITLECOLOR];
    jobLabel.text=@"职业";
    [scrollView addSubview:jobLabel];
    occupationButton=[[CustomChooseButton alloc]initWithFrame:CGRectMake(marginer, jobLabel.frame.size.height+jobLabel.frame.origin.y+8, SCREENWIDTH-marginer*2, 33)];
    occupationButton.tag=104;
    if([[AVUser currentUser]objectForKey:@"profession"])
    {
        occupationButton.titLabel.text=[[AVUser currentUser]objectForKey:@"profession"];
        occupationButton.titLabel.textColor=THEMEBLACKCOLOR;
    }
    
    [occupationButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:occupationButton];
    UIView *sevenSepView=[[UIView alloc]initWithFrame:CGRectMake(marginer, occupationButton.frame.size.height+occupationButton.frame.origin.y, SCREENWIDTH-marginer*2, 0.5)];
    sevenSepView.backgroundColor=LINECOLOR;
    [scrollView addSubview:sevenSepView];
    
    CustomLabel *monthlyIncomeLabel=[[CustomLabel alloc]initWithFrame:CGRectMake(marginer, sevenSepView.frame.size.height+sevenSepView.frame.origin.y+14, SCREENWIDTH-marginer*2, 12) andSize:11 andTextColor:SUBTITLECOLOR];
    monthlyIncomeLabel.text=@"月平均收入";
    [scrollView addSubview:monthlyIncomeLabel];
    
    monthlyIncomeTextField=[[CustomTextField alloc]initWithFrame:CGRectMake(marginer, monthlyIncomeLabel.frame.size.height+monthlyIncomeLabel.frame.origin.y+18, SCREENWIDTH-marginer*2, 14) andTextSize:13 andTextColor:THEMEBLACKCOLOR andBackGroundColor:[UIColor whiteColor] andPlaceolder:@"请输入月平均收入"];
    
    if([[AVUser currentUser]objectForKey:@"monthlyIncome"])
    {
        NSNumber *monthlyIncom=[[AVUser currentUser]objectForKey:@"monthlyIncome"];
        monthlyIncomeTextField.text=[NSString stringWithFormat:@"%@",monthlyIncom];
    }
    [scrollView addSubview:monthlyIncomeTextField];
    
    UIView *lastView=[[UIView alloc]initWithFrame:CGRectMake(marginer, monthlyIncomeTextField.frame.size.height+monthlyIncomeTextField.frame.origin.y+10, SCREENWIDTH-marginer*2, 0.5)];
    lastView.backgroundColor=LINECOLOR;
    [scrollView addSubview:lastView];
    
    UIButton *submitButton=[[UIButton alloc]initWithFrame:CGRectMake(60, lastView.frame.size.height+lastView.frame.origin.y+20, SCREENWIDTH-120, 44)];
    [submitButton setTitle:@"提交" forState:UIControlStateNormal];
    submitButton.layer.cornerRadius=22;
    submitButton.backgroundColor=THEMEBLUECOLOR;
    [submitButton addTarget:self action:@selector(submitButtonClick) forControlEvents:UIControlEventTouchUpInside];
    
    [scrollView addSubview:submitButton];
    [scrollView setContentSize:CGSizeMake(SCREENWIDTH, submitButton.frame.size.height+submitButton.frame.origin.y+20)];
}

#pragma mark 提交
- (void)submitButtonClick{

    
    currentUser=[AVUser currentUser];
   if(userNameTextField.text.length>0)
   {
       [currentUser setObject:userNameTextField.text forKey:@"userRealName"];
   }
   if(userIDNumber.text.length>0)
   {
       if([VertifyObject validateIdentityCard:userIDNumber.text])
       {
           [currentUser setObject:userIDNumber.text forKey:@"userIdCardNo"];
       }
       else
       {
           [MBProgressHUD showError:@"身份证格式不正确" toView:self.view];
           [NSThread sleepForTimeInterval:1];

       }
   }
   if(limtAmountForMonthTextField.text.length>0)
   {
       [currentUser setObject:@(limtAmountForMonthTextField.text.integerValue) forKey:@"limitAmountForMonth"];
   }
   if(![degreeButton.titLabel.text isEqualToString:@"请选择"])
   {
       [currentUser setObject:degreeButton.titLabel.text forKey:@"degree"];
   }
   if(![socialSecurityButton.titLabel.text isEqualToString:@"请选择"])
   {
       [currentUser setObject:socialSecurityButton.titLabel.text forKey:@"socialSecurityType"];

   }
   if(![carButton.titLabel.text isEqualToString:@"请选择"])
   {
       [currentUser setObject:carButton.titLabel.text forKey:@"isHaveCar"];
   }
   if(![occupationButton.titLabel.text isEqualToString:@"请选择"])
   {
       [currentUser setObject:occupationButton.titLabel.text forKey:@"profession"];

   }
   if(monthlyIncomeTextField.text.length>0)
   {
       [currentUser setObject:@(monthlyIncomeTextField.text.integerValue) forKey:@"monthlyIncome"];
   }

    [currentUser saveInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
       if(succeeded)
       {
           [MBProgressHUD hideHUDForView:self.view animated:YES];
           [MBProgressHUD showError:@"提交成功" toView:self.view];
           if([currentUser objectForKey:@"userRealName"])
           {
               userNameTextField.enabled=NO;
               userNameTextField.textColor=SUBTITLECOLOR;
           }
           if([currentUser objectForKey:@"userIdCardNo"])
           {
               userIDNumber.enabled=NO;
               userIDNumber.textColor=SUBTITLECOLOR;
           }
           else
           {
               userIDNumber.text=nil;
        
           }
           
           
       }
    }];
    
}

-(void)buttonClick:(CustomChooseButton*)button{
    if(button.tag==101)
    {
        CustomPickerView *pickerView=[[[CustomPickerView alloc]init]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT)andArray:@[@"硕士及以上",@"本科",@"大专",@"中专/高专及以下"]];
        [pickerView showInview];
        [pickerView setMyBlock:^(NSString *selectString){
            button.titLabel.text=selectString;
            button.titLabel.textColor=THEMEBLACKCOLOR;
        }];
        
    

    }
    else if(button.tag==102)
    {
        CustomPickerView *pickerView=[[[CustomPickerView alloc]init]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT)andArray:@[@"缴纳本地社保",@"未缴纳社保"]];
        [pickerView showInview];
        [pickerView setMyBlock:^(NSString *selectString){
            button.titLabel.text=selectString;
            button.titLabel.textColor=THEMEBLACKCOLOR;

        }];

    }
    else if(button.tag==103)
        
    {
        CustomPickerView *pickerView=[[[CustomPickerView alloc]init]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT)andArray:@[@"无车",@"本人名下有车，无贷款",@"本人名下有车，有按揭贷款",@"本人名下有车，但已被抵押",@"其他"]];
        [pickerView showInview];
        [pickerView setMyBlock:^(NSString *selectString){
            button.titLabel.text=selectString;
            button.titLabel.textColor=THEMEBLACKCOLOR;

        }];

    }
    else if(button.tag==104)
    {
        CustomPickerView *pickerView=[[[CustomPickerView alloc]init]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT)andArray:@[@"上班人群",@"企业主",@"个体工商户",@"学生",@"自由职业"]];
        [pickerView showInview];
        [pickerView setMyBlock:^(NSString *selectString){
            button.titLabel.text=selectString;
            button.titLabel.textColor=THEMEBLACKCOLOR;
        }];
    }
}

-(void)dealloc{
    
    [[NSNotificationCenter defaultCenter]removeObserver:self name:LOGINSUCCESS object:nil];
}
- (void)viewWillAppear:(BOOL)animated{

    [super viewWillAppear:animated];
   }
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
