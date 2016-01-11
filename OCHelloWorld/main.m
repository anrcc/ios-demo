//
//  main.m
//  OCHelloWorld
//
//  Created by banson on 15/7/27.
//  Copyright (c) 2015年 cc.anr. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dog.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        
        NSLog(@"Hello, World!");
        
        
        Dog* dog =[Dog alloc ];
        
        [dog setAge:1 setSex:2 setTelphone:@"恭喜aaaa发财"];
        dog.age=100;
        [dog setAge:250];
        NSLog(@"年龄是=%d", [dog age]);
        
        dog.dogName=@"旺财";
        
        NSLog(@"狗的名字是%@",dog.dogName);
        
        
        
        NSLog(@"Hello, World!2");
        
        NSString* text =[[NSString alloc] initWithFormat:@"豆芽啊"];
        
        NSString *unicodeStr = [NSString stringWithCString:[text UTF8String] encoding:NSUnicodeStringEncoding];
        

        
        printf("c==============%s\n", unicodeStr);     //输出字符 c=A
        

        
        
        
      //结构体
      //typedef struct User{
       typedef struct {
            //ARC环境下在struct里面使用object需要使用 __unsafe_unretained
            __unsafe_unretained NSString * name;
            int age;
            BOOL isGay;
        }User;
        
        
//        //使用方法一
//        User user;
//        user.name=@"完蛋了";
//        user.age=100;
//        user.isGay=NO;
        
        //使用方法二
        User user={@"完蛋了",200,YES};
        
        NSLog(@"1 =======结构体 %@ %i %i",user.name,user.age,user.isGay);
        
        
        
        NSString *str=[NSString stringWithFormat:@"无所谓的拉%@哈哈",@"O(∩_∩)O"];
        NSLog(@"2 =======这一段是String类型 %@",str);
        NSLog(@"2 ======= 长度%ld",str.length);
        
        NSString *str2=@"无所谓的拉O(∩_∩)O哈哈";
        
        
        if([str isEqualToString:str2]){
           NSLog(@"字符串相同呀",NULL);
        
        }else{
            NSLog(@"字符串不相同呀",NULL);
        }
        
        
        
        //字符串查找
        
        //查找开头
         NSLog(@"2 ======= 开始包含 %i",[str2 hasPrefix:@"无"]);
        //查找结尾
         NSLog(@"2 ======= 结尾包含 %i",[str2 hasSuffix:@"是"]);
        
        //全文查找
        NSRange range= [str2 rangeOfString:@"∩_∩"];
        
        if(range.location!=NSNotFound){//如果找到
        
            NSLog(@"2 ======= 找到啦 length=%ld location=%ld",range.length,range.location);
 
        }else{
              NSLog(@"没找到啊",NULL);
        }
        
        
        NSMutableString *mtStr= [NSMutableString stringWithCapacity:100];
        [mtStr appendString:@"豆芽"];
        [mtStr appendFormat:@"恭喜发%@,红包哪里%@",@"财",@"来"];
        
        NSLog(mtStr,NULL);
        
        
        
        // Array
        
        NSArray *array= [NSArray arrayWithObjects:@"你", @"是",@"一",@"条",@"狗", nil];
        
        NSMutableArray *mtArray=[NSMutableArray arrayWithCapacity:10];
        
        NSMutableString *msg= [NSMutableString stringWithCapacity:10];
        
        
        for (int i=0; i<array.count; i++) {
            [msg appendString:[array objectAtIndex:i]];
            
            [mtArray addObject:array[i]];
        }
        
        
        NSLog(@"3 ====== NSArray %@",msg);

        [msg appendString:@"NSMutableArray"];
        
        for (int i=0; i<mtArray.count; i++) {
            [msg appendString:[mtArray objectAtIndex:i]];
            
        }
        
         NSLog(@"3 ====== NSMutableArray %@",msg);

        
        
        
        
        //NSDictionary
        NSDictionary *dictionary=[NSDictionary dictionaryWithObjectsAndKeys:@"value_1",@"key_1",@"value_2",@"key_2", nil];
        
        NSLog(@"%@",[dictionary objectForKey:@"key_1"]);
        
        
        NSMutableDictionary *mtDictionary=[NSMutableDictionary dictionaryWithCapacity:10];
        
        [mtDictionary setObject:@"ob1" forKey:@"key1"];
        [mtDictionary setObject:[NSNull null] forKey:@"key2"];//NSNull
        [mtDictionary setObject:[NSNumber numberWithBool:YES] forKey:@"key3"];
        [mtDictionary setObject:[NSNumber numberWithInt:250] forKey:@"key4"];//NSNumber 包装基础类型
        
        
        NSLog(@"%@",[mtDictionary objectForKey:@"key3"]);
        
        //遍历字典
        for (NSString *cmKey in mtDictionary) {
           NSLog(@"%@", [mtDictionary objectForKey:cmKey]);
        }
        
        
        
    }
    return 0;
}




