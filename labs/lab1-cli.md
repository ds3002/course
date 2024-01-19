# Lab 1: The Command Line

Follow all the steps below for practice with the command line. At the bottom are instructions for commands you should write for each prompt, saved to a text file you create using the command line. Upload that file to the Lab assignment page for grading.
You can use the [**Google Shell**](https://cloud.google.com/shell) for these exercises. Open that page and click on "Go To Console".

## Getting Oriented to your Home Directory

1. Change directories to your home directory by issuing the `cd ~` command. `cd` is short for "change directory". This is a shortcut to your home directory.

```
cd ~
```

2. Learn the location of your home directory by issuing the `pwd` command. `pwd` is short for "present working directory". 

```
pwd
```

3. List all the contents in your home directory by using the `ls` command.

```
ls
```

Next try listing the contents in a more detailed view

```
ls -l
```

Next try listing all contents, including hidden files and directories

```
ls -al
```

Hidden files and directories start with a `.` such as `.ssh` or `.bashrc`.

Note that the `-al` flags (or options) do not have to be in any particular order. So you could also issue this command:

```
ls -la
```

5. Create two empty files by using the `touch` command

```
touch file1
touch file2
```

List the directory contents again to see the files listed.

Next, try creating two more files within the same command:

```
touch file3 file4
```

6. Add text contents to a file. You can use `echo` to pass some data into a file like this:

```
echo "Hi there everybody, my name is <YOUR NAME>" > file1
```

This command uses a "redirect" to take the `echo` command and push it into `file1`.
You could acually just `echo` out anything you want, at any time, but it only prints
to the screen and isn't recorded anywhere. Try it for yourself:

```
echo "Today is Friday"
echo "A man a plan a canal Panama"
```

7. View the contents of your file using `cat`. `cat` is short for concatenate, since it can
easily join files together, but it's often used simply for reading out the contents of a single
file.

```
cat file1
```

Should result in you seeing the command you echoed into it earlier. You can `cat` out other
files as well:

```
cat .bashrc
```

```
cat README-cloudshell.txt
```

8. Whenever you are in a directory you can read, edit, or list a file easily using its short
name, like this:

```
cat .bashrc
```

But every file or folder can be referred to by its full path within the file structure.
For example, my home directory in the Google Shell is `/home/nmagee`, so I can also cat
things using their full path:

```
cat /home/nmagee/.bashrc
cat /home/nmagee/file1
```

This is extremely useful since it means *you do not have to change into a directory just to
work with its contents*.

