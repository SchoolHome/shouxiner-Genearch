#ifndef amrFileCodec_h
#define amrFileCodec_h

#define AMR_MAGIC_NUMBER "#!AMR\n"

#define PCM_FRAME_SIZE 160 // 8khz 8000*0.02=160
#define MAX_AMR_FRAME_SIZE 32
#define AMR_FRAME_COUNT_PER_SECOND 50

#include <string>

typedef struct
{
    char chChunkID[4];
    int nChunkSize;
}XCHUNKHEADER;

typedef struct
{
    short nFormatTag;
    short nChannels;
    int nSamplesPerSec;
    int nAvgBytesPerSec;
    short nBlockAlign;
    short nBitsPerSample;
}WAVEFORMAT;

typedef struct
{
    short nFormatTag;
    short nChannels;
    int nSamplesPerSec;
    int nAvgBytesPerSec;
    short nBlockAlign;
    short nBitsPerSample;
    short nExSize;
}WAVEFORMATX;

typedef struct
{
    char chRiffID[4];
    int nRiffSize;
    char chRiffFormat[4];
}RIFFHEADER;

typedef struct
{
    char chFmtID[4];
    int nFmtSize;
    WAVEFORMAT wf;
}FMTBLOCK;

// WAVE音频采样频率是8khz 
// 音频样本单元数 = 8000*0.02 = 160 (由采样频率决定)
// 声道数 1 : 160
//        2 : 160*2 = 320
// bps决定样本(sample)大小
// bps = 8 --> 8位 unsigned char
//       16 --> 16位 unsigned short


class ri{
	
};

class AmrEncode
{
	
public:
	AmrEncode(){};
	~AmrEncode(){};
	
	
	
	//std::string m_pchAMRFileName;
	
	FILE* m_fpamr;
	
	int   m_nChannels;
	
	int   m_nBitsPerSample;
	/* pointer to encoder state structure */
    int *m_enstate;
	
	
	char  m_data[1024*1024*2];//2M
	
	int   m_attachlen;
	
	int   m_writelen;
	
	
	char* m_cur;
	
	
	
	int timeinerval;//the record time
	
	void attachdata(char* buffer,int len);
	
	
	void  init();
	
	void  open(const char* pchAMRFileName);
	
	void  close();
	
	int   EncodeBufferToAMRFile();
	
	int   ProcessPCMFrame(short speech[], int nChannels, int nBitsPerSample);
	
	
	
};

int EncodePCMFileToAMRFile(FILE* fppcm, FILE* fpamr, int nChannels, int nBitsPerSample);

// 将AMR文件解码成WAVE文件
int DecodeAMRFileToWAVFile(FILE* fpamr, FILE* fpwav, char* audioWavPlayPath);

#endif
