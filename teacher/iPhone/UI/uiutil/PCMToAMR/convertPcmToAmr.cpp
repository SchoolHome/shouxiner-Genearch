#include "SoundTouch/SoundTouch.h"
#include "AMREncoder/amrFileCodec.h"
#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
//#include <unistd.h>
#include "SoundTouch/STTypes.h"
using namespace soundtouch;
//using namespace std;
#include "convertPcmToAmr.h"



#define BUFF_SIZE           2048

#define CHANNELS 1
// Processes the sound
static void process(SoundTouch *pSoundTouch, FILE *inFile, FILE *outFile)
{
	int nSamples;
	int nChannels;
	int buffSizeSamples;
	SAMPLETYPE sampleBuffer[BUFF_SIZE];

	if ((inFile == NULL) || (outFile == NULL)) return;  // nothing to do.

	nChannels = CHANNELS;
	assert(nChannels > 0);
	buffSizeSamples = BUFF_SIZE / nChannels;
	printf("sizeof(SAMPLETYPE) = %ld channel = %d\n",sizeof(SAMPLETYPE),nChannels);

	// Process samples read from the input file
	while (1)
	{
		int num;

		// Read a chunk of samples from the input file
		num = fread(sampleBuffer,sizeof(SAMPLETYPE), BUFF_SIZE,inFile);

		nSamples = num / nChannels;
		if(num <= 0){
			printf("num = %d\n",num);
			break;
		}
		// Feed the samples into SoundTouch processor
		pSoundTouch->putSamples(sampleBuffer, nSamples);

		// Read ready samples from SoundTouch processor & write them output file.
		// NOTES:
		// - 'receiveSamples' doesn't necessarily return any samples at all
		//   during some rounds!
		// - On the other hand, during some round 'receiveSamples' may have more
		//   ready samples than would fit into 'sampleBuffer', and for this reason 
		//   the 'receiveSamples' call is iterated for as many times as it
		//   outputs samples.
		do 
		{
			nSamples = pSoundTouch->receiveSamples(sampleBuffer, buffSizeSamples);
			fwrite(sampleBuffer, sizeof(SAMPLETYPE),nSamples * nChannels,outFile);

		} while (nSamples != 0);
	}

	// Now the input file is processed, yet 'flush' few last samples that are
	// hiding in the SoundTouch's internal processing pipeline.
	pSoundTouch->flush();
	do 
	{
		nSamples = pSoundTouch->receiveSamples(sampleBuffer, buffSizeSamples);
		fwrite(sampleBuffer,sizeof(SAMPLETYPE), nSamples * nChannels,outFile);
	} while (nSamples != 0);
}

static void ChangePcmTone(FILE *inFile, FILE *outFile, float TempoChange, float PitchSemiTones, float RateChange)
{
	SoundTouch soundTouch;

	// Setup the 'SoundTouch' object for processing the sound

	soundTouch.setSampleRate(8000);
	soundTouch.setChannels(1);

	soundTouch.setTempoChange(TempoChange);
	soundTouch.setPitchSemiTones(PitchSemiTones); //’˝œÚ «x÷·¿≠≥§£¨4±»Ωœ¿ÌœÎ
	soundTouch.setRateChange(RateChange);     //’˝œÚ «x÷·¿≠≥§£¨50

	//soundTouch.setTempoChange(20);
	//soundTouch.setPitchSemiTones(6.0f); //’˝œÚ «x÷·¿≠≥§£¨4±»Ωœ¿ÌœÎ
	//soundTouch.setRateChange(0);     //’˝œÚ «x÷·¿≠≥§£¨50

	//soundTouch.setTempoChange(1.0);
	//soundTouch.setPitchSemiTones(20);
	//soundTouch.setRateChange(-2.0);

	soundTouch.setSetting(SETTING_USE_QUICKSEEK, 0);
	soundTouch.setSetting(SETTING_USE_AA_FILTER, 1);
	soundTouch.setSetting(SETTING_SEQUENCE_MS, 40);
	soundTouch.setSetting(SETTING_SEEKWINDOW_MS, 15);
	soundTouch.setSetting(SETTING_OVERLAP_MS, 8);

#if 0
	if (params->speech)
	{
		// use settings for speech processing
		soundTouch.setSetting(SETTING_SEQUENCE_MS, 40);
		soundTouch.setSetting(SETTING_SEEKWINDOW_MS, 15);
		soundTouch.setSetting(SETTING_OVERLAP_MS, 8);
		fprintf(stderr, "Tune processing parameters for speech processing.\n");
	}
#endif
	// Process the sound
	process(&soundTouch, inFile, outFile);	
	fflush(outFile);
}

int convertPcmToAmr(char* audioPCMRecordPath, char* audioAMRPath, char * trans_temp_path,bool bChangeTone, float TempoChange, float PitchSemiTones, float RateChange)
{
	int nRet = 0;
	//∂¡»°Œƒº˛
	FILE *fPCMRecord, *fpcmChangeTones, *fEncodedAMR;

	if ((fPCMRecord = fopen(audioPCMRecordPath, "rb")) == NULL)
	{
		printf("Error opening input file  %s !!\n", audioPCMRecordPath);
		return 0;
	}
	printf("Input speech file:  %s\n", audioPCMRecordPath);

	if ((fEncodedAMR = fopen(audioAMRPath, "wb")) == NULL)
	{
		printf("Error opening output bitstream file %s !!\n", audioAMRPath);
		return 0;
	}
	printf("Output bitstream file:  %s\n", audioAMRPath);

	if (bChangeTone)
	{
		if ((fpcmChangeTones = fopen(trans_temp_path, "wb＋")) == NULL)
		{
			printf("Error opening ChangeTonesTemp bitstream file !!\n");
			return 0;
		}
		printf("Output bitstream file:  ChangeTonesTemp\n");

		ChangePcmTone(fPCMRecord, fpcmChangeTones, TempoChange, PitchSemiTones, RateChange);	

		//fseek(fpcmChangeTones, 0, SEEK_SET);		
        fclose(fpcmChangeTones);
        if ((fpcmChangeTones = fopen(trans_temp_path, "rb")) == NULL)
        {
            printf("Error opening input file  %s !!\n", trans_temp_path);
            return 0;
        }
		nRet = EncodePCMFileToAMRFile(fpcmChangeTones, fEncodedAMR, 1, 16);		

		fclose(fpcmChangeTones);
	}
	else
	{
		nRet = EncodePCMFileToAMRFile(fPCMRecord, fEncodedAMR, 1, 16);
	}

	fclose(fPCMRecord);
	fclose(fEncodedAMR);

	return nRet;
}
int convertAmrToWav(char* audioAMRPath, char* audioWavPlayPath)
{
	int nRet = 0;
	
//	FILE *fPCMPlay, *fpcmChangeTones, *fEncodedAMR;
    FILE *fPCMPlay, *fEncodedAMR;
    
	if ((fEncodedAMR = fopen(audioAMRPath, "rb")) == NULL)
	{
		printf("Error opening input bitstream file %s !!\n", audioAMRPath);
		return 0;
	}
	printf("Input bitstream file:  %s\n", audioAMRPath);

	if ((fPCMPlay = fopen(audioWavPlayPath, "wb")) == NULL)
	{
		printf("Error opening output file  %s !!\n", audioWavPlayPath);
		return 0;
	}
	printf("Output speech file:  %s\n", audioWavPlayPath);
	
	
	nRet = DecodeAMRFileToWAVFile(fEncodedAMR, fPCMPlay, audioWavPlayPath);	

	fclose(fEncodedAMR);
	fclose(fPCMPlay);	

	return nRet;
}
/*
int  main(int argc, char *argv[])
{
	//argv[1] ≈–∂œ «±‡¬Îªπ «Ω‚¬Î
	int nIsEncode = atoi(argv[1]);
	if (nIsEncode)
	{
		if (convertPcmToAmr(argv[2], argv[3], true, 20, 6, 0))
		{
			printf("convertPcmToAmr Done!\n");
		}
		else
		{
			printf("convertPcmToAmr failed!\n");
		}
	}
	else
	{
		if (convertAmrToWav(argv[3], argv[2]))
		{
			printf("convertAmrToWav Done!\n");
		}
		else
		{
			printf("convertAmrToWav failed!\n");
		}
	
	}	
	
	return 0;
}
*/
