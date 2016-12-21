//
//  NoteTableViewCell.m
//  MyNoteBook
//
//  Created by Ivan_deng on 2016/12/16.
//  Copyright © 2016年 Ivan_deng. All rights reserved.
//

#import "NoteTableViewCell.h"

@implementation NoteTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
        CGFloat labelWith = screenWidth;
        CGFloat labelHeight = 34;
        CGFloat titleGap = 10;
        CGFloat titleTopView = 10;
        CGFloat timeStampHeight = 20;
        
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(titleGap, titleTopView, labelWith, labelHeight)];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_titleLabel];
        
        _timeStamp = [[UILabel alloc]initWithFrame:CGRectMake(titleGap, titleTopView + labelHeight, labelWith, timeStampHeight)];
        _timeStamp.textAlignment = NSTextAlignmentCenter;
        _timeStamp.font = [UIFont systemFontOfSize:10];
        _timeStamp.textColor = [UIColor grayColor];
        [self addSubview:_timeStamp];
    }
    return self;
}

@end
