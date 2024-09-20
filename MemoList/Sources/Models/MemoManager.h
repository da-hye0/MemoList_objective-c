//
//  MemoList.h
//  MemoList
//
//  Created by daye on 8/20/24.
//


#import <Foundation/Foundation.h>

@interface MemoManager : NSObject

@property (nonatomic, strong) NSMutableArray *memoList;
+ (instancetype)shared;

- (void)fetchMemo;
- (void)addMemo:(NSString *)content;
- (void)updateMemo:(NSString *)content index:(NSInteger)index;
- (NSInteger) countMemo;

@end




