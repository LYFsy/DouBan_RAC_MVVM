/*********************************************************/
/*                                                       *
 *                                                       *
 *   Follow your heart, but take your brain with you.    *
 *                                                       *
 *                                                       *
 *********************************************************/
//
//  BookVC.m
//  DouBan_RAC_MVVM
//
//  Created by 刘一峰 on 2017/7/4.
//  Copyright © 2017年 刘一峰. All rights reserved.
//

#import "BookVC.h"
#import "BookModel.h"
@interface BookVC ()
@property(nonatomic,strong)ViewModel *viewModel;
@end

@implementation BookVC

- (ViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [ViewModel new];
    }
    return _viewModel;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
}

#pragma mark 请求数据
- (void)loadDataByRACCommand {
    self.cellType = BookCellType;
    self.cellHeight = BOOK_CELL_HEIGHT;
    @weakify(self)
    [[self.viewModel.requestDataCommand execute:@1] subscribeNext:^(id  _Nullable x) {
        @strongify(self)
        self.dataArray = x;
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
    }];
}

#pragma mark tableviewCell的点击事件
- (void)tableViewDidSelected {
    RACSubject *subject = [RACSubject subject];
    [subject subscribeNext:^(NSIndexPath  * x) {
        BookModel * model = self.dataArray[x.row];
        NSLog(@"%@",model.publisher);
    }];
    self.subject = subject;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
