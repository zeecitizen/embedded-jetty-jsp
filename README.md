Example: Embedded Jetty w/ JSP Support - 

Simple Login and Registration page with Hashed salted password stored to file.  
======================================

This project also contains my resume built using Bootstrap. 

IDENTIFIED PROBLEMS AND THEIR SOLUTIONS:
======================================


Problem: Only one user could be registered because we were storing only a single variable in the session.

Solution: Decided to use a Hashmap to register multiple-users. Wrote LoginUtil and HashUtil classes to assist in this. The LoginUtil class follows the singleton pattern exposing a getInstance() method.

----------------

Problem: Unsafe to store passwords. 

Solution: Decided to hash the user's password together with a salt and to validate a password we compare hashed input against a previously recorded hash.

----------------

Problem: The scope of a hashtable/hashmap is the life of the program itself. This causes the registered users to be lost when the application is terminated.

Solution: We serialize objects and store them by writing to a file. This is not very secure but for the scope of this program we can consider these solutions.

----------------

Problem: Input sanitization was not done properly.
Acquired Information: Read about it. Turns out, in JSP, we don't need to escape characters in the Java (Servlet) code as they are harmless over there. We need to escape before re-displaying the input values entered by user. 

Solution 1: For displaying user-input this can mean using JSTL  <c:out> tag or fn:escapeXml(). 

Solution 2: To prevent SQL injection we can use a Java PreparedStatement object for sending SQL statements to the database.

----------------

Problem: While using JSTL to escapeXML, I came to know that JSTL and Scriptlets store variables in different contexts. 

Solution: Used pageContext.setAttribute("value", value); and getAttribute commands to access Scriptlet variables in JSTL tags.

----------------

Problem: The font Helvetica Neue was not working. 

Solution: Imported the font and wrote CSS style for it to be included as font for body

----------------

Problem: Intellij was not showing code style formatting options for JSP

Solution: Upgraded Intellij to Ultimate edition instead of community edition.

----------------

Problem: The use of scriptlets (<% %>) in JSP is discouraged since the birth of taglibs (like JSTL) and EL (${}). 

Solution: For the purpose of this task we stick to Scriptlets to reduce complexity of demonstration.

----------------

This is a maven project, to build it:
======================================

    $ mvn clean package

To run the example `org.eclipse.jetty.demo.Main`:

    $ mvn exec:exec

Open your web browser to:

    http://localhost:8080/  

To stop Jetty:

  use <kbd>CTRL</kbd>+<kbd>C</kbd>


Code Of Interest
----------------

See [org.eclipse.jetty.demo.Main](src/main/java/org/eclipse/jetty/demo/Main.java)

**Use JavaC, Not Eclipse JDT**

By default, the JSP implementation will use an internal eclipse JDT compiler,
Using this system property will disable that behavior and instead use the JDK
JavaC built-in compiler.

``` java
// Set JSP to use Standard JavaC always
System.setProperty("org.apache.jasper.compiler.disablejsr199","false");
```

**Set a Servlet Temp Directory**

It is important for JSP to define a temp directory suitable for managing itself.
Such a directory will be used for converting the JSP source into a java file and
then compiling it into a class.  A sub directory in this temp directory will be
automatically added by the JSP implementation for loading the compiled JSP classes.

```java
context.setAttribute("javax.servlet.context.tempdir",scratchDir);
```

**Set a non-System Classloader**

The JSP implementation will refuse to the System Classloader (per JSTL + JSP spec),
this will wrap the system classloader in a simple URLClassLoader suitable
for use by the JSP implementation.

```java
// Set Classloader of Context to be sane (needed for JSTL)
// JSP requires a non-System classloader, this simply wraps the
// embedded System classloader in a way that makes it suitable
// for JSP to use
ClassLoader jspClassLoader = new URLClassLoader(new URL[0], this.getClass().getClassLoader());
context.setClassLoader(jspClassLoader);
```

**Jsp Servlet must be named `"jsp"`**

The JspServlet must be named "jsp" (per JSP spec).

```java
// Add JSP Servlet (must be named "jsp")
ServletHolder holderJsp = new ServletHolder("jsp",JspServlet.class);
holderJsp.setInitOrder(0);
```

**Default Servlet must exist**

The JSP implementation relies on various Servlet Spec requirements,
but mainly the fact that a "default" named servlet must exist.

```java
// Add Default Servlet (must be named "default")
ServletHolder holderDefault = new ServletHolder("default",DefaultServlet.class);
holderDefault.setInitParameter("resourceBase",baseUri.toASCIIString());
holderDefault.setInitParameter("dirAllowed","true");
context.addServlet(holderDefault,"/");
```

