# Loggly Graph Tools

This is a set of extensions to the loggly cloud logging service (www.loggly.com) 
that will add additional graphing featues.

The current features include

  * A line graph that will plot values from your logged data, useful if you
  * are capturing performance data in your logs and want to see a visual 
  * representation of it.
  
This project is being developed on cloud9 (http://c9.io/owenssam/loggly-graphtools),
contributions welcome.

## Using with Loggly

Firstly Load the extensions, the current stable version is hosted on heroku at
http://loggly-graphtools.herokuapp.com/ so use the command:
  
    load http://loggly-graphtools.herokuapp.com/ 
  
to load the extensions into the Loggly command line
 
Once loaded you can pipe output from a search into the perfstats command
like so 

    search | perfStats json.ExecutionTime

The parameter tells the perfStats command which property to plot on the 
graph.




