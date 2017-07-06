/*********************************************************/
/*                                                       *
 *                                                       *
 *   Follow your heart, but take your brain with you.    *
 *                                                       *
 *                                                       *
 *********************************************************/
//
//  MainTabBarVC.m
//  DouBan_RAC_MVVM
//
//  Created by 刘一峰 on 2017/7/4.
//  Copyright © 2017年 刘一峰. All rights reserved.
//

#import "MainTabBarVC.h"
#import "MainNavigaitonController.h"
@interface MainTabBarVC ()

@end

@implementation MainTabBarVC

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *path = [[NSBundle mainBundle]pathForResource:@"Tabbar" ofType:@"plist"];
    NSArray *array = [NSArray arrayWithContentsOfFile:path];
    [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIViewController *vc = [NSClassFromString([obj valueForKey:@"class"]) new];
        MainNavigaitonController *nv = [[MainNavigaitonController alloc]initWithRootViewController:vc];
        UITabBarItem *item = [nv tabBarItem];
        item.title = [obj valueForKey:@"name"];
        item.selectedImage = [[UIImage imageNamed:@"img_select"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        item.image = [UIImage imageNamed:[obj valueForKey:@"img_unSelect"]];
        [self addChildViewController:nv];
        vc.title = [obj valueForKey:@"name"];
    }];
    self.tabBar.translucent = NO;
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
