//
//  BookCell.m
//  DouBan
//
//  Created by 刘一峰 on 2017/5/7.
//  Copyright © 2017年 刘一峰. All rights reserved.
//

#import "BookCell.h"

@implementation BookCell


- (void)setModel:(BookModel *)model{
    _bookM = model;
    [self addIconImageView];
    [self addTitleLabel];
    [self addAuthorLabel];
    [self addPressLabel];
    [self addPagesLabel];
}



- (void)addIconImageView {
    if (!_iconImgView) {
        _iconImgView = [[UIImageView alloc]init];
        [self.contentView addSubview:_iconImgView];
        [_iconImgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).offset(10);
            make.top.equalTo(self.mas_top).offset(10);
            make.bottom.equalTo(self.mas_bottom).offset(-10);
            make.width.equalTo(_iconImgView.mas_height);
        }];
    }
    //TODO 这个地方随后还用做图片三级缓存处理。
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:self.bookM.image]];
        dispatch_async(dispatch_get_main_queue(), ^{
            _iconImgView.image = [UIImage imageWithData:data];

        });
    });
}

- (void)addTitleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        [self.contentView addSubview:_titleLabel];
        _titleLabel.numberOfLines = 1;
        _titleLabel.textColor = [UIColor blackColor];
        [_titleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.iconImgView.mas_right).offset(5);
            make.top.equalTo(self.iconImgView.mas_top);
            make.height.equalTo(self.iconImgView.mas_height).dividedBy(4);
        }];
    }
    _titleLabel.text = self.bookM.title;


}

- (void)addAuthorLabel {
    if (!_authorLabel) {
        _authorLabel = [[UILabel alloc]init];
        [self.contentView addSubview:_authorLabel];
        _authorLabel.numberOfLines = 1;
        _authorLabel.textColor = [UIColor grayColor];
        [_authorLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.titleLabel.mas_left);
            make.top.equalTo(self.titleLabel.mas_bottom);
            make.height.equalTo(self.titleLabel.mas_height);
        }];
    }

    [[self.bookM.author.rac_sequence.signal map:^id _Nullable(NSString * _Nullable value) {
        return value;
    }] subscribeNext:^(NSString * x) {
        _authorLabel.text = [x stringByAppendingString:x];
    }];

}

- (void)addPressLabel {
    if (!_pressLabel) {
        _pressLabel = [[UILabel alloc]init];
        [self.contentView addSubview:_pressLabel];
        _pressLabel.numberOfLines = 1;
        _pressLabel.textColor = [UIColor grayColor];
        [_pressLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.authorLabel.mas_left);
            make.top.equalTo(self.authorLabel.mas_bottom);
            make.height.equalTo(self.authorLabel.mas_height);
        }];
    }
    _pressLabel.text = self.bookM.publisher;

}


- (void)addPagesLabel {
    if (!_pagesLabel) {
        _pagesLabel = [[UILabel alloc]init];
        [self.contentView addSubview:_pagesLabel];
        _pagesLabel.numberOfLines = 1;
        _pagesLabel.textColor = [UIColor grayColor];
        [_pagesLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.pressLabel.mas_left);
            make.top.equalTo(self.pressLabel.mas_bottom);
            make.height.equalTo(self.pressLabel.mas_height);
        }];
    }
    _pagesLabel.text = self.bookM.pages;

}
- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
