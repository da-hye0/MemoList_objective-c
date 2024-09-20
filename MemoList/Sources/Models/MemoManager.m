//
//  MemoList.m
//  MemoList
//
//  Created by daye on 8/20/24.
//

#import "MemoManager.h"

@interface MemoManager()
@property (weak, nonatomic) NSUserDefaults *userDefaults;
@end

@implementation MemoManager

- (instancetype)init {
    self = [super init];
    if(self) {
        _memoList = [[NSMutableArray alloc] init];
        _userDefaults = [NSUserDefaults standardUserDefaults];
    }
    return self;
}

+ (instancetype)shared {
    static MemoManager *sharedInstance = nil;
    static dispatch_once_t onceToken; //단 한번 실행으로 Thead-Safe 보장
    dispatch_once(&onceToken, ^{
        sharedInstance = [[MemoManager alloc] init];
    });
    return sharedInstance;
}

- (void)fetchMemo
{
    _memoList = [self.userDefaults mutableArrayValueForKeyPath:@"memoList"];
}

- (void)addMemo:(NSString *)content
{
    [self.memoList addObject:content];
    [self saveMemoList];
}

- (void)updateMemo:(NSString *)content index:(NSInteger)index
{
    [self.memoList replaceObjectAtIndex:index withObject:content];
    [self saveMemoList];
}

- (void)saveMemoList
{
    [self.userDefaults setObject:_memoList forKey:@"memoList"];
}

- (NSInteger)countMemo
{
    return [self.memoList count];
}

@end

