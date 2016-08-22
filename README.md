
## Technologies Stack:

  * Rails - simple because I know it better then any other frameworks and I want to save some time during development
  * Postgresql - just a personal taste mostly because I like it. Later it can play good role for implementing Fuzzy Search for example

## Improvements:

  * Use [Whenever gem](https://github.com/javan/whenever) to sync every N hours.
  * Cache test results (for example using VCR) to avoid hit remote server each time.
  * Extract Packages Parser into a gem
  * Extract Authors and Maintainers into separate table with splitted name and email
