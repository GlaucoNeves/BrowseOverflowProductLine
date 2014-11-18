//
//  TopicViewController.h
//  BrowseOverflow
//
//  Created by Glauco on 11/2/14.
//  Copyright (c) 2014 Fuzzy Aliens Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TopicTableDataSource.h"

@interface TopicViewController : UIViewController

@property (nonatomic, assign) TopicTableDataSource *dataSource;
@property (weak, nonatomic) IBOutlet UITextField *theNewTopic;

- (IBAction)addTopic:(id)sender;

@end
