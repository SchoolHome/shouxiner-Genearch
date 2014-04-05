//
//  convertPcmToAmr.h
//  TPCM2AMR
//
//  Created by lixiaosong on 12-5-18.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#ifndef TPCM2AMR_convertPcmToAmr_h
#define TPCM2AMR_convertPcmToAmr_h
int convertPcmToAmr(char* audioPCMRecordPath, char* audioAMRPath, char * trans_temp_path,bool bChangeTone, float TempoChange, float PitchSemiTones, float RateChange);
int convertAmrToWav(char* audioAMRPath, char* audioWavPlayPath);
#endif
