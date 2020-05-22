package config

type ServerConfiguration struct {
	Domain         string      `json:"domain"`
	LiveRTMPRelays []RTMPRelay `json:"liveRtmpRelays"`
	TestRTMPRelays []RTMPRelay `json:"testRtmpRelays"`
	Storage        Storage     `json:"storage"`
}

type RTMPRelay struct {
	URL       string `json:"url"`
	StreamKey string `json:"streamKey"`
}

type Storage struct {
	S3BucketName       string `json:"s3BucketName"`
	AWSAccessKeyID     string `json:"awsAccessKeyId"`
	AWSSecretAccessKey string `json:"awsSecretAccessKey"`
	RecordingDirectory string `json:"recordingDirectory"`
}
