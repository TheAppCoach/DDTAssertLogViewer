//
//  AssertLogTableViewCell.h
//  DDTAssertLogViewer
//
//  Created by Daren David Taylor on 25/03/2015.
//  Copyright (c) 2015 DDT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AssertLogTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *messageLabel;
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;
@property (weak, nonatomic) IBOutlet UILabel *identifierLabel;

@end
