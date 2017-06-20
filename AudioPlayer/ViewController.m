//
//  ViewController.m
//  AudioPlayer
//
//  Created by Mac on 13/06/17.
//  Copyright © 2017 Mac. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSURL *url=[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"01 Prem Mein Tohre (Asha Bhosle) 190Kbps" ofType:@"mp3"]];
    
    
    NSError *error;
    self.player= [[AVAudioPlayer alloc]initWithContentsOfURL:url error:&error];
    
    
    
    
    if (error) {
        NSLog(@"Error-:%@",error.localizedDescription);
    }else{
        _player.delegate=self;
        _ProgessSlider.value=0.0;
        _VolumeSlider.value=0.5;
        _DurationLbl.text=[self StringFromIntervel:self.player.duration];
    }
    if (_player.duration<=3600) {
        self.curretnTimeLabel.text=[NSString stringWithFormat:@"00.00" ];
    }else{
        _curretnTimeLabel.text=[NSString stringWithFormat:@"0.00.00"];
    }
    [_curretnTimeLabel sizeToFit ];
    [_player prepareToPlay];
    
    

}



-(NSString *)StringFromIntervel:(NSTimeInterval)intervel{
    
    NSInteger ti=(NSInteger)intervel;
    int second= ti % 60;
    int minut=(ti/60)%60;
    int stundent=(ti/3600);
    
    if (ti<=3600) {
        return  [NSString stringWithFormat:@"%02d","%02d",minut,second ];
    }
    return  [NSString stringWithFormat:@"%d,%02d","%02d",stundent,minut,second ];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(void)UpdateSlider{
    
   _ProgessSlider.value=self.player.currentTime;
    
    _curretnTimeLabel.text=[self StringFromIntervel:_player.currentTime];
}

- (IBAction)Btnstop:(id)sender {

    
    if (_player.isPlaying) {
        [_player stop];
    }
    [_player setCurrentTime:0.0];
    //[self.ProgressSlider ];
    //[self.VolumeSlider invalidate];
    
    _ProgessSlider.value=0.0;
    
    if (_player.duration<=3600) {
       _curretnTimeLabel.text=[NSString stringWithFormat:@"00.00" ];
    }else{
       _curretnTimeLabel.text=[NSString stringWithFormat:@"0.00.00"];
    }
    [_curretnTimeLabel sizeToFit];
    [_PlayPauseBtn setTitle:@"Play" forState:UIControlStateNormal];

}

- (IBAction)PlayPauseBUtton:(id)sender {


    
    if (!_player.playing) {
        _ProgessSlider.maximumValue=self.player.duration;
        
        _time=[NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(UpdateSlider) userInfo:nil repeats:YES];
        
        [_ProgessSlider addTarget:self action:@selector(ProgressSlider:) forControlEvents:UIControlEventValueChanged];
        
        [_player play];
        
        [_PlayPauseBtn setTitle:@"Pause" forState:UIControlStateNormal];
    }else if (self.player.playing){
        [_player pause];
        [_PlayPauseBtn setTitle:@"Play" forState:UIControlStateNormal];
        
    }

}

- (IBAction)AdjustVolume:(id)sender {


    
    if (_player!=nil) {
        _player.volume=self.VolumeSlider.value;
    }
}

- (IBAction)ProgressSlider:(id)sender {


    [_player stop];
    [_player setCurrentTime:self.ProgessSlider.value];
    [_player prepareToPlay];
    [_player play];
}


-(void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag{
    
}
-(void)audioPlayerDecodeErrorDidOccur:(AVAudioPlayer *)player error:(NSError *)error{
    
}
@end
