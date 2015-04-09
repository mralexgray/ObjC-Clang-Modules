


#import "SubSubUmbrella.h"

@implementation SubSubUmbrella static NSSound *s;  static int idx = 0;
 
+ (instancetype) shared { static id _self; return _self = _self ?: self.new; }

- (void) tittieTwisterShellyHack:(id)x { return 

            [(id)x   selectedSegment]?self.class.play : ({ NSString *p;
   !s ? p = [[NSBundle bundleForClass:self.class] pathForSoundResource:@"TittieTwisterShellyHack"] : nil;
  !(s = s ?: [NSSound.alloc initWithContentsOfFile:p byReference:NO]) ? NSBeep() :
  ({s.delegate = self.class.shared, [s play]; }); nil; });
}

+ (void) play {

  NSSound* snd; if ((snd = [NSSound soundNamed:self.availableSounds[idx]])) {

    snd.delegate = self.shared; [snd play];
  }
}

- (void)sound:(NSSound *)sound didFinishPlaying:(BOOL)aBool { NSSound* snd; idx++;

    NSLog(@"SOund finished:%@", sound); if (sound == s) return;
  
    if (self.class.availableSounds.count > (idx + 1)  &&
       (snd = [NSSound soundNamed:self.class.availableSounds[idx]])) {

   
    snd.delegate = self; [snd play];
  }
}

#define Soundify(x) [x stringByAppendingString:@"/Sounds"]

+ (NSArray*) availableSounds { static NSMutableArray *snds = nil; return snds = snds ?: ({

		     snds = NSMutableArray.new; NSString * sndDir, *sndFile; BOOL isDir; NSEnumerator 
    * dirEnum = @[@"/System/Library/Sounds",@"/Library/Sounds",[NSHomeDirectory() stringByAppendingPathComponent:@"Library/Sounds"]].objectEnumerator,
   * fileEnum; 
		
		while ((sndDir = dirEnum.nextObject)) 
			if([NSFileManager.defaultManager fileExistsAtPath:sndDir isDirectory:&isDir]) {
				if(!isDir) continue;
        fileEnum = [[NSFileManager.defaultManager directoryContentsAtPath:sndDir] objectEnumerator];
        
        while ((sndFile = fileEnum.nextObject))
          [NSSound.soundUnfilteredFileTypes containsObject:sndFile.pathExtension] 
          ?	[snds addObject:sndFile.stringByDeletingPathExtension] : nil;
      }
		[snds sortedArrayUsingSelector:@selector(compare:)].copy;
  });
}
@end
