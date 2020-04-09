package config

type Configuration struct {
	ServerDomain    string       `json:"server_domain"`
	LiveRTMPServers []RTMPServer `json:"live_rtmp_servers"`
	TestRTMPServers []RTMPServer `json:"test_rtmp_servers"`
	Storage         Storage      `json:"storage"`
}

type RTMPServer struct {
	URL       string `json:"url"`
	StreamKey string `json:"stream_key"`
}

type Storage struct {
	S3BucketName       string `json:"s3_bucket_name"`
	AWSAccessKeyID     string `json:"aws_access_key_id"`
	AWSSecretAccessKey string `json:"aws_secret_access_key"`
	RecordingDirectory string `json:"recording_directory"`
}
