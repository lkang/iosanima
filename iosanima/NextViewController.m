//
//  NextViewController.m
//  iosanima
//
//  Created by Larry Kang on 9/12/14.
//  Copyright (c) 2014 Larry Kang. All rights reserved.
//

#import "NextViewController.h"

@interface NextViewController ()

@end

@implementation NextViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
    // Custom initialization
  }
  return self;
}

- (void)viewDidLoad
{
  [super viewDidLoad];
  // Do any additional setup after loading the view.
  [self.view setBackgroundColor:[UIColor orangeColor]];
  UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(100, 50,
                                                                150, 30)];
  [button setTitle:@"dismiss" forState:UIControlStateNormal];
  [button setBackgroundColor:[UIColor blueColor]];
  [button addTarget:self action:@selector(removeview) forControlEvents:UIControlEventTouchDown];
  [self.view addSubview:button];
}

- (void)removeview
{
  [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
