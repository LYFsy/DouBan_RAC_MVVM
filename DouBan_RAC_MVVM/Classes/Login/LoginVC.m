/*********************************************************/
/*                                                       *
 *                                                       *
 *   Follow your heart, but take your brain with you.    *
 *                                                       *
 *                                                       *
 *********************************************************/
//
//  LoginVC.m
//  DouBan_RAC_MVVM
//
//  Created by 刘一峰 on 2017/7/6.
//  Copyright © 2017年 刘一峰. All rights reserved.
//

#import "LoginVC.h"
#import "MainTabBarVC.h"

@interface LoginVC ()
@property (weak, nonatomic) IBOutlet UITextField *accountText;
@property (weak, nonatomic) IBOutlet UITextField *pwdText;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (weak, nonatomic) IBOutlet UILabel *btnStatus;

@end

@implementation LoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self LoginCommand];
    [self combineAccountAndPwd];

}

- (void)combineAccountAndPwd {
    RACSignal *accountValid = [_accountText.rac_textSignal map:^id _Nullable(NSString * _Nullable value) {
        return @([self isValidtextFieldWithString:value]);
    }];
    
    RACSignal *pwdValid = [_pwdText.rac_textSignal map:^id _Nullable(NSString * _Nullable value) {
        return @([self isValidtextFieldWithString:value]);
        
    }];
    RAC(_accountText,backgroundColor) = [accountValid map:^id _Nullable(id  _Nullable value) {
        return [value boolValue] ? [UIColor clearColor] : [UIColor redColor];
    }];
    RAC(_pwdText,backgroundColor) = [pwdValid map:^id _Nullable(id  _Nullable value) {
        return [value boolValue] ? [UIColor clearColor] : [UIColor redColor];
    }];
    RAC(_loginBtn,enabled) = [RACSignal combineLatest:@[_accountText.rac_textSignal,_pwdText.rac_textSignal] reduce:^id (NSString *account,NSString *pwd){
        NSLog(@"%@",account);
        return @([self isValidtextFieldWithString:account] && [self isValidtextFieldWithString:pwd]);
    }];
    RAC(_loginBtn,backgroundColor) = [RACSignal combineLatest:@[_accountText.rac_textSignal,_pwdText.rac_textSignal] reduce:^id (NSString * acc,NSString * pwd){
        return [self isValidtextFieldWithString:acc] && [self isValidtextFieldWithString:pwd] ? [UIColor orangeColor] : [UIColor grayColor];
    }];
    RAC(_btnStatus,text) = [RACSignal combineLatest:@[_accountText.rac_textSignal,_pwdText.rac_textSignal] reduce:^id (NSString *account,NSString *pwd){
        NSLog(@"%@",account);
        return [self isValidtextFieldWithString:account] && [self isValidtextFieldWithString:pwd] ? @"可用" :@"不可用";
    }];
}


- (BOOL)isValidtextFieldWithString:(NSString *)value {
    
    return value.length > 6 ? YES : NO;
}

- (void)LoginCommand {
    [[_loginBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
         [UIApplication sharedApplication].keyWindow.rootViewController = [MainTabBarVC new];
    }];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
