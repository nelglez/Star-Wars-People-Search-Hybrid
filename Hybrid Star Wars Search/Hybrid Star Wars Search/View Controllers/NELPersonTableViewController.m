//
//  NELPersonTableViewController.m
//  Hybrid Star Wars Search
//
//  Created by Nelson Gonzalez on 4/1/19.
//  Copyright © 2019 Nelson Gonzalez. All rights reserved.
//

#import "NELPersonTableViewController.h"
#import "Hybrid_Star_Wars_Search-Swift.h"

@interface NELPersonTableViewController ()
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

@property (nonatomic) NSArray<NELPerson *> *people;
@end

@implementation NELPersonTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.searchBar.delegate = self;
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.people.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PersonTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PersonCell" forIndexPath:indexPath];
    
    NELPerson *person = self.people[indexPath.row];
    
    cell.person = person;
    // Configure the cell...
    
    return cell;
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [[NELPersonController sharedController] searchForPeopleWith:searchBar.text completion:^(NSArray<NELPerson *> *people, NSError * error) {
        self.people = people;
    }];
}

- (void)setPeople:(NSArray<NELPerson *> *)people
{
    if (_people != people) {
        _people = [people copy];
        
        //didSet
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
}

}
@end
