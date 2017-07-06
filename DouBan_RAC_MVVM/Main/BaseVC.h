/*********************************************************/
/*                                                       *
 *                                                       *
 *   Follow your heart, but take your brain with you.    *
 *                                                       *
 *                                                       *
 *********************************************************/
//
//  BaseVC.h
//  DouBan_RAC_MVVM
//
//  Created by 刘一峰 on 2017/7/4.
//  Copyright © 2017年 刘一峰. All rights reserved.
//

#import <UIKit/UIKit.h>
@class RACSubject;


@protocol ViewModelProtocol <NSObject>

// request Data
- (void)loadDataByRACCommand;
//tableviewcell didselected;
- (void)tableViewDidSelected;

@end



typedef NS_ENUM(NSInteger,CurrentCellType) {
    BaseCellType = 0,
    BookCellType,
    MusicCellType,
    MovieCellType
};

@interface BaseVC : UIViewController<UITableViewDelegate,UITableViewDataSource,ViewModelProtocol>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *dataArray;
@property(nonatomic,strong)RACSubject *subject;
@property(nonatomic,assign)CurrentCellType cellType;
@property(nonatomic, assign) CGFloat cellHeight;
@end
