The InnerBand library aims to supplement everyday iPhone development with a set of classes, macros, components and constants that speed up development without abstracting the SDK away from you in any way.

# Why InnerBand? #

When I first started using Three20, I was in love with most aspects of it, including the new table architecture, CSS, and the URL-based navigation system.  I felt as if the ugly parts of the iPhone SDK were abstracted away and I no longer had to worry about implementing 12 hook methods to make a table.  Life was good!

As I was finishing my third project with it, I decided I'd had enough.  Here are the problems I'd run into over that time:

  1. New developers needed weeks to ramp up on the framework and were generally not happy with having to do everything differently than what they were used to.
  2. The new table architecture doesn't support caching and isn't useful for large tables.  Also, it's extremely frustrating to change the pre-packaged table cells or create new ones.
  3. The CSS system is a nice start, but it doesn't readily support most of the properties you will use for text fields.  It requires so much of your own development it's almost pointless.
  4. It obscures simple tasks.  For example, with the normal SDK, changing the status bar color is a simple entry in your app's plist.  With Three20, it requires overriding every one of your view controllers and good luck figuring out why it's not working when you discover this.
  5. Very little documentation for something that is largely overriding the SDK with its own.
  6. Including Three20 into your project requires importing almost a dozen projects that makes it difficult to browse the source when you're looking for something.
  7. The navigation system works great for simple transitions, but is hard to use (and breaks encapsulation) when you need to pass parameters, display and dismiss popups simultaneously, and avoid navigation controllers.

That's not to say there's not a lot of neat stuff in Three20.  Some of these problems can likely be avoided with deeper knowledge, but the lack of quality, updated documentation doesn't work well with developers who are trying to write apps with it.

That's why there's InnerBand!

# What goodies are available? #


With InnerBand, you get enhancements to the regular SDK you've been using all along.  Here's a quick summary of what you'll find:

## Components ##
	
InnerBand doesn't change the UI layer.  Want a button?  Create a glossy button in
one line with IBButton!
	
Need some rich text?  Don't wrap UIWebView on your own, there's so
many properties you need to remember to set.  Try IBHTMLLabel and you
can use it as if it was as simple as a UILabel.  Or go with
IBCoreTextLabel and use HTML syntax to display text without the heavy
UIWebView at all!

How about improving UIAlertView?  Why busy yourself with tagging
multiple alerts and putting your handling code somewhere far away from
where you called the alert?  The block-based alert methods do the
trick.  Here's its simplest form:

<pre>    [IBAlertView showAlertWithTitle:@"Title" message:@"My message." cancelTitle:@"Cancel" okTitle:@"OK" cancelBlock:^{
        NSLog(@"CANCEL CLICKED!");
    } okBlock:^{
        NSLog(@"OK CLICKED!");
    }];
</pre>    

Heck, since this case is so common, you can even write it as:

<pre>    [IBAlertView showOKCancelWithTitle:@"Title" message:@"My message." cancelBlock:^{
        NSLog(@"CANCEL CLICKED!");
    } okBlock:^{
        NSLog(@"OK CLICKED!");
    }];
</pre>    

Simple enough? :-)
	
## The Message Center ##
	
The Message Center improves upon NSNotificationCenter in every way.  A compact, essentially
simple system if you want it to be, the Message Center also goes way beyond if you allow it.
	
Passing notifications (DispatchMessage) lets you alert components to 
significant events in your application with a clean API:

<pre>[MessageCenter sendGlobalMessageNamed:COOKIES_ARE_READY];
</pre>	

Packaging data with the notification is just as easy:

<pre>[MessageCenter sendGlobalMessageNamed:COOKIE_READY withUserInfoKey:@"cookie" andValue:cookie];
</pre>	

But, DispatchMessage is even more powerful than that.  Each message
can support internal execution that allows you to run code
before the dispatch is made.  For example, you can create a
HTTPGetRequestMessage with a URL (and optional parameters) and
dispatch it as normal, but the asynchronous URL request will
be made and only when it's complete will the message be
dispatched.  The listeners will all have access to the output
when they receive it!
	
And we can go further than that.  A DispatchMessage object can be sequenced
within a SequencedMessage, chaining all of their inputs and outputs with each other so
that when all execution is complete the final output is dispatched.  Chain the
HTTPGetRequestMessage with your JSONMessage so that all listeners get the JSON
structure once the request is completed and parsed!
	
## Core Data ##
	
Core Data is a wonderful API, but the code required to perform anything requires
a lot of boilerplate code.  Even Apple places a lot of this in your AppDelegate!

There's a better solution.
	
Start a project as normal -- and don't select the Core Data checkbox so none of that
nasty code is added to your project. Import InnerBand
and now Core Data is ready to go!  Just go and create a new Core Data Model.
	
CoreDataStore provides methods for you to use to access data easily without leaving
that sloppy code lying around.  Methods such as allForEntity, entityByName,
removeEntity, removeAllEntitiesByName and (my personal favorite) clearAllData make
using Core Data the pleasure that it was supposed to be! But it gets even easier...
	
The new recommended way to use these methods is through a category on NSManagedObject.
For example, if you generated a CoreData class called Widget, you can now call
[Widget create] or [Widget all] to create or access them.  This is the better
way to go because it's compiler-checkable, but it does require that you generate
the classes with the same name as the entities.
	
And now, it's also thread-safe!  Create a private CoreDataStore on your thread with
[CoreDataStore createStore].  If you're on the main thread, you can access the
singleton with [CoreDataStore mainStore].  Remember, your NSManagedObject classes
cannot be passed between threads!
	
## Categories ##
	
InnerBand augments many of your favorite Cocoa classes with categories to make using them,
well, more useful!  None interrupt your normal development practices.  Use them or don't.
With them, you'll be able to do lots of cool stuff!
	
Create a color like a web developer with [UIColor colorWithHexString:@"#ff3344"].
	
Sort an array of strings with case- and diacritic- insensitivity simply with

<pre>[myArray sortedArrayAsDiacriticInsensitiveCaseInsensitive].
</pre>
	
(Diacritics are the squiggles you see on word like Peña or naïve.)

In addition, there are a whole host of new methods for NSArray and NSMutableArray for managing stacks and queues.
Or, you can try out the block-based methods like deleteIf and map to ease array re-generation.

Use handy properties on your UIViews.  Want the height your button?  myButton.height.
Want to move it down? myButton.top += 20.

Prefer to work with UTC rather than locale time?  Create an NSDate and you can use
properties like myDate.utcHour and myDate.utcDay.

There's so much more, too!  Check out the unit tests and find your favorites...
	
## Macros ##

Macros are a huge time saver!  InnerBand contains so many to choose from!
	
Box up a primitive integer into an NSNumber to store in an array with BOX_INT(5).
Unbox it back with UNBOX_INT(myNumber).
	
Free up memory cleanly with SAFE_RELEASE(myObject).
Re-assign memory with myObject = SAFE_ASSIGN(myObject, anotherObject).
	
Alter rectangles with RECT_INSET_BY_LEFT_TOP_RIGHT_BOTTOM(myRect, 50, 10, 5, 10).
Replace @selector(mySelector:) with the simpler SEL(mySelector:)
	
Validate your strings with IS_EMPTY_STRING(myStringOrObject) and
IS_POPULATED_STRING(myStringOrObject.)
	
Do some quick debugging with NSLog(RECT_TO_STR(myRect)).
	
And, again, so much more...
	
	
# Setting up InnerBand in your application #


There are two simple ways to include InnerBand in your application:

  1. Copy the Source
  2. Copy the Minified Source (same as above, but with only a single .h/.m pair)      

## Copy Source ##

Copying the InnerBand source into your project is the most flexible and lets you update XCode without rebuilding the library, however you will have to compile it after a clean.  Still, this is the most common approach iPhone developers take for 3rd-party libraries.

  1. Download an InnerBand source package (http://github.com/ZaBlanc/InnerBand/downloads) or clone the repository with:
	
	git clone git@github.com:ZaBlanc/InnerBand.git

  2. Create a new XCode iPhone project if you haven't already.

  3. Open the InnerBand sub-directory and copy the InnerBand/ directory into your project.  You can either copy it manually and choose to "Add Existing Files..." or drag-and-drop it directly.  (I prefer to include it in "Other Source" but you can put it anywhere you like.)

  4. Add the CoreData and CoreText framework to each target that will use InnerBand.

  5. Done!

## Copy Minified Source ##

Minified source is a brand new approach, borrowed from the JavaScript world, and allows you to drop a single .h/.m pair into your project rather than a whole directory of files.  As far as I know, no other projects do it this way yet, but I've always been more comfortable with importing a pair of files over big hierarchies.  So, I wrote a little script that creates one magically! :-)

1. Download an InnerBand source package (http://github.com/ZaBlanc/InnerBand/downloads) or clone the repository with:
	
	git clone git@github.com:ZaBlanc/InnerBand.git

2. Create a new XCode iPhone project if you haven't already.

3. From the Terminal, run InnerBand/minifier/minify.sh all. If you don't wish to include the UI components and just want the macros and extensions, run InnerBand/minifier/minify.sh core.
	
4. There should be two new files, InnerBand.h and InnerBand.m (or InnerBandCore.h and InnerBandCore.m), on your Desktop.  Copy them into your project.  You can either copy them manually and choose to "Add Existing Files..." or drag-and-drop them directly.  (I prefer to include it in "Other Source" but you can put it anywhere you like.)

5. Add the CoreData and CoreText framework to each target that will use InnerBand.

6. Done!

# Unit tests as documentation #

InnerBand believes in unit testing.  Therefore, if you open the project you'll find a plethora of unit tests that demonstrate, first-hand, how to use InnerBand.


# And there's a demo! #


Want to see the InnerBand components in action? You can run the InnerBand Catalog project located at InnerBand/demo/Catalog/.  This demonstrates the visual features of InnerBand in a way that unit tests cannot.


# So who created InnerBand? #


InnerBand was conceived, designed, created, and is maintained by John Blanco <john.blanco@raptureinvenice.com> of Rapture In Venice.
