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

## Issues

- Links like `imgur.com` will not work (no http(s)://)
- Command output is printed with printDebugInformation
- Sorting of `/links` output is wrong
