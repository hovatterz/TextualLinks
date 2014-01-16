# TextualLinks

Plugin for Textual IRC client that allows you to open links without clicking them

After links have been posted in a channel, just type `/links` to get a list
of them. They will have ids next to them. Type `/links 0` to open the first
one and so on and so forth.

The ids are incremented whenever a link is found up to the MAX_IDS (currently
hardcoded as 10). Once it is reached, the count starts over and old links are
overwritten.

Someday I will probably update this with build instructions and how to install.
For now you will need to learn how to setup plugins with Textual on your own.

## License

The MIT License (MIT)

Copyright (c) 2014 Zack Hovatter

Permission is hereby granted, free of charge, to any person obtaining a
copy
of this software and associated documentation files (the "Software"), to
deal
in the Software without restriction, including without limitation the
rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
