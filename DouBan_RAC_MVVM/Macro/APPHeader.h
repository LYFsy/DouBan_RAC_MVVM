//
//  APPHeader.h
//  DouBan
//
//  Created by 刘一峰 on 2017/5/7.
//  Copyright © 2017年 刘一峰. All rights reserved.
//  这里存放普通的app宏定义和声明等信息.

#ifndef APPHeader_h
#define APPHeader_h

#define SCREEN_WIDTH [[UIScreen mainScreen]bounds].size.width

#define SCREEN_HEIGHT [[UIScreen mainScreen]bounds].size.height

#define BOOK_CELL_HEIGHT (([[UIScreen mainScreen]bounds].size.height - 108) / 4.5)

#define MUSIC_CELL_HEIGHT (([[UIScreen mainScreen]bounds].size.height - 108) / 3.3)

#import "BaseVC.h"
#import "BaseCell.h"
#import "BaseModel.h"
#import "NetworkManager.h"
#import "CellFactory.h"
#import "BookCellFactory.h"
#import "MusicCellFactory.h"
#import "ViewModel.h"
#import "MusicVM.h"
#import "MusicModel.h"
#import "MusicData.h"
#import "MovieVM.h"
#import "MovieData.h"
#import "MovieModel.h"
#endif 
/* APPHeader_h */
