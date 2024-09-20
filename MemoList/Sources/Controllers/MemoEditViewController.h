//
//  WriteMemoViewController.h
//  MemoList
//
//  Created by daye on 8/21/24.
//

#import <UIKit/UIKit.h>
#import "MemoManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface MemoEditViewController : UIViewController

@property (strong, nonatomic) UITableView *memoTableView;
@property (strong, nonatomic) NSString *content;
@property (nonatomic) NSInteger index;

@end

NS_ASSUME_NONNULL_END
