## Simple OpenSSH on Resin.io

This starts an openssh server on port 22. You can then ssh into the running container
using `ssh root@<YOUR-DEVICE'S-IP>` the default password for `root` is `resin`.

### Usage

This assumes you already have an account on resin.io, if you don't, then head over to our [Getting Started Guide][getting-started] and get yourself all set up.

1. Clone this repository and change into this directory:
```sh
$ git clone https://github.com/resin-io-projects/resin-openssh.git && cd resin-openssh
```

2. Add your resin.io application git remote:
```sh
$ git remote add resin my_resin_username@git.resin.io:my_resin_username/myApplication.git
```

3. Deploy your code to the device(s):
```sh
$ git push resin master
```

__Note:__ If you may need to use the `--force` option for the git push if you have previously deployed another repo to this application.

### Troubleshooting
At after pushing you may encounter and re-sshing back into the device you may encounter this error message as the host key changes when an update occurs on the device.


```sh
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@    WARNING: REMOTE HOST IDENTIFICATION HAS CHANGED!     @
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
IT IS POSSIBLE THAT SOMEONE IS DOING SOMETHING NASTY!
Someone could be eavesdropping on you right now (man-in-the-middle attack)!
It is also possible that a host key has just been changed.
```

To get around this remove the key.

```sh
$ ssh-keygen -R <YOUR-DEVICE'S-IP>
```

It will then work as expected

```sh
$ root@<YOUR-DEVICE'S-IP>
```

[resin-getting-started]:http://docs.resin.io/raspberrypi3/nodejs/getting-started/
