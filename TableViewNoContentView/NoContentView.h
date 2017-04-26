//
//  NoContentView.h
//  iDeliver
//
//  Created by 蔡强 on 2017/3/27.
//  Copyright © 2017年 kuaijiankang. All rights reserved.
//

//========== 无内容占位图 ==========//

#import <UIKit/UIKit.h>

// 无数据占位图的类型
typedef NS_ENUM(NSInteger, NoContentType) {
    /** 无网络 */
    NoContentTypeNetwork = 0,
    /** 无订单 */
    NoContentTypeOrder   = 1
};


@interface NoContentView : UIView

/** 无数据占位图的类型 */
@property (nonatomic,assign) NSInteger type;


@end
