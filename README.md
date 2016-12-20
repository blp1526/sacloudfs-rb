# sacloudfs-rb

Sorry, now experimental version.

## Requirements

FUSE for your OS.

## Installation

First of all, you have to create SAKURA Cloud API key.

Read [this slide](http://www.slideshare.net/eisakuterao/20160619-sakuracloudap-iatoscdo) from 29 to 34.

```
$ git clone https://github.com/blp1526/sacloudfs-rb.git
$ cd repo_dir
$ bundle install
$ cp .sacloudfs.yml.sample ~/.sacloudfs.yml
$ vi ~/.sacloudfs.yml
```

Set your ACCESS TOKEN and ACCESS TOKEN SECRET to ~/.sacloudfs.yml.

## Usage

### mount

terminal A

```
$ bundle exec rake sacloudfs:mount mount_dir
```

terminal B

```
$ ls mount_dir
```

### unmount

```
$ fusermount -u mount_dir
```

## License

This is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
