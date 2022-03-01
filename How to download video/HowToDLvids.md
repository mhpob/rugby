# How to download videos quickly

With the increasing availability of match film (streams/YouTube/Vimeo/etc.) as well as the growing use of the [Advantage system](https://www.usarugby.org/2017/03/advantage-offerings-available-to-local-referee-organizations-with-new-partnership), I often need to quickly and easily download match film from a variety of different sources. The method outlined here involves downloading and installing a few very small programs, but it doesn't require you to watch anything, operates in the background, and downloads rather quickly. Installation is different on Windows and macOS; both are outlined below. Here's what I did:

### [Download and Installation of Programs](#download-and-installation-of-programs)
#### [On Windows](#using-windows)
1. [Download youtube-dl](#download-youtube-dl)
2. [Download FFmpeg](#download-ffmpeg)
3. [Move `youtube-dl.exe` to `.../ffmpeg/bin`](#move-youtube-dlexe-to-ffmpegbin)
4. [Add `.../ffmpeg/bin` to your PATH](#add-ffmpegbin-to-your-path)
5. [Check installation using Command Prompt](#check-installation-using-command-prompt)
#### [On macOS](#using-macos)
1. [Install Homebrew](#install-homebrew)
2. [Install youtube-dl](#install-youtube-dl)
3. [Install FFmpeg](#install-ffmpeg)
 
### [Download/Clip Video](#downloading-video)
* [Simple downloads (usually 15s)](#simple-download)
* [Dealing with password protection](#password-protection)
* [Downloading playlists and combining videos](#playlists-and-combining-videos)
* [Clipped downloads (usually 7s)](#clipped-download)
* [Websites that don't play nicely](#the-more-difficult-streams)
* [Other tips and tricks](#down-the-rabbit-hole)

## Download and Installation of Programs
### Using Windows
#### Download [yt-dlp](https://github.com/yt-dlp/yt-dlp#readme)
This is a program that uses command-line inputs and can download almost any type of stream I've come across, including [YouTube](https://www.youtube.com/), [Vimeo](https://vimeo.com/), [Facebook Live](https://live.fb.com/), and [UStream](http://www.ustream.tv/) (what [Infinity Park](http://www.ustream.tv/channel/rugbytown-usa) often uses to broadcast matches).

[Click here](https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp.exe) to download the latest version for Windows.

#### Download [FFmpeg](http://ffmpeg.org/)
This is a program that uses command-line inputs to edit, convert, and do a whole bunch of other things to audio and video files. While `yt-dlp` will do the downloading, `FFmpeg` will do the trimming of longer videos.

Go to the [FFmpeg download page](http://ffmpeg.org/download.html) and download the correct version for your operating system. Don't click the big green "Download" button--you probably want the Windows installer instead.

<p align="center">
 <img src="https://gist.github.com/mhpob/c3b4a6711ea803df9649/raw/2e6ea8a103d1be232cf0d9aa9d750f03d93b0ae1/ffmpeg_dl.png" alt="FFmpeg download website" width="50%">
</p>

You can click this "Download" button!
<p align="center">
 <img src="https://gist.githubusercontent.com/mhpob/c3b4a6711ea803df9649/raw/fd466c31757eb64bfd4e3a1a06332d35444ac6f7/zffmpeg_dl2.png" alt="FFmpeg Windows download" width="50%">
</p>

Go into a folder (I chose `C:/Program Files` since that's where my applications live), and create a new folder called "ffmpeg".

<p align="center">
 <img src="https://gist.github.com/mhpob/c3b4a6711ea803df9649/raw/2e6ea8a103d1be232cf0d9aa9d750f03d93b0ae1/newfolder_ffmpeg.png" width="50%">
</p>

Unzip the FFmpeg files and copy everything in the unzipped folder here.

#### Move youtube-dl.exe to .../ffmpeg/bin
Find where youtube-dl.exe was downloaded and move this file into the "bin" folder under the "ffmpeg" folder you just made.
<p align="center">
 <img src="https://gist.github.com/mhpob/c3b4a6711ea803df9649/raw/2e6ea8a103d1be232cf0d9aa9d750f03d93b0ae1/YT-dl_ffmpeg_tobin.png" width="50%">
</p>

#### Add `.../ffmpeg/bin` to your PATH
This is the tricky part; again, I only know how to make this work on Windows. Other operating systems might not even have to do this part.

1. Hit the Windows key and type "variables".

<p align="center">
 <img src="https://gist.github.com/mhpob/c3b4a6711ea803df9649/raw/2e6ea8a103d1be232cf0d9aa9d750f03d93b0ae1/var_search.png" alt="Search to change environmental variables" height="50%">
</p>

2. Select "Environmental Variables" in the bottom right of the window that pops up.

<p align="center">
 <img src="https://gist.github.com/mhpob/c3b4a6711ea803df9649/raw/2e6ea8a103d1be232cf0d9aa9d750f03d93b0ae1/var_change.png" alt="Change environmental variables" width="50%">
</p>

3. Under "User variables for...", click "New".

<p align="center">
 <img src="https://gist.github.com/mhpob/c3b4a6711ea803df9649/raw/94c3a9bd92da84971cc60f33f9e60add50403586/PATH_install.png" alt="New PATH" width="50%">
</p>

4. Variable Name = PATH

<p align="center">
 <img src="https://gist.github.com/mhpob/c3b4a6711ea803df9649/raw/94c3a9bd92da84971cc60f33f9e60add50403586/PATH_install2.png" alt="New PATH" width="50%">
</p>

5. Browse for where you moved all of the FFmpeg files.

<p align="center">
 <img src="https://gist.github.com/mhpob/c3b4a6711ea803df9649/raw/94c3a9bd92da84971cc60f33f9e60add50403586/PATH_install3.png" width="50%">
</p>

6. Hit "OK"

#### Check installation using Command Prompt
Hit the Windows key and type "cmd" to open the Command Prompt. Type "ffmpeg" and hit enter. If a bunch of information pops up, it's installed properly. Type "yt-dlp" and hit enter. If it tells you that you need to provide a URL, it's installed properly.

Ignore that I typed in "youtube-dl" in this picture -- we still want "yt-dlp".
<p align="center">
 <img src="https://gist.github.com/mhpob/c3b4a6711ea803df9649/raw/2e6ea8a103d1be232cf0d9aa9d750f03d93b0ae1/install_check.png" width="75%">
</p>

### Using macOS
#### Install Homebrew
[Homebrew](https://brew.sh/) is a package manager for macOS. Installing it makes everything else pretty straightforward. To install it, open Terminal by pressing Command+Space, typing "terminal", and pressing enter. Paste the following into the Terminal prompt and press enter:

```
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

If it asks for your password, enter the password to your computer's user profile and hit enter. You won't see the characters as you enter them.

<p align="center">
 <img src="https://gist.github.com/mhpob/c3b4a6711ea803df9649/raw/884b0723c0a26822de6300e840487f73be65bfcb/macOS_homebrew.png" width="75%">
</p>

#### Install youtube-dl
In the Terminal, paste the following:

```
brew install yt-dlp/taps/yt-dlp
```
Check that installation was successful by typing `yt-dlp` and pressing enter. If your error looks like the following, you're good to go:

<p align="center">
 <img src="https://gist.github.com/mhpob/c3b4a6711ea803df9649/raw/884b0723c0a26822de6300e840487f73be65bfcb/macOS_ytdl_check.png" width="75%">
</p>

#### Install FFmpeg
In the terminal, paste the following:

```
brew install ffmpeg
```
Check that installation was successful by typing `ffmpeg` and pressing enter. If your error looks like the following, you're good to go:

<p align="center">
 <img src="https://gist.github.com/mhpob/c3b4a6711ea803df9649/raw/884b0723c0a26822de6300e840487f73be65bfcb/macOS_ffmpeg_check.png" width="50%">
</p>

## Downloading Video
### Simple download
Want to download a complete video? That's super easy now that everything is installed.

Open the Command Prompt/Terminal. Type the following, replacing the URL below with that of your video.

```
yt-dlp http://www.youtube.com/yourvideo
```

Done!

This method also works with videos on Facebook, Vimeo, ESPN, NBCSports... [the list goes on](https://github.com/yt-dlp/yt-dlp/blob/master/supportedsites.md).

## Password protection
Some videos, especially those that teams post on Vimeo, are password protected. To get at the video, use the argument `--video-password` after the call to `yt-dlp`.

```
yt-dlp https://vimeo.com/188625468 --video-password “Purple Strength”
```

### Playlists and combining videos
Sometimes, teams will post match film to YouTube in a series of videos, especially when they pause recording at stoppages. `yt-dlp` will download all of the videos at once by plugging in the playlist URL.

```
yt-dlp https://www.youtube.com/playlist?list=TEAMPLAYLIST1234
```

Unfortunately, these will wind up being completely separate videos. We can add another argument (`--concat-playlist always`) to have the program join them up for us.

```
yt-dlp https://www.youtube.com/playlist?list=TEAMPLAYLIST1234 --concat-playlist always
```

But what if the two videos were not downloaded as a playlist? Things get a little bit less straightforward. We'll use `ffmpeg` to combine all of these into one.

Save a `.txt` file containing the location of each file you'd like to combine in the order you'd like them combined. Make sure each line starts with the word "file". It should look something like this:

```
file "desktop/myvideo1.mp4"
file "desktop/myvideo2.mp4"
file "desktop/myvideo2.mp4"
```

Once this is done, open the Command Prompt (Windows key + "cmd") or Terminal (Cmd+Space + "terminal"). Type the following, replacing the inputs with that of the text file and what you want to call the resulting video.

```
ffmpeg -f -safe 0 -i "TEXT FILE" -codec copy "FILE NAME"
```
* "TEXT FILE" is the location on your computer of the file we made above. Something like "C:/users/mike/desktop/input.txt"
* "FILE NAME" is what you want to name the file. It should end in ".mp4" or some other video format.

### Clipped download
Only want part of a multi-hour stream? Figure out where your match starts and ends (hours, minutes, and seconds into the stream).

Bring up the Command Prompt (hit the Windows key and type "cmd", or CMD+Space+"terminal" in macOS). Type the following:

```
ffmpeg -ss STARTTIME -i "STREAM URL"" -to ENDTIME -c copy -copyts "FILE NAME"
```
* "STARTTIME" is the beginning timestamp of your match. HH:MM:SS.S
* "STREAM URL" is the URL of the stream. If the download doesn't work the first time around, try it again, but with this in quotes.
* "ENDTIME" is the end timestamp of your match. HH:MM:SS.S
* "FILENAME" is what you want to name the file. It should end in ".mp4" or some other video format.

So, to download a 1 minute section of one of my matches this summer:

```
ffmpeg -ss 02:06:55.0 -i http://main.soundque.com:1935/vod/USAR08082015f2.mp4/chunklist_w149588290.m3u8 -to 02:07:55.0 -c copy -copyts ob_army_platesemi.mp4
```

Alternatively, you can list the length of time you'd like to download by dropping `-copyts` and using `-t` instead of `-to`.

```
ffmpeg -ss 02:06:55.0 -i http://main.soundque.com:1935/vod/USAR08082015f2.mp4/chunklist_w149588290.m3u8 -t 00:01:00.0 -c copy ob_army_platesemi.mp4
```

Note: this only works if you use the direct file URL. You can get this by typing the following and pasting one of the output URLs into the code above:

```
yt-dlp -g https://www.youtube.com/thevideoURL
```

### The more difficult streams
Just to warn you: some streams may take a bit of extra digging, but it's fast and easy once you know what to look for. Make sure FFmpeg is installed and working before proceeding.

1. Go to the webpage of the video you'd like to download. Right click and select "Inspect" (here I'm using Chrome).

<p align="center">
 <img src="https://gist.github.com/mhpob/c3b4a6711ea803df9649/raw/5a4f06d2774ee4aa12b8f36280efa5b8bec3010a/zflo_inspect.png" width="50%">
</p>

2. A window will open with the HTML code that makes up the website. Look around for a tab named "Network". Click it, then type ".m3u8" in the box on the top left that says "filter". Refresh the webpage. Some lines will start streaming by--copy the link address of one of the lines.

An [M3U8 file](https://www.lifewire.com/m3u8-file-2621956) is what most video players use to load streams, which is why this works. Basically, it points the program to the media file on the website's servers, which you download directly.

<p align="center">
 <img src="https://gist.githubusercontent.com/mhpob/c3b4a6711ea803df9649/raw/388cb2970b1febe9e3897dff011935e18182f33d/m3u8.gif">
</p>

3. Open the command prompt and type the following, replacing "YOUR ADDRESS" with the URL you just copied. **If there are spaces in the URL, this must be in quotes to work.**

```
yt-dlp "YOUR ADDRESS"
```

Downloading FloRugby's "Shorts Challenge" would look like this:

```
yt-dlp https://player.ooyala.com/hls/player/all/JhdGZnZzE64_-Mntz-AQIDiATi3mrRPL/media/4000.m3u8
```

<p align="center">
 <img src="https://gist.githubusercontent.com/mhpob/c3b4a6711ea803df9649/raw/9edbbcabbed30de7a2f99f1b7adfad6c47d66367/zflo_dl.gif">
</p>

You can combine this with the clipping code above if you only want a section. Place the `-ss` section before the URL and the `-t` after.

```
ffmpeg -ss 00:58 -i "https://player.ooyala.com/hls/player/all/JhdGZnZzE64_-Mntz-AQIDiATi3mrRPL/media/4000.m3u8" -t 00:05 -c copy shorts_clipped.mp4
```

### Down the rabbit hole
Sometimes things don't work as nicely as I hope they would. I'll keep this section updated with some other tricks.

#### ESPN+
DRM makes everything tough. Now that Iona and Harvard broadcast their matches through [ESPN+](http://www.espn.com/watch/espnplus/), others will probably follow suit. Or, maybe you just want to grab a clip from one of the professional matches for which ESPN has the rights. We'll need to jump through some hoops to download the ESPN+ content regardless.

1. Log into ESPN+ and find the video you'd like to download.
2. In Chrome, right click and select `Inspect`, then `Network` as outlined above.
3. Refresh the page.
4. Filter for "entitlements"; under "Request Headers" one link will have `dss-session-token:` followed by a lot of characters. Copy and paste these somewhere.

5. Filter for "m3u8", copy the link to the m3u8 of choice.
<p align="center">
 <img src="https://gist.githubusercontent.com/mhpob/c3b4a6711ea803df9649/raw/6dd888672cec2076a2665e38a247a46cb16d3c45/espn_m3u8.gif">
</p>
6. Run the following, inserting the copied key and m3u8 url:

```
yt-dlp --add-header "Authorization:**pasteDSSTOKENhere**" "**m3u8URLhere**"
```

## THE END
PS: There are a bunch of other things you can do with both `yt-dlp` and `FFmpeg`. For more documentation/help, visit their websites:

[yt-dlp](https://github.com/yt-dlp/yt-dlp#readme)

[FFmpeg](http://www.ffmpeg.org/ffmpeg.html)
