//
//  memoTableViewCell.m
//  MemoList
//
//  Created by daye on 8/21/24.
//

#import "MemoTableViewCell.h"

@implementation MemoTableViewCell

@synthesize titleLabel;
@synthesize contentLabel;

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setTextWithContent:(NSString *)content index:(NSInteger)index {
    [titleLabel setText:[NSString stringWithFormat:@"#%ld", (long)index+1]];
    [contentLabel setText:content];
}

@end
