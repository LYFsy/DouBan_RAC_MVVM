/*********************************************************/
/*                                                       *
 *                                                       *
 *   Follow your heart, but take your brain with you.    *
 *                                                       *
 *                                                       *
 *********************************************************/
//
//  MovieVC.m
//  DouBan_RAC_MVVM
//
//  Created by 刘一峰 on 2017/7/4.
//  Copyright © 2017年 刘一峰. All rights reserved.
//

#import "MovieVC.h"

@interface MovieVC ()
@property(nonatomic,strong)MovieVM *viewModel;

@end

@implementation MovieVC

- (MovieVM *)viewModel {
    if (!_viewModel) {
        _viewModel = [MovieVM new];
    }
    return _viewModel;
}
- (void)loadDataByRACCommand {
    [[self.viewModel.requestDataCommand execute:@1] subscribeNext:^(id  _Nullable x) {
        NSLog(@"%@",x);
    }];
    
    //    self.cellType = BookCellType;
    //    @weakify(self)
    //    [[self.viewModel.requestDataCommand execute:@1] subscribeNext:^(id  _Nullable x) {
    //        @strongify(self)
    //        self.dataArray = x;
    //        dispatch_async(dispatch_get_main_queue(), ^{
    //            [self.tableView reloadData];
    //        });
    //    }];
}

- (void)tableViewDidSelected {
    RACSubject *subject = [RACSubject subject];
    [subject subscribeNext:^(NSIndexPath  * x) {
        //        BookModel * model = self.dataArray[x.row];
        //        NSLog(@"%@",model.publisher);
    }];
    self.subject = subject;
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
