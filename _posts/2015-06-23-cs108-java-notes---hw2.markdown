---
layout: post
title: "CS108 Java Notes - HW2"
---

P Inheritance2

### Instances 

1. A pointer to the base address of an instance of the subclass can also be treated as if it were a superclass object and it just works since the objects look the same from the bottom up.

2. abstract: has a prototype but no code.

3. instanceof with a *null* pointer always returns false.
  1. Using instanceof is regarded as a possible sign of poor design. Ideally, the right piece of code should be selected by the method depending on the class of receiver. Sometimes instanceof is required.
  2. We should avoid doing manual if/switch logic with class objects.

### Java Interface

1. defines a set of method prototypes, no code.
2. can also define final constants.
3. A class that implements an interface must implement all the methods in the interface.
4. A java class can only have one super class, but it may implement any number of interfaces.
5. If an object implements the Foo interface, a pointer to the object may be stored in a Foo variable. (Similar to superclass in this sense.)
6. C++ multiple inheritance is more capable, but it introduces a lot of compiler and language complexity. Interfacs provide 80% of the benifit for 10% of the complexity.
7. Example:
  1. The Comparable interface
  2. Objects that work with Java's build-in sorting machinery implement the Comparable interface, which defines the one method compareTo()
  
```java
public interface Comparable {
  public int compareTo(Object other);
}
```
  
  3. compareTo() returns negative if receiver is less, 0 if same, positive if more.
  4. in newer versions of Java, comparable has been made generic.

### Object Class
1. The Object class is the Universal superclass in Java -- every object is, at some distance, a subclass of Object.
2. Object methods：
  - boolean equals(Object other); //deep comparason.
    * can access ivar of the other oject, though private, since we are the same class. (called "sibling" access.
    * equals() does not do the right thing with two arrays: it does a shallow == comparison. Instead, use Arrays.equals() or Arrays.deepEquals() for deep array comparison.
    Example:
```java
@Override
public boolean equals(Object obj) {
  // Note: our argument must be Object, not Ingredient,
  // to match the equals() prototype up in the Object class.

  // Standard equals() tests...
  if (this == obj) return true;
  if (!(obj instanceof Ingredient)) return false;

  // Now do deep compare
  Ingredient other = (Ingredient)obj;
  return (grams==other.getGrams() && name.equals(other.getName()));
}
```
  - int hashCode(); //int hash summary of object 
    * if a.equals(b), then it is required that a.hashCode()==b.hashCode();
    * this allows an object to be a key (also required) in a HashMap. should be fast to compute.
    * if equals() is overridden, then hashCode() should also be overridden to be consistent with equals().
    * Example:
```java
@Override
public int hashCode() {
  // if two objects are deeply the same, their
  // hash codes must be the same
  return (grams + name.length()*11);
  // could use name.hashCode() instead of name.length()
```
  - String toString(); //String form of object
    * default definition: print object's class and address.
    * println() and String "+" know to call toString() automatically
    * can be handy for debugging
  - Class getClass(); //Ask an object what its class is

### JavaDoc

1. this is how all the standard class API docs are generated
2. JavaDoc sections start with two stars /\*\* blah blah \*/
3. HTML markup can be used \<p>\<code>\<b>
4. Class Overview:
  - summerize what the class encapsulates and its operational theory for the client.
  - for a large class include \<code>\</code> sections showing typical client code.
5. Method JavaDoc
  - JavaDoc uses the first sentence as a summary in the table of methods.
  - what does it do, what effect is there on the receiver and what are the  roles of the parameters
  - use the "s" form verbs -- "Adds", "Returns". OK to just start with the verb.



