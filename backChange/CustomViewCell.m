//
//  CustomViewCell.m
//  customLayout
//
//  Created by Анастасия Рябова on 02/06/2019.
//  Copyright © 2019 Анастасия Рябова. All rights reserved.
//

#import "CustomViewCell.h"

@interface CustomViewCell()

@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation CustomViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        _titleLabel = [UILabel new];
        _titleLabel.backgroundColor = [UIColor colorWithWhite:249.0/255.0 alpha:0.8];
        //_titleLabel.backgroundColor = [UIColor orangeColor];
        [self.contentView addSubview:_titleLabel];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.titleLabel.frame = CGRectMake(20.f, 20.f, 140.f, 140.f);
    
}

- (void)preapeForReuse
{
    [super prepareForReuse];
    
    self.titleLabel = nil;
}

- (void)setTitle:(NSString *)title
{
    self.titleLabel.text = title;
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.font = [UIFont fontWithName:@"Avenir-BookOblique" size: 30.f];
}


@end
