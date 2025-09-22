Follow the appropriate tutorial to install Kali!

File > Preferences > Input 
	to view Host Key for shortcuts
- Host + F : Fullscreen VM

Now within the terminal follow the remaining instructions.

## Setup Share Folder:

```
mkdir share
cd share
echo $(hostname)
echo "hello this is $(hostname)" > hello.txt
```
## Build Index Page


```
#!/usr/bin/bash

echo '<!doctype html><meta charset="utf-8"><title>My Files</title><h1>My Files</h1><ul>' > index.html

for f in *; do
  [ -f "$f" ] || continue
  printf '<li><a href="%s">%s</a></li>\n' "$f" "$f" >> index.html
done

echo '</ul>' >> index.html
```

Hopefully this is a better line by line explanation than what I explained in the workshop:
`echo` writes out the starting HTML tags and **rewrites** what is in the index.html file because of the redirection. 

Quick HTML explanation, HTML is Hypertext Markup Language and is the programming language that is used to render and display webpages by your browser. HTML works by displaying the contents of a .html file written in different sections such as headings `<h1></h1>` lists `<l1></l1>` paragraphs `<p></p>` and body `<b></b>` and renders the contents in between based on the surrounding tags. 

Tags in html are in the format `<tag></tag>`  
- The first brackets `<>` are opening tags
- The second brackets with a slash `</>` are closing tags
In HTML almost all tags except a few special ones need closing tags.\

`<!doctype html>`
> The HTML Doctype declaration is used in HTML documents to specify the document type and version of HTML being used.
> This is needed at the beginning of all HTML files! Kinda like the shebang in bash (#!)

`<meta charset="utf-8">`
> This tells the browser which renders your webpage what character encoding to use that way it can load the characters and symbols we want to display to our webpage!

`for f in *;` 
> starts a loop: `*` expands to every item(file) in the current folder.

`[ -f "$f" ] || continue` 
> tests if the file is a regular file, if it fails the condition it "continues" skipping the file and not adding it.

`printf '<li><a href="%s">%s</a></li>\n' "$f" "$f" >> index.html` 
> \>> appends to the index.html file

`echo '</ul>' >> index.html` 
> appends the unordered list end tag to the file

Redirection **>** versus >>
> \> rewrites the contents of a file
> \>> adds to the end of a file (appends)

I for f in \*; do 
> Expands to every file sets f to filename for every file (iterates once through the loop for every file)


## Host Local Network Server
```
RUN THE FILE 
if it doesn't run use chmod! (change the read (r), write (w), execute (x) permissions)
chmod +x scriptName.sh

//start server
python3 -m http.server 8000

CHECK OUT THE WEBSITE!

localhost:8000/index.html
or
0.0.0.0:8000/index.html
```

You should see something like:
<img width="1552" height="825" alt="image" src="https://github.com/user-attachments/assets/dcbfca0c-7181-47d1-ae32-938f2937e520" />

## Download Someone Else's Hello.txt!
So, if you are on Baylor Wifi this part will not work for you... HOWEVER it will work on devices on the same mobile hotspot!

This is what makes the project like a local network FTP server, assuming another person knows your IP address and the name of the file they want to get.

**Change VM settings in Virtual Box, I suggest using the Bridged Adapter as that is the easiest.**
Close VM
Close VM
VirtualBox > Select the VM you want to use > Settings > Network > Adapter 1 > Change "Attached To" (Bridged Adapter)

*You should be able to leave the name of adapter the same*

Options:
1.  Port Forwarding (Set a new rule with the following)
	1. Host IP: 127.0.0.1
	2. Host Port: same as http server (8000)
	3. Guest IP: hostname -I
	4. Guest Port: same as http server (8000)
2. **Bridged Adapter (:D)**
3. Host-only adapter (don't do stupidly confusing)


Now giving someone else (or yourself) the IP address of the machine
> `hostname -I` : to get your IP address
```
curl -O http://a.b.x.y:8000/hello.txt

wget http://a.b.x.y:8000/hello.txt
```
and if run successfully the file will be downloaded to the directory you are currently in within the terminal!

