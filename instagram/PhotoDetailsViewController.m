//
//  PhotoDetailsViewController.m
//  instagram
//
//  Created by Dhanya R on 9/14/15.
//  Copyright © 2015 Dhanya R. All rights reserved.
//

#import "PhotoDetailsViewController.h"
#import "UIImageView+AFNetworking.h"

@interface PhotoDetailsViewController ()

@end

@implementation PhotoDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"PhotoDetailsViewController selectedImage: %@", self.selectedImage);
    self.detailTableView.dataSource = self;
    self.detailTableView.delegate = self;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (long)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *detailTableIdentifier = @"DetailTableItem";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:detailTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:detailTableIdentifier];
    }
    
    NSString *imageUrl = self.selectedImage;
    
    [cell.imageView setImageWithURL:[NSURL URLWithString:imageUrl] placeholderImage:[UIImage imageNamed:@"test.jpg"]];
    
    return cell;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"photo detail view will appear");
}

- (void)viewDidAppear:(BOOL)animated {
    NSLog(@"photo detail view did appear");
}

- (void)viewWillDisappear:(BOOL)animated {
    NSLog(@"photo detail view will disappear");
}

- (void)viewDidDisappear:(BOOL)animated {
    NSLog(@"photo detail view did disappear");
}


@end
