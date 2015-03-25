#import "AssertLogTableViewController.h"
#import <Parse/Parse.h>
#import "AssertLogTableViewCell.h"

@interface AssertLogTableViewController () <UISearchDisplayDelegate>
@property (nonatomic, strong) PFQuery *query;

@property (nonatomic, strong) NSArray *posts;
@property (nonatomic, strong) NSArray *filteredPosts;



@end

@implementation AssertLogTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.query = [PFQuery queryWithClassName:@"DDTAssertLog"];
    
    [self doQuery];
    
}

- (void)startQuery
{
    [self performSelector:@selector(doQuery) withObject:nil afterDelay:5];
}

- (void)doQuery
{
    [self.query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        
        self.posts = objects;
        
        [self startQuery];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
    }];
}

- (void)viewWillAppear:(BOOL)animated
{
   
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.tableView) {
        return [self.posts count];
    }
    else {
        return [self.filteredPosts count];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AssertLogTableViewCell *cell = (AssertLogTableViewCell *)[self.tableView dequeueReusableCellWithIdentifier:@"AssertLogTableViewCell" forIndexPath:indexPath];
    
    if(tableView == self.tableView) {
        cell.messageLabel.text = self.posts[indexPath.row][@"AssertDescription"];
        cell.identifierLabel.text = self.posts[indexPath.row][@"Identifier"];
        cell.locationLabel.text = self.posts[indexPath.row][@"AssertLocation"];
    }
    else {
        cell.messageLabel.text = self.filteredPosts[indexPath.row][@"AssertDescription"];
        cell.identifierLabel.text = self.filteredPosts[indexPath.row][@"Identifier"];
        cell.locationLabel.text = self.filteredPosts[indexPath.row][@"AssertLocation"];
    }
    return cell;
}

- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    __block NSMutableArray *filteredPosts = [@[] mutableCopy];
    
    [self.posts enumerateObjectsUsingBlock:^(NSDictionary *dict, NSUInteger idx, BOOL *stop) {
        
        NSString *string = dict[@"Identifier"];
        
        if ([string containsString:searchString]) {
            [filteredPosts addObject:dict];
        }
    }];
    
    self.filteredPosts = [filteredPosts copy];
    
    return YES;
}

@end
