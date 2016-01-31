//
//  AppDelegate.m
//  objc_inheritance_osx
//
//  Created by xdf on 1/30/16.
//  Copyright © 2016 xdf. All rights reserved.
//

#import "AppDelegate.h"
#import <objc/runtime.h>

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    [self getSubClasses];
}

- (void)getSubClasses {
    int numClasses;
    Class * classes = NULL;
    numClasses = objc_getClassList(NULL, 0);
    
    NSString *temp;
    
    if (numClasses > 0) {
        classes = (__unsafe_unretained Class *)malloc(sizeof(Class) * numClasses);
        numClasses = objc_getClassList(classes, numClasses);
        NSLog(@"number of classes: %d", numClasses);
        
        for (int i = 0; i < numClasses; i++) {
            Class cls = classes[i];
            temp = [NSString stringWithFormat:@"%@\n%s,%@",temp,class_getName(cls), class_getSuperclass(cls)];
        }
        free(classes);
    }
    NSLog(@"%@", temp);
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

@end
