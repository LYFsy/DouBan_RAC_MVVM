//
//  MusicCell.m
//  DouBan
//
//  Created by 刘一峰 on 2017/5/8.
//  Copyright © 2017年 刘一峰. All rights reserved.
//

#import "MusicCell.h"
#import "UIImage+Extension.h"
#import "MusicAttrs.h"
#import "MusicAuthor.h"
#import "MusicRating.h"
@implementation MusicCell

- (void)setModel:(MusicModel *)model {
    self.musicM = model;
    [self addIconImgView];
    [self addTitleLabel];
    [self addTimeLabel];
    [self addAuthorLabel];
    [self addAverageLabel];
    [self addDetailBtn];
}


- (void )addIconImgView {
    if (!_iconImgView) {
        _iconImgView = [[UIImageView alloc]init];
        [self.contentView addSubview:_iconImgView];
        [_iconImgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.contentView.mas_centerX);
            make.width.height.equalTo(@(MUSIC_CELL_HEIGHT/2));
            make.top.equalTo(self.contentView.mas_top).offset(10);
        }];
        //TODO 这个地方随后还用做图片三级缓存处理。
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:self.musicM.image]];
            dispatch_async(dispatch_get_main_queue(), ^{
                _iconImgView.image = [[UIImage imageWithData:data] circleImage];
            
            });
        });
    }
}


- (void)addTitleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.font = [UIFont systemFontOfSize:15];
        [self.contentView addSubview:_titleLabel];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView.mas_left).offset(15);
            make.height.equalTo(@20);
            make.top.equalTo(self.contentView.mas_centerY).offset(15);
        }];
        _titleLabel.text = [NSString stringWithFormat:@"曲目:%@",self.musicM.title];
    }
}


- (void)addTimeLabel {
    if (!_timeLabel) {
        _timeLabel = [[UILabel alloc]init];
        _timeLabel.font = [UIFont systemFontOfSize:15];
        [self.contentView addSubview:_timeLabel];
        [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_titleLabel.mas_left);
            make.height.equalTo(@20);
            make.top.equalTo(_titleLabel.mas_bottom);
        }];
        NSString * publisher = [self.musicM.attrs.publisher firstObject];
        _timeLabel.text = publisher;
    }
}

- (void)addAuthorLabel {
    if (!_authorLabel) {
        _authorLabel = [[UILabel alloc]init];
        _authorLabel.font = [UIFont systemFontOfSize:15];
        [self.contentView addSubview:_authorLabel];
        [_authorLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.contentView.mas_right).offset(-15);
            make.height.equalTo(@20);
            make.top.equalTo(self.contentView.mas_centerY).offset(15);
        }];
        _authorLabel.text = [NSString stringWithFormat:@"演唱:%@",[self.musicM.author firstObject].name];
    }
}

- (void)addAverageLabel {
    if (!_averageLabel) {
        _averageLabel = [[UILabel alloc]init];
        _averageLabel.font = [UIFont systemFontOfSize:15];
        [self.contentView addSubview:_averageLabel];
        [_averageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_authorLabel.mas_left);
            make.height.equalTo(@20);
            make.top.equalTo(_authorLabel.mas_bottom);
        }];
        _averageLabel.text = [NSString stringWithFormat:@"评分:%@",self.musicM.rating.average];
    }
}

- (void)addDetailBtn {
    if (!_detailBtn) {
        _detailBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _detailBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        _detailBtn.layer.borderWidth = 1.0f;
        _detailBtn.layer.borderColor = [UIColor blackColor].CGColor;
        _detailBtn.layer.cornerRadius = 5.0f;
        [_detailBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [self.contentView addSubview:_detailBtn];
        [_detailBtn setTitle:@"详情" forState:UIControlStateNormal];
        [_detailBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.contentView.mas_centerX);
            make.top.equalTo(_averageLabel.mas_bottom);
            make.width.equalTo(@80);
            make.height.equalTo(@30);
        }];
        
    }
}
@end
