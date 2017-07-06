/*********************************************************/
/*                                                       *
 *                                                       *
 *   Follow your heart, but take your brain with you.    *
 *                                                       *
 *                                                       *
 *********************************************************/
//
//  BaseVC.m
//  DouBan_RAC_MVVM
//
//  Created by 刘一峰 on 2017/7/4.
//  Copyright © 2017年 刘一峰. All rights reserved.
//

#import "BaseVC.h"
#import "BookCell.h"
#import "RACSubject.h"
#import "BaseModel.h"


@interface BaseVC ()

@end

@implementation BaseVC

- (NSMutableArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

- (void)loadDataByRACCommand {
    NSAssert(0, @"subclass must override");
}

- (void)tableViewDidSelected {
    NSAssert(0, @"subclass must override");
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView = [[UITableView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:self.tableView];
    self.tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self loadDataByRACCommand];
    [self tableViewDidSelected];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return self.cellHeight;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"";
    CellFactory *cellF = nil;
    switch (_cellType) {
        case BookCellType:
            identifier = @"book";
            cellF = [[BookCellFactory alloc]init];
            break;
        case MusicCellType:
            identifier = @"music";
            cellF = [[MusicCellFactory alloc]init];
            break;
        case MovieCellType:
            identifier = @"movie";
            cellF = [[CellFactory alloc]init];
            break;
        default:
            break;
    }
    BaseCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [cellF createCell];
    }
    cell.model = self.dataArray[indexPath.row];
    return cell;

}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self.subject sendNext:indexPath];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
