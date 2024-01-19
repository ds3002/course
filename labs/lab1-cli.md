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
things using their "full path":

```
cat /home/nmagee/.bashrc
cat /home/nmagee/file1
```

This is extremely useful since it means *you do not have to change into a directory just to
work with its contents*.

## Working with Text Files

1. A simple, built-in text editor is called `nano`. To open `nano` with an empty, blank document
simply invoke the `nano` program:

```
nano
```

Within the page you see blank space where you will write contents, and a series of possible
commands at the bottom marked with the `^` character. This stands for the CONTROL key. If you
open a blank document, try writing several lines of text, complete with paragraph breaks and 
punctuation. When you're done, press `^X` to exit. Upper/lower case does not matter.

This will give you the following prompt:

```
Save modified buffer (ANSWERING "No" WILL DESTROY CHANGES) ? 
```

To save your buffer (your open document) just press the `Y` key. This will give you a final prompt:

```
File Name to write : 
```

Here you can name your file anything you want. It will be saved to the directory you were in
when you opened up `nano`.

2. `cat` out the contents of the file you just edited.

3. Now rename the file you just created by using the `mv` command. The syntax is:

```
mv <ORIGINAL-NAME> <NEW-NAME>
```

So if I just created `hello.txt` in `nano` earlier, I could rename it by moving it:

```
mv hello.txt hello
```
You can always move a file to a completely different location by using a full path reference.

```
mv hello.txt /another/directory/hello.txt
```

4. Pipe one command into another using the `|` character.

Above you saw how a `cat` command could be redirected into a file. There is also the `|` "pipe"
command when you want to couple the text output of one command and process it using a second (or more)
command. 

Since you know `cat` prints out the contents of a file, let's join it with the `wc` (word count)
command:

```
cat hello | wc
```

This should print out three numbers:

```
  171   812   4522
```
This means the file is 171 lines long, contains 812 words, and 4522 characters long.

You can always request one of these values at a time by using option flags with the `wc` command. If you would like a line count only, use `-l`:

```
cat hello | wc -l
```
For a word count only, use `-w`

```
cat hello | wc -w
```


