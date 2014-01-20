//
//  ViewController.m
//  MBObservingMutableDictionary
//
//  Created by Moonbeom Kyle KWON on 1/20/14.
//  Copyright (c) 2014 Moonbeom Kyle KWON. All rights reserved.
//

#import "ViewController.h"
#import "MBObservingMutableDictionary.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleNotification:) name:NOTIFICATION_ADD_AN_OBJECT object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleNotification:) name:NOTIFICATION_REMOVE_ALL_OBJECTS object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleNotification:) name:NOTIFICATION_REMOVE_AN_OBJECT object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleNotification:) name:NOTIFICATION_REMOVE_OBJECTS object:nil];
    
    MBObservingMutableDictionary *dic = [[MBObservingMutableDictionary alloc] init];
    
    [dic setObject:@"test1" forKey:@"test1"];
    [dic setObject:@"test2" forKey:@"test2"];
    [dic setObject:@{@"test":@"test : test3"} forKey:@"test3"];
    
    NSLog(@"test1 : %@", [dic objectForKey:@"test1"]);
    NSLog(@"test2 : %@", [dic objectForKey:@"test2"]);
    NSLog(@"test1 : %@", [dic objectForKey:@"test3"]);
    
    NSArray *tempArray = [NSArray new];
    
    [dic removeObjectForKey:@"test1"];
    [dic removeAllObjects];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)handleNotification:(NSNotification *)notificatoin
{
    NSLog(@"%@", notificatoin.name);
}

@end
