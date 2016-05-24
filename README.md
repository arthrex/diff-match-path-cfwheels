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
loc.diffs = diff_main(stringBefore="a", stringAfter="ab"); //Getting Differences
writeOutput(diff_prettyHtml(loc.diffs)); //Showing the differences in HTML

loc.diffs2 = diff_main(stringBefore="ab", stringAfter="aabb"); //Getting Differences
diff_cleanupSemantic(loc.diffs2); //Cleaning up and make the differences readable for humans
writeOutput(diff_prettyHtml(loc.diffs2)); //Showing the differences in HTML
</cfscript>
``` 