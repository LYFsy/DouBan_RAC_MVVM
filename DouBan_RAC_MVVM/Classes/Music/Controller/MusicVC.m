/*********************************************************/
/*                                                       *
 *                                                       *
 *   Follow your heart, but take your brain with you.    *
 *                                                       *
 *                                                       *
 *********************************************************/
//
//  MusicVC.m
//  DouBan_RAC_MVVM
//
//  Created by 刘一峰 on 2017/7/4.
//  Copyright © 2017年 刘一峰. All rights reserved.
//

#import "MusicVC.h"

@interface MusicVC ()
@property(nonatomic,strong)MusicVM *viewModel;
@end

@implementation MusicVC


- (MusicVM *)viewModel {
    if (!_viewModel) {
        _viewModel = [MusicVM new];
    }
    return _viewModel;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)loadDataByRACCommand {
    self.cellHeight = MUSIC_CELL_HEIGHT;
    self.cellType = MusicCellType;
    @weakify(self)
    [[self.viewModel.requestDataCommand execute:@1] subscribeNext:^(id  _Nullable x) {
        @strongify(self)
        self.dataArray = x;
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
    }];
}

- (void)tableViewDidSelected {
    RACSubject *subject = [RACSubject subject];
    [subject subscribeNext:^(NSIndexPath  * x) {
        NSLog(@"%@",x);
    }];
    self.subject = subject;
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
