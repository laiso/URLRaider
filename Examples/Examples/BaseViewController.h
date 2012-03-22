//
//  BasetViewController.h
//  Examples
//
//  Created by  on 3/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController

@property (nonatomic, retain) IBOutlet UIBarButtonItem* loadButton;
@property (nonatomic, retain) IBOutlet UITextField* urlInput;
@property (nonatomic, retain) IBOutlet UITextView* bodyInput;
@property (nonatomic, retain) IBOutlet UITextView* responseView;

- (IBAction)performRequest:(id)sender;
- (void)sendRequest;

@end
