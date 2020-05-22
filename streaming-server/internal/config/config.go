package config

type Configuration struct {
	StreamingServer ServerConfiguration `json:"streamingServer"`
	VideoSite VideoSiteConfiguration `json:"videoSite"`
}
