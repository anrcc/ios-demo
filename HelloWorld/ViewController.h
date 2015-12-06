//
//  ViewController.h
//  HelloWorld
//
//  Created by Banson on 14-7-28.
//  Copyright (c) 2014年 cc.anr. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIAlertViewDelegate>{
    IBOutlet UILabel *userOutput;
    
    
}
@property (retain,nonatomic) IBOutlet UILabel * userOutput;


-(IBAction)showMessage;

-(IBAction)commit:(id)sender;


@end
