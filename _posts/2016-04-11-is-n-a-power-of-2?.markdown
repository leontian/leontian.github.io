---
layout: post
title: "Is n a power of 2?"
---

If n is a power of 2, then we know it has only one set bit. It has the form

10\*

n-1 is of the form 01\* on the other hand. Therefore n & (n-1) (bitwise and) is 0.

One exception is that when n=0, which is not a power of 2. So the final answer is

n && (!(n & (n-1)))
