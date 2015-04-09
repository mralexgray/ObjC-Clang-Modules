

@import                Cocoa ;
@import           QuartzCore ;

@interface ModularSubLibrary : NSObject @end

#define SUBLIB_MAIN(...) int main(int c, const char **v) { @autoreleasepool { ({ __VA_ARGS__; }); } return 0; }

#define SUBLIB_APP_MAIN  NSApplicationMain
#define SUBLIB_OP_QUEUE  NSOperationQueue.mainQueue
#define SUBLIB_NOT_CNTR  NSNotificationCenter.defaultCenter
#define SUBLIB_APP_ACTV  NSApplicationDidBecomeActiveNotification
#define SUBLIB_DCK_TILE  NSApplication.sharedApplication.dockTile

OBJC_EXPORT void       SubLibPrint (id, ...); // NS_FORMAT_FUNCTION(1,2);

OBJC_EXPORT void SubLibSetDockIcon (NSImage*);

OBJC_EXPORT CGFloat  SubLibRad2Deg (CGFloat);

OBJC_EXPORT CGFloat  SubLibDeg2Rad (CGFloat);

OBJC_EXPORT NSColor * SubLibRandomColor();

OBJC_EXPORT NSString * SubLibRunCLITest();

