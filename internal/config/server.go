package config

type Server struct {
    ServerDomain string       `json:"server_domain"`
    RTMPServers  []RTMPServer `json:"rtmp_servers"`
}

type RTMPServer struct {
    Domain    string `json:"domain"`
    StreamKey string `json:"stream_key"`
}
