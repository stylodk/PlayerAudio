//
//  ViewController.h
//  AudioPlayer
//
//  Created by Mac on 13/06/17.
//  Copyright © 2017 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <AVKit/AVKit.h>

@interface ViewController : UIViewController
- (IBAction)Btnstop:(id)sender;
- (IBAction)PlayPauseBUtton:(id)sender;
- (IBAction)AdjustVolume:(id)sender;

- (IBAction)ProgressSlider:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *PlayPauseBtn;
@property (weak, nonatomic) IBOutlet UISlider *VolumeSlider;
@property (weak, nonatomic) IBOutlet UISlider *ProgessSlider;
@property (weak, nonatomic) IBOutlet UILabel *curretnTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *DurationLbl;




@property(nonatomic,strong) AVAudioPlayer *player;
@property(nonatomic,strong) NSTimer *time;

-(NSString *)StringFromIntervel:(NSTimeInterval) intervel;
-(void)UpdateSlider;


@end

