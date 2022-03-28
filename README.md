Programming assessment - iOS
As part of the hiring process, we would like to see a small iOS app fully authored by you. Once submitted, your code will be reviewed by your potential colleagues, who will dissect it with the same care as if it were a PR to be merged into our codebase. Keep this in mind, as we will equally look at how you approach versioning, as your code style consistency, naming, testing strategy, code layering, architecture, lifecycle gotchas, handling of failures, application of good programming practices etc.
After the review, the reviewers get together and attempt to understand if you could be a good fit for the team. If so, a fun conversation awaits! You’ll be invited to a follow-up interview to discuss the code from your assessment, and all the interesting things related to good programming. If your approach is not to our liking, you’ll still be given feedback about what we did and did not appreciate about the code: this is to make sure you also get something in return for taking the time to do our test.
These are the requirements for our programming assessment:
• Use the Dutch Rijksmuseum API, see documentation here: https://data.rijksmuseum.nl/object-metadata/api/ (API key to use: “0fiuZFh4”)
• We would like the app to have at least two screens:
o An overview page with a list of items (preferably a collection view)
▪ Shouldhavesectionswithheaders ▪ Itemsshouldhavetextandimage ▪ Pageshouldbepaginated
o A detailpage, with more details about the item
• Loading and converting JSON to objects should be asynchronous, a loading icon / animation
should be shown
• Automated tests should be present (full coverage not needed off course)
• No SwiftUI, no Reactive, no storyboards
Things we will be focussing on when reviewing:
• Architecture used
• Tests written
• Handling of failures (failed network calls, etc)
You’re free to use whichever library you’re used to in your own projects, without limitations. Just give us a heads-up if you reach for something more exotic that heavily impacts what the implementation looks like. After you’re done, send us the link to the repo.
Good Luck!

