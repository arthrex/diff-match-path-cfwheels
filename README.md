cfwheels-diffmatchpatch
============

CFWheels plugin that uses the Diff Match and Patch libraries from Google, that offer robust algorithms to perform the operations required for synchronizing plain text.

The source for the current .jar file is from:
`http://google-diff-match-patch.googlecode.com/svn/trunk/maven/diff_match_patch/diff_match_patch/current/`
which is hosted at
`https://code.google.com/p/google-diff-match-patch/`


# Example
```CF
<cfscript>
var loc = {};
loc.diff = diff_prettyHtml(stringBefore="a", stringAfter="ab");
loc.diff2 = diff_prettyHtml(stringBefore="ab", stringAfter="aabb");
dump(loc);
</cfscript>
``` 