//
//  ViewController.m
//  HelloWorld
//
//  Created by Banson on 14-7-28.
//  Copyright (c) 2014年 cc.anr. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize userOutput;








- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)commit:(id)sender {
    UIAlertView *conmitAlert = [[ UIAlertView alloc ] initWithTitle:@"提交提示" message:@"谁让你提交了?" delegate:nil cancelButtonTitle:@"滚吧!" otherButtonTitles:nil, nil];
    [conmitAlert show];
}



-(IBAction)showMessage
{
    UIAlertView *helloWorldAlert=[[UIAlertView alloc] initWithTitle:@"你妹" message:@"不好吃!" delegate:self cancelButtonTitle:@"滚" otherButtonTitles:@"有虫",@"好吃", nil ];
    
    [helloWorldAlert show];
 

}


-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{

    NSString * buttonTitle=[alertView buttonTitleAtIndex:buttonIndex];
    
    if ([buttonTitle isEqualToString:@"有虫"]) {
        userOutput.text=@"有虫";
        NSLog(@"有虫");
    }else if([buttonTitle isEqualToString:@"好吃"]){
         userOutput.text=@"好吃";
          NSLog(@"好吃");
    }else{
        userOutput.text=@"滚";
          NSLog(@"滚");
    }
}

@end
