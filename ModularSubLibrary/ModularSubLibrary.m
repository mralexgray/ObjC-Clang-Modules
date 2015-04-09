

#import "ModularSubLibrary.h"

NSString* runCommand	(NSString* c) {	NSString* outP;	FILE *read_fp;	char buffer[BUFSIZ + 1];	int chars_read;

	memset(buffer, '\0', sizeof(buffer));
	read_fp = popen(c.UTF8String, "r");
	if (read_fp != NULL) {
		chars_read = fread(buffer, sizeof(char), BUFSIZ, read_fp);
	   if (chars_read > 0) outP = [NSString stringWithUTF8String:buffer];
		pclose(read_fp);
	}	
	return outP;
}

OBJC_EXPORT NSString * SubLibRunCLITest() {

  return [NSString stringWithUTF8String:getenv("PROJECT_DIR") ?: "N/A"];  // PROJECT_DIR var set in scheme's "Environment Variables"

}

void SubLibSetDockIcon (NSImage*i) { NSDockTile *dock = NSApplication.sharedApplication.dockTile; NSImageView *iv;

  dock.contentView  = iv = [NSImageView.alloc initWithFrame:(NSRect){0,0,512,512}];
  iv.imageScaling   = NSImageScaleProportionallyUpOrDown;
  iv.image          = i;   [dock display];
}

 void SubLibPrint(id format, ...) {

  NSString *formatted = ![format isKindOfClass:NSString.class] ? [format description] :
                         [format containsString:@"%"] ? format : nil;
  if (!formatted) {
      va_list argList;
      va_start (argList, format);
        formatted = [NSString.alloc initWithFormat:format arguments:argList];
      va_end(argList);
  }
   printf("[ModularSubLib Log] - %s\n", formatted.UTF8String);
}

CGFloat SubLibDeg2Rad (CGFloat angl) { return angl / (180 * M_PI); }

CGFloat SubLibRad2Deg (CGFloat rdns) { return rdns * (180 / M_PI); }

NSColor * SubLibRandomColor() { CGFloat (^randomFloat)() = ^{ return arc4random() % 255/255.0; };

  return [NSColor colorWithCalibratedRed:randomFloat() green:randomFloat() blue:randomFloat() alpha:1];
}

CAAnimation * spin (CALayer* l) {

    CABasicAnimation  * ani = [CABasicAnimation animationWithKeyPath:@"transform"];
    // Now assign the transform as the animation's value. While animating, CABasicAnimation will vary the transform
    // attribute of its target, which for this transform will spin the target like a wheel on its z-axis.
    ani.toValue             = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(SubLibDeg2Rad(360), 0, 0, 1)];
    ani.duration            = 2;
    ani.cumulative          = YES;
    ani.repeatCount         = HUGE_VAL;
    ani.delegate            = NSClassFromString(@"ModularFramework"); // Upward dependency.  Trick it.
    return [l addAnimation:ani forKey:nil], ani;
}

@implementation ModularSubLibrary { id x;}

- (id) init { return  self = [super init];}

@end



//  ModularSubLibrary *s = ModularSubLibrary.new;
//  NSLog(@"%@", s);
