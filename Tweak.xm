#import <UIKit/UIKit.h>

%ctor {
    NSLog(@"[NewDevice] Plugin loaded!");
}

%hook SpringBoard

- (void)applicationDidFinishLaunching:(id)application {
    %orig;
    
    // 延迟显示提示
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 3.0 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        NSLog(@"[NewDevice] Showing alert...");
    });
}

%end
