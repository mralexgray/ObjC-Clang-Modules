

#import "SubSubUmbrella.h"

@implementation SubSubUmbrella static NSSound *s;  static int idx = 0;

 - (void) tittieTwisterShellyHack:x {

  if ([x selectedSegment])  return [self play];
  if (!s) {
    NSString *p = [[NSBundle bundleForClass:self.class] pathForSoundResource:@"TittieTwisterShellyHack"];
    s = [NSSound.alloc initWithContentsOfFile:p byReference:NO];
    s.delegate = self;
  }
  [s play];
}

- (void) play {

  NSSound* snd; if ((snd = [NSSound soundNamed:self.availableSounds.arrangedObjects[self.availableSounds.selectionIndex]])) {

    snd.delegate = self; [snd play];
  }
}

- (void)sound:(NSSound *)sound didFinishPlaying:(BOOL)aBool {

//  NSSound* snd;
  idx++;

    NSLog(@"Sound finished:%@", sound);
//    if (sound == s) return;

//    if (self.availableSounds.count > (idx + 1)  &&
//
//       (snd = [NSSound soundNamed:self.availableSounds[idx]])) {
//
//   
//    snd.delegate = self; [snd play];
//  }
}

#define Soundify(x) [x stringByAppendingString:@"/Sounds"]
@synthesize availableSounds = _availableSounds;
- (NSArrayController*) availableSounds { if (_availableSounds) return _availableSounds;

    _availableSounds = NSArrayController.new;
         NSString * sndDir, *sndFile; BOOL isDir;
         NSEnumerator * dirEnum = @[@"/System/Library/Sounds",@"/Library/Sounds",[NSHomeDirectory() stringByAppendingPathComponent:@"Library/Sounds"]].objectEnumerator,
   * fileEnum; 
		
		while ((sndDir = dirEnum.nextObject)) 
			if([NSFileManager.defaultManager fileExistsAtPath:sndDir isDirectory:&isDir]) {
				if(!isDir) continue;
        fileEnum = [[NSFileManager.defaultManager directoryContentsAtPath:sndDir] objectEnumerator];
        
        while ((sndFile = fileEnum.nextObject))
          [NSSound.soundUnfilteredFileTypes containsObject:sndFile.pathExtension] 
          ?	[_availableSounds addObject:sndFile.stringByDeletingPathExtension] : nil;
      }
      [_availableSounds addObserver:self forKeyPath:@"selectionIndexes" options:NSKeyValueObservingOptionNew context:NULL];
//		[/ sortedArrayUsingSelector:@selector(compare:)].copy;
      return _availableSounds;
}
- (void) observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {

  [self play];
}
@end

//+ (instancetype) shared { static id _self; return _self = _self ?: self.new; }
