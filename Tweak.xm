#import <UIKit/UIKit.h>

%hook SpringBoard

- (void)applicationDidFinishLaunching:(id)application {
    %orig;
    
    NSLog(@"[NewDevice] SpringBoard launched successfully!");
}

%end
