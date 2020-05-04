<template>
    <video
        id="video-player"
        controls
        preload="auto"
        width="640"
        height="264"
        poster="{{thumbUri}}"
        data-setup="{}">
    <source src="{{sourceUri}}" type="{{mimeType}}" />
    <p class="vjs-no-js">
        To view this video please enable JavaScript, and consider upgrading to a
        web browser that
        <a href="https://videojs.com/html5-video-support/" target="_blank">supports HTML5 video</a>
    </p>
</video>
</template>

<script>
    export default {
        name: "videoPlayer"
    }
</script>

<style scoped>

</style>