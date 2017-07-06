//
//  MusicCell.h
//  DouBan
//
//  Created by 刘一峰 on 2017/5/8.
//  Copyright © 2017年 刘一峰. All rights reserved.
//

#import "BaseCell.h"
#import "MusicModel.h"
@interface MusicCell : BaseCell
@property(nonatomic,strong)UIImageView *iconImgView;
@property(nonatomic,strong)UILabel *timeLabel;
@property(nonatomic,strong)UILabel *authorLabel;
@property(nonatomic,strong)UILabel *titleLabel;
@property(nonatomic,strong)UILabel *averageLabel;
@property(nonatomic,strong)MusicModel *musicM;
@property(nonatomic,strong)UIButton *detailBtn;
@end
