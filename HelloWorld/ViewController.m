//
//  ViewController.m
//  HelloWorld
//
//  Created by Banson on 14-7-28.
//  Copyright (c) 2014年 cc.anr. All rights reserved.
//



#import "ViewController.h"
#import "CocoaLumberjack.h"



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

DDTTYLogger *logger=nil;
DDFileLogger *fileLogger =nil;

- (IBAction)commit:(id)sender {
    UIAlertView *conmitAlert = [[ UIAlertView alloc ] initWithTitle:@"提交提示" message:@"谁让你提交了?" delegate:nil cancelButtonTitle:@"滚吧!" otherButtonTitles:nil, nil];
    [conmitAlert show];
    
    //1.创建一个终端显示日志
    
      if (logger == nil) {
    
          logger = [DDTTYLogger sharedInstance]; //只需要初始化一次
          //1.1将日志网终端上输出
          [DDLog addLogger:logger];
      }
    
    //2.创建一个文件日志 Log信息往文件输出
    if(fileLogger==nil){
        fileLogger = [[DDFileLogger alloc]init]; //只需要初始化一次
        fileLogger.rollingFrequency = 60 * 60 * 24; // 24 hour rolling
        fileLogger.logFileManager.maximumNumberOfLogFiles = 7; //log 文件最多允许 7个
        //2.1让日志文件logger输出
        [DDLog addLogger:fileLogger];
    }
    //2.2打印日志文件目录
    NSLog(@"dir is %@", fileLogger.logFileManager.logsDirectory);

    
    DDLogError(@"Broken sprocket detected!");
    DDLogVerbose(@"User selected file:%@ withSize:%@",@"a",@"b");
    DDLogInfo(@"User selected file:%@ withSize:%@",@"a",@"b");
    
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
