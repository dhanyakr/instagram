//
//  PhotoDetailsViewController.h
//  instagram
//
//  Created by Dhanya R on 9/14/15.
//  Copyright © 2015 Dhanya R. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoDetailsViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic,strong) NSString *selectedImage;
@property (weak, nonatomic) IBOutlet UITableView *detailTableView;
@end
