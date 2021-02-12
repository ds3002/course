# Scripts

All scripts should be written in a way that takes into account several factors:
  (a) What environment will it run in? 
  (b) What resources does it need in order to execute successfully? 
  (c) How will it be fed the information it needs in order to execute?
  (d) What will the script do if it throws an error?

## bash

### shebang
A well-formatted `bash` script begins with a "shebang" line:
```
#!/bin/bash
```
that points to the full path of the `bash` shell. This may differ from one environment
to the next.

### Use full paths

Any binary executables used in a shell script should be invoked using their full
paths. This is to avoid any ambiguity and preempt any errors of a shell not being
able to find the command.

For example, when invoking the `aws` command-line in a script you would normally call
```
/usr/local/bin/aws
```
To determine the full path of an executable in a given system, use the `which` command:
```
which aws
```

### Graceful Errors

In most `bash` shell scripts you may `set -e` near the head of the script. This flag
tells the script that, upon any error, it should escape/exit the script and stop running.
This is important since to proceed past an error may produce very bad results or
unintended consequences.

Another option is to use conditional, such that when a specific line of the script
fails to execute, the failed line can `exit` with a non-zero code. This can be a useful
output for debugging

### Sleep

If you need a deliberate pause in the middle of a script, simply `sleep 5` for a 5-second
pause, etc. This may be especially useful in the midst of `try` logic.

## Python3
