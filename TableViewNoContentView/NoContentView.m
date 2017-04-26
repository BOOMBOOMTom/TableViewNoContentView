//
//  NoContentView.m
//  iDeliver
//
//  Created by 蔡强 on 2017/3/27.
//  Copyright © 2017年 kuaijiankang. All rights reserved.
//

//========== 无内容占位图 ==========//

#import "NoContentView.h"
#import "UIColor+Util.h"
#import "Masonry.h"

@interface NoContentView ()<UIScrollViewDelegate>

@property (nonatomic,strong) UIImageView *imageView;
@property (nonatomic,strong) UILabel *topLabel;
@property (nonatomic,strong) UILabel *bottomLabel;

@end

@implementation NoContentView

#pragma mark - 构造方法

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        // UI搭建
        [self setUpUI];
    }
    return self;
}

#pragma mark - UI搭建
/** UI搭建 */
- (void)setUpUI{
    self.backgroundColor = [UIColor whiteColor];
    
    //------- 图片 -------//
    self.imageView = [[UIImageView alloc]init];
    [self addSubview:self.imageView];
    
    //------- 内容描述 -------//
    self.topLabel = [[UILabel alloc]init];
    [self addSubview:self.topLabel];
    self.topLabel.textAlignment = NSTextAlignmentCenter;
    self.topLabel.font = [UIFont systemFontOfSize:15];
    self.topLabel.textColor = [UIColor colorWithHexString:@"484848"];
    
    //------- 提示点击重新加载 -------//
    self.bottomLabel = [[UILabel alloc]init];
    [self addSubview:self.bottomLabel];
    self.bottomLabel.textAlignment = NSTextAlignmentCenter;
    self.bottomLabel.font = [UIFont systemFontOfSize:15];
    self.bottomLabel.textColor = [UIColor colorWithHexString:@"484848"];
    
    //------- 建立约束 -------//
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self);
        make.centerY.mas_offset(-100);
        make.size.mas_equalTo(CGSizeMake(100, 100));
    }];
    
    [self.topLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.imageView.mas_bottom).mas_offset(10);
        make.left.right.mas_offset(0);
        make.height.mas_equalTo(20);
    }];
    
    [self.bottomLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.topLabel.mas_bottom).mas_offset(5);
        make.left.right.mas_offset(0);
        make.height.mas_equalTo(20);
    }];
    
}

#pragma mark - 根据传入的值创建相应的UI
/** 根据传入的值创建相应的UI */
- (void)setType:(NSInteger)type{
    switch (type) {
            
        case NoContentTypeNetwork: // 没网
        {
            [self setImage:@"网络异常" topLabelText:@"貌似没有网络" bottomLabelText:@"点击重试"];
        }
            break;
            
        case NoContentTypeOrder:
        {
            [self setImage:@"订单无数据" topLabelText:@"暂时没有订单" bottomLabelText:@"重新加载"];
        }
            break;
            
        default:
            break;
    }
}

#pragma mark - 设置图片和文字
/** 设置图片和文字 */
- (void)setImage:(NSString *)imageName topLabelText:(NSString *)topLabelText bottomLabelText:(NSString *)bottomLabelText{
    self.imageView.image = [UIImage imageNamed:imageName];
    self.topLabel.text = topLabelText;
    self.bottomLabel.text = bottomLabelText;
}

@end
