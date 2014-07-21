//
//  QHBasicViewController.m
//  helloworld
//
//  Created by chen on 14/6/30.
//  Copyright (c) 2014年 chen. All rights reserved.
//

#import "QHBasicViewController.h"

@interface QHBasicViewController ()

@end

@implementation QHBasicViewController

- (id)initWithFrame:(CGRect)frame param:(NSArray *)arParams
{
    self.arParams = arParams;
    
    self = [super init];
    
    [self.view setFrame:frame];
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = RGBA(236.f, 236.f, 236.f, 1);
    UIView *statusBarView = [[UIImageView alloc] initWithFrame:CGRectMake(0.f, 0.f, 320, 0.f)];
    if (isIos7 >= 7 && __IPHONE_OS_VERSION_MAX_ALLOWED > __IPHONE_6_1)
    {
        statusBarView.frame = CGRectMake(statusBarView.frame.origin.x, statusBarView.frame.origin.y, statusBarView.frame.size.width, 20.f);
        statusBarView.backgroundColor = [UIColor clearColor];
        ((UIImageView *)statusBarView).backgroundColor = RGBA(247,247,247,1);
        [self.view addSubview:statusBarView];
        //[[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:NO];
    }
}

- (void)createNavWithTitle:(NSString *)szTitle createMenuItem:(UIView *(^)(int nIndex))menuItem
{
    /* { 导航条 } */
    _navView = [[UIImageView alloc] initWithFrame:CGRectMake(0.f, StatusbarSize, 320, 44.f)];
    ((UIImageView *)_navView).backgroundColor = RGBA(247,247,247,1);
    [self.view addSubview:_navView];
    _navView.userInteractionEnabled = YES;
    
    if (szTitle != nil)
    {
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake((_navView.width - 200)/2, (_navView.height - 40)/2, 200, 40)];
        [titleLabel setText:szTitle];
        [titleLabel setTextAlignment:NSTextAlignmentCenter];
        [titleLabel setTextColor:[UIColor whiteColor]];
        [titleLabel setFont:[UIFont boldSystemFontOfSize:18]];
        [titleLabel setBackgroundColor:[UIColor clearColor]];
        [_navView addSubview:titleLabel];
    }
    
    UIView *item1 = menuItem(0);
    if (item1 != nil)
    {
        [_navView addSubview:item1];
    }
    UIView *item2 = menuItem(1);
    if (item2 != nil)
    {
        [_navView addSubview:item2];
    }
}

@end
