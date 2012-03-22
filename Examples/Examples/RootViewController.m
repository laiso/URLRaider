//
//  RootViewController.m
//  Examples
//
//  Created by  on 3/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "RootViewController.h"

#import "UIWebViewController.h"
#import "RestKitViewController.h"
#import "ASIHTTPRequestViewController.h"
#import "OCMockViewController.h"

@interface RootViewController ()
@property (nonatomic, readonly) NSArray* controllers;
@end

@implementation RootViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
}

- (void)viewDidUnload
{
  [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
  return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  return self.controllers.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
  NSString* className = [[self.controllers objectAtIndex:indexPath.row] description];
  UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:className];
  cell.textLabel.text = className;
  return cell;
}

#pragma mark - StoryBoard

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
  if ([[segue identifier] isEqualToString:@"toRestKit"]) {
    //NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    //[segue destinationViewController];
  }
  [segue.destinationViewController setTitle:[[segue.destinationViewController class] description]];
}

- (NSArray *)controllers
{
  return [NSArray arrayWithObjects:
          [UIWebViewController class], 
          [RestKitViewController class],
          [ASIHTTPRequestViewController class],
          [OCMockViewController class], nil];
}


@end
