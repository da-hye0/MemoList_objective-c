//
//  WriteMemoViewController.m
//  MemoList
//
//  Created by daye on 8/21/24.
//

#import "MemoEditViewController.h"

@interface MemoEditViewController ()
@property (weak, nonatomic) IBOutlet UILabel *editTitleLabel;
@property (weak, nonatomic) IBOutlet UITextView *editContentLabel;
@end

@implementation MemoEditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if(!self.content) {
        self.title = @"New Memo";
        _editTitleLabel.text = [NSString stringWithFormat:@"#%ld", [MemoManager.shared countMemo]+1];
    } else {
        self.title = @"Edit Memo";
        _editTitleLabel.text = [NSString stringWithFormat:@"#%ld", (long)(self.index+1)];
        _editContentLabel.text = self.content;
    }
}

- (IBAction)tappedFinishButton:(UIBarButtonItem *)sender {
    if([self.title  isEqual: @"New Memo"]){
        [MemoManager.shared addMemo:_editContentLabel.text];
    } else {
        [MemoManager.shared updateMemo:_editContentLabel.text index:self.index];
    }
    [self.memoTableView reloadData];
    [self.navigationController popViewControllerAnimated:YES];
}

@end
