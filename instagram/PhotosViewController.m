//
//  PhotosViewController.m
//  instagram
//
//  Created by Dhanya R on 9/14/15.
//  Copyright © 2015 Dhanya R. All rights reserved.
//

#import "PhotosViewController.h"
#import "MyTableViewCell.h"
#import "UIImageView+AFNetworking.h"
#import "PhotoDetailsViewController.h"


@interface PhotosViewController ()
// @property (nonatomic,strong) NSURLSession *session;
@property (nonatomic,strong) NSMutableArray *images;
@property (nonatomic, strong) UIRefreshControl *refreshControl;
- (void)onRefresh;
@end

@implementation PhotosViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    NSURL *url = [NSURL URLWithString:@"https://api.instagram.com/v1/media/popular?client_id=68f79eddb25342a595f46befb3efe00e"];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        NSDictionary *responseDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        self.images = responseDictionary[@"data"];
        [self.tableView reloadData];
    }];

    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self action:@selector(onRefresh) forControlEvents:UIControlEventValueChanged];
    [self.tableView insertSubview:self.refreshControl atIndex:0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view methods

- (long)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"response count : %lu", self.images.count);
    // return self.images.count;
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    MyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myTableViewCell"];
    NSString *imageUrl = self.images[indexPath.row][@"images"][@"low_resolution"][@"url"];
    
    
    [cell.myImageView setImageWithURL:[NSURL URLWithString:imageUrl] placeholderImage:[UIImage imageNamed:@"test.jpg"]];
    [cell.myImageView setBounds:CGRectMake(0, 0, 300, 300)];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // [self performSegueWithIdentifier:@"openPhotoDetailView" sender:self];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if ([segue.identifier isEqualToString:@"openPhotoDetailView"]) {
        PhotoDetailsViewController *photoDetailsViewController = [segue destinationViewController];
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];

        photoDetailsViewController.selectedImage = self.images[indexPath.row][@"images"][@"low_resolution"][@"url"];
        
        // [self.tableView setAllowsSelection:YES];
    }
}

- (void)onRefresh {
    NSURL *url = [NSURL URLWithString:@"https://api.instagram.com/v1/media/popular?client_id=68f79eddb25342a595f46befb3efe00e"];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        [self.refreshControl endRefreshing];
    }];
}


- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"photo view will appear");
}

- (void)viewDidAppear:(BOOL)animated {
    NSLog(@"photo view did appear");
}

- (void)viewWillDisappear:(BOOL)animated {
    NSLog(@"photo view will disappear");
}

- (void)viewDidDisappear:(BOOL)animated {
    NSLog(@"photo view did disappear");
}



@end
