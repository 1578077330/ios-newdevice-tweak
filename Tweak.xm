#import <UIKit/UIKit.h>

%ctor {
    NSLog(@"[NewDevice] GitHub编译的插件已加载！");
}

%hook SpringBoard

- (void)applicationDidFinishLaunching:(id)application {
    %orig;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 3.0 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        UIAlertController *alert = [UIAlertController 
            alertControllerWithTitle:@"一键新机" 
            message:@"插件加载成功！此dylib在GitHub Actions编译" 
            preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *ok = [UIAlertAction actionWithTitle:@"确定" 
                            style:UIAlertActionStyleDefault 
                            handler:nil];
        [alert addAction:ok];
        
        UIViewController *rootVC = [UIApplication sharedApplication].keyWindow.rootViewController;
        if (rootVC) {
            [rootVC presentViewController:alert animated:YES completion:nil];
        }
    });
}

%end