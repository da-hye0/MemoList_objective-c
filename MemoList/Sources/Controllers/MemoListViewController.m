//
//  ViewController.m
//  MemoList
//
//  Created by daye on 8/20/24.
//

#import "MemoListViewController.h"

@interface MemoListViewController () <UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) UITableView *memoTableView;
@end

@implementation MemoListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Memo List";
    [MemoManager.shared fetchMemo];
    
    self.memoTableView = [[UITableView alloc] 
                          initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)
                                  style:UITableViewStylePlain];
    [_memoTableView registerNib:[UINib  
                                 nibWithNibName:NSStringFromClass([MemoTableViewCell class]) bundle:nil]
                         forCellReuseIdentifier: @"Cell"];

    self.memoTableView.dataSource = self;
    self.memoTableView.delegate = self;
    [self.view addSubview:self.memoTableView];
    [self.memoTableView reloadData];
}

- (IBAction)buttonTapped:(UIBarButtonItem *)sender {
    NSLog(@"버튼눌림");
    [self navigateToEditMemoViewController];
}

- (void)navigateToEditMemoViewController {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    MemoEditViewController *vc = (MemoEditViewController *)[storyboard 
                                                            instantiateViewControllerWithIdentifier:@"EditView"];
    vc.memoTableView = self.memoTableView;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)navigateToEditMemoViewControllerWithMemo:(NSString *)content index:(NSInteger)index {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    MemoEditViewController *vc = (MemoEditViewController *)[storyboard 
                                                            instantiateViewControllerWithIdentifier:@"EditView"];
    vc.memoTableView = self.memoTableView;
    
    vc.content = content;
    vc.index = index;
  
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - table view delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [MemoManager.shared countMemo];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MemoTableViewCell *cell = [self.memoTableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    if (!cell) {
        cell = [[MemoTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    
    NSString *memo = [MemoManager.shared.memoList objectAtIndex:[indexPath row]];
    [cell setTextWithContent: memo index:[indexPath row]];
  
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *memo = [MemoManager.shared.memoList objectAtIndex:[indexPath row]];
    [self navigateToEditMemoViewControllerWithMemo:memo index:[indexPath row]];
}

- (void)tableView:(UITableView *)tableView 
    commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
     forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [MemoManager.shared.memoList removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];

        [self.memoTableView reloadData];
    }
}

@end
