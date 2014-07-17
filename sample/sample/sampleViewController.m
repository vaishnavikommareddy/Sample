//
//  sampleViewController.m
//  sample
//
//  Created by Valuelabs on 25/06/14.
//  Copyright (c) 2014 Valuelabs. All rights reserved.
//

#import "sampleViewController.h"

@interface sampleViewController ()

@end

@implementation sampleViewController

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
    // Do any additional setup after loading the view from its nib.
    
    NSLog(@"sampleViewController");
    NSLog(@"redirectNSLogToDocumentFolderredirectNSLogToDocumentFolder");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
