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
@synthesize socketClinent;




DDTTYLogger * logger=nil;
DDFileLogger * fileLogger =nil;


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //建立连接
    [ self connect:HOST_IP port:HOST_PORT];

}



-(void) viewDidUnload
{
    self.socketClinent=nil; //释放对象
}



//提交按钮
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
//    NSLog(@"dir is %@", fileLogger.logFileManager.logsDirectory);
//
//    
//    DDLogError(@"Broken sprocket detected!");
//    DDLogVerbose(@"User selected file:%@ withSize:%@",@"a",@"b");
//    DDLogInfo(@"User selected file:%@ withSize:%@",@"a",@"b");
    
    [self sendMsg:@"aaaaaa" ];
    

}



//弹出提示框
-(IBAction)showMessage
{
    UIAlertView *helloWorldAlert=[[UIAlertView alloc] initWithTitle:@"你妹" message:@"不好吃!" delegate:self cancelButtonTitle:@"滚" otherButtonTitles:@"有虫",@"好吃", nil ];
    
    [helloWorldAlert show];
 

}

//提示框选择事件
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






//socket 发送消息
- (void)sendMsg:(NSString*) text {
    
    NSLog(@"sendMsg: %@",text);
    NSData *data = [text dataUsingEncoding:NSISOLatin1StringEncoding];
    [socketClinent writeData:data withTimeout:-1 tag:0];
}




////建立socket连接
//- (int) connectServer: (NSString *) hostIP port:(int) hostPort{
//    
//    NSLog(@"connectServer");
//    if (socketClinent == nil) {
//        socketClinent = [[GCDAsyncSocket alloc] initWithDelegate:self delegateQueue:self];
//        NSError *err = nil;
//        //192.168.110.128
//        if (![socketClinent connectToHost:hostIP onPort:hostPort error:&err]) {
//            NSLog(@"%@ %@", [err code], [err localizedDescription]);
//            
//            return SRV_CONNECT_FAIL;
//        } else {
//            NSLog(@"Conectou!");
//            return SRV_CONNECT_SUC;
//        }
//    }
//    else {
//        [socketClinent readDataWithTimeout:-1 tag:0];
//        return SRV_CONNECTED;
//    }
//    
//}




//连接服务器
- (BOOL)connect:(NSString *) hostIP port:(int) hostPort{
    socketClinent = [[GCDAsyncSocket alloc]initWithDelegate:self delegateQueue:dispatch_get_main_queue()];
    socketClinent.delegate = self;
    NSError *err = nil;
    BOOL connState=[socketClinent connectToHost:hostIP onPort:hostPort error:&err];
    
    if(!connState)
    {
        NSLog(@"连接服务器：%@ 失败",hostIP);

    }else
    {
        NSLog(@"连接服务器：%@ 成功",hostIP);
    }
    
    return connState;
}


//连接成功
-(void)socket:(GCDAsyncSocket *)sock didConnectToHost:(NSString *)host port:(uint16_t)port
{
    NSLog(@"连接服务器：%@ 连接到",host);

    [socketClinent readDataWithTimeout:-1 tag:0];
}


//连接断开
- (void)socketDidDisconnect:(GCDAsyncSocket *)sock withError:(NSError *)err
{
    NSLog(@"socket did is connect:%@",err);
}


//发送数据
- (IBAction)send:(id)sender {
    [socketClinent writeData:[@"啊啊啊啊哦我" dataUsingEncoding:NSUTF8StringEncoding] withTimeout:-1 tag:0];
    NSLog(@"发送的数据：%@ ",@"啊啊啊啊哦我");
    [socketClinent readDataWithTimeout:-1 tag:0];
}


//读取服务器获取的数据
-(void)socket:(GCDAsyncSocket *)sock didReadData:(NSData *)data withTag:(long)tag
{
    NSString *newMessage = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"服务器：%@:%@",sock.connectedHost,newMessage);
    [socketClinent readDataWithTimeout:-1 tag:0];
}





@end
