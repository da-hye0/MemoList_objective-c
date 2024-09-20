//
//  memoTableViewCell.h
//  MemoList
//
//  Created by daye on 8/21/24.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MemoTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;

- (void)setTextWithContent:(NSString *)content index:(NSInteger)index;

@end

NS_ASSUME_NONNULL_END
