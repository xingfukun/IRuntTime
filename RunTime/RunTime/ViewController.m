//
//  ViewController.m
//  RunTime
//
//  Created by fukun xing on 15-9-7.
//  Copyright (c) 2015年 fukun xing. All rights reserved.
//

#import "ViewController.h"

#import <objc/runtime.h>
#import <objc/message.h>
#import "MyClass.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    MyClass *mClass = [[MyClass alloc] init];

    
    /*******执行对象的某个方法********/
    [mClass print];
    objc_msgSend(mClass,sel_registerName("print"),nil);
    
    /******对类或对象中的成员变量赋值取值*****/
    objc_msgSend(mClass,sel_registerName("setSex:"),@"男");
    printf("%s",[objc_msgSend(mClass,sel_registerName("sex"),nil) UTF8String]);
    
    
    
    /********打印对象或者类中的所有属性********/
    
    UInt32 count;
    Ivar *ivars = class_copyIvarList(objc_getClass("MyClass"), &count);
    for (int i = 0; i < count; i++) {
        printf("%s\n",ivar_getName(ivars[i]));
    }
    
    
    /******打印对象或者类中的所有成员变量********/
    objc_property_t *propertys = class_copyPropertyList(objc_getClass("MyClass"), &count);
    for (int i = 0; i < count; i++) {
        printf("%s\n",property_getName(propertys[i]));
    }
    
    
    /******打印对象或者类中已实现的Delegate********/
    Protocol **protocols = class_copyProtocolList(objc_getClass("MyClass"), &count);
    for (int i = 0; i < count; i++) {
        printf("%s\n",protocol_getName(protocols[i]));
    }
    
    
    /******打印对象或者类中已实现的Delegate********/
    Method *methods = class_copyMethodList(objc_getClass("MyClass"), &count);
    for (int i = 0; i < count; i++) {
        printf("%s\n",sel_getName(method_getName(methods[i])));
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
