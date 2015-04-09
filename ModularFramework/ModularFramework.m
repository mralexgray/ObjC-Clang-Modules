
/**  ModularFramework.m  *//* © 𝟮𝟬𝟭𝟯 𝖠𝖫𝖤𝖷 𝖦𝖱𝖠𝖸  𝗀𝗂𝗍𝗁𝗎𝖻.𝖼𝗈𝗆/𝗺𝗿𝗮𝗹𝗲𝘅𝗴𝗿𝗮𝘆 */

#import "ModularFramework.h"

@implementation ModularFramework {  NSTimeInterval intrvl; BOOL rpts; id trgt;
                                    NSTimer *tmr; /* THIS is what we are the proxy for. */ }

- (NSMethodSignature*) methodSignatureForSelector:(SEL)sel { return [trgt methodSignatureForSelector:sel]; }

+     (void)        updateDock { SUBLIB_DCK_TILE.contentView.frameCenterRotation += 2; [SUBLIB_DCK_TILE display]; }
+ (CALayer*)      mainAopLayer { static NSView *mainAppView; return (mainAppView) ? mainAppView.layer : (CALayer*)

    ([[NSApplication.sharedApplication.mainWindow.contentView subviews] enumerateObjectsUsingBlock:^(NSView *sub, NSUInteger i, BOOL *stp) {

        if (![sub.identifier isEqualToString:@"LogoPlaceholder"]) return;
        (mainAppView = sub).wantsLayer = YES;
        mainAppView.layer.contents = [self moduleImageNamed:@"LLVM.logo"];
        mainAppView.layer.borderWidth = 4; spin(mainAppView.layer); *stp = YES;
    }], mainAppView.layer);
}
+     (void)         beModular {

  SubLibSetDockIcon([self moduleImageNamed:@"LLVM.logo"]);
  SubLibPrint(@"I'm here (%@), I'm modular... get used to it.", self);
  id x = [NSClassFromString(@"SubUmbrella") new];
  SubLibPrint(@"Ive got my sub_umbrella (%@), here too!", x);
//  [NSTimer scheduledTimerWithTimeInterval:.1 target:self selector:@selector(updateDock) userInfo:nil repeats:YES];
//  [NSTimer scheduledTimerWithTimeInterval:.1 invocation:(NSInvocation*)self repeats:YES];
  [[self.alloc initWithTarget:self timeInterval:0.1 repeats:YES] updateDock];


}
+     (void)              load {

  [SUBLIB_NOT_CNTR addObserverForName:SUBLIB_APP_ACTV     object:nil
                                queue:SUBLIB_OP_QUEUE usingBlock:^(NSNotification *n) {

    [self.mainAopLayer setBackgroundColor:SubLibRandomColor().CGColor];

  }];
}

+ (NSImage*)  moduleImageNamed:(NSString*)n {

  return [NSImage.alloc initWithContentsOfFile:[[NSBundle bundleForClass:self.class]pathForImageResource:n]];
}
-     (void) forwardInvocation:(NSInvocation*)inv {

  inv.target  = trgt;
  tmr         = [NSTimer scheduledTimerWithTimeInterval:intrvl invocation:inv repeats:rpts];
}
-       (id)    initWithTarget:(id)t
                  timeInterval:(NSTimeInterval)ti
                       repeats:(BOOL)r {

  return trgt = t, intrvl = ti, rpts = r, self;
}
-     (void) invalidate   { if (tmr) [tmr invalidate], tmr = nil; }

@end

@implementation PrivateIvar { @private id a; BOOL b; }

- (id) init { return self = super.init ? a = @"apple", b = YES, self : nil; }

@end

@implementation SidewaysDep @end

//  id x = [self.alloc initWithTarget:self timeInterval:0.5 repeats:NO];
//  [NSTimer scheduledTimerWithTimeInterval:.1 target:self selector:@selector(updateDock) userInfo:nil repeats:YES];
//  [NSTimer scheduledTimerWithTimeInterval:.1 invocation:self repeats:YES];
//  CAKeyframeAnimation * anim = [CAKeyframeAnimation animationWithKeyPath:@"frameRotation"];
//  CGPathRef             path = CGPathCreateWithEllipseInRect(CGRectInset(v.bounds, NSWidth(v.bounds) * 0.25, NSWidth(v.bounds) * 0.25 ),NULL) ;
//  anim.path                  = path;  CGPathRelease(path);
//  [anim setValues:@[@0, @0, @1, @(M_PI_2)]];
//  v.frameRotation = .4;
//  anim.repeatCount           = FLT_MAX ;
//  anim.duration              = 3.0;

//__attribute__((constructor)) static void do_something_modular() { [ }
//__attribute__((destructor)) static void destroy_navigationBarImages() {  [navigationBarImages release]; }
//TARGET_OS_MAC ? NSApplicationDidBecomeActiveNotification : @"UIApplicationDidFinishLaunchingNotification" object:nil

//#define EXPORT __attribute__((visibility("default"))) 
//EXPORT
//@import ModularSubLibrary;
