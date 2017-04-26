//
//  BaseTableView.m
//  TableViewNoContentView
//
//  Created by 蔡强 on 2017/4/26.
//  Copyright © 2017年 kuaijiankang. All rights reserved.
//

#import "BaseTableView.h"
#import "NoContentView.h"

@interface BaseTableView (){
    NoContentView *_noContentView;
}

@end

@implementation BaseTableView

/**
 展示无数据占位图
 
 @param emptyViewType 无数据占位图的类型
 */
- (void)showEmptyViewWithType:(NSInteger)emptyViewType{
    
    // 如果已经展示无数据占位图，先移除
    if (_noContentView) {
        [_noContentView removeFromSuperview];
        _noContentView = nil;
    }
    
    //------- 再创建 -------//
    _noContentView = [[NoContentView alloc]initWithFrame:self.bounds];
    [self addSubview:_noContentView];
    _noContentView.type = emptyViewType;
    
    //------- 添加单击手势 -------//
    [_noContentView addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(noContentViewDidTaped:)]];
}

/* 移除无数据占位图 */
- (void)removeEmptyView{
    [_noContentView removeFromSuperview];
    _noContentView = nil;
}

// 无数据占位图点击
- (void)noContentViewDidTaped:(NoContentView *)noContentView{
    if (self.noContentViewTapedBlock)
    {
        self.noContentViewTapedBlock();//调用回调函数
    }
}

@end
