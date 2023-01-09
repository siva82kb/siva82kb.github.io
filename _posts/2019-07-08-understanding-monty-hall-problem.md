---
layout: post
title: "Understanding the Monty Hall Problem"
date: 2019-07-08 09:00:060 +0530
comments: true
categories: [probability]
---
s
I had come across the Monty Hall problem a year back, and my answer that could come up with the standard one - "I would not switch my choice". In case you do not know what that means, let me start by describing the Monty Hall problem. 

The Monty Hall problem is a puzzle in probability. Assume that you are in a gameshow, where there are three doors (A, B, C) - one of the doors conceals a car, which you can win if you choose this door correctly; the other two doors have things that are not of any value. You are first required to choose a door. Following this the host checks the remaining doors, and opens of the on that does not contain the car. You are now given a chance to either stick with your original choice, or switch your choice to the remaining door. What would you be the better option? Stick with your original choice, or switch to the other door.

We will first look at the standard wrong solution, and then look at the correct solution.  

**Standard Solution**: The probability of our first choice (e.g. A) being correct is $$\frac{1}{3}$$. Then, when the host opens a door that does not contain the car (e.g. B). We are now left with two doors (A and C), and the probability of the car being behind either one of these doors is $\frac{1}{2}$. Thus, it would make no difference whether we switch or stick to our original choice.

Lets look at this systematically and see if the above solution is correct. Because there are only three doors, we could easily enumerate all possiblities and see if it gives us an inight into this problem and the solution.

<style type="text/css">
.tg  {border-collapse:collapse;border-spacing:0;}
.tg td{font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:black;}
.tg th{font-family:Arial, sans-serif;font-size:14px;font-weight:normal;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:black;}
.tg .tg-baqh{text-align:center;vertical-align:top}
.tg .tg-c3ow{border-color:inherit;text-align:center;vertical-align:top}
.tg .tg-7btt{font-weight:bold;border-color:inherit;text-align:center;vertical-align:top}
</style>
<table class="tg">
  <tr>
    <th class="tg-7btt">Car</th>
    <th class="tg-7btt">Chosen</th>
    <th class="tg-7btt">Revealed</th>
    <th class="tg-7btt">Remaining</th>
    <th class="tg-baqh"><span style="font-weight:bold">Switch?</span></th>
  </tr>
  
  <tr>
    <td class="tg-c3ow">A</td>
    <td class="tg-c3ow">A</td>
    <td class="tg-c3ow">B/C</td>
    <td class="tg-c3ow">C/B</td>
    <td class="tg-baqh">No</td>
  </tr>
  <tr>
    <td class="tg-c3ow">A</td>
    <td class="tg-c3ow">B</td>
    <td class="tg-c3ow">C</td>
    <td class="tg-c3ow">A</td>
    <td class="tg-baqh">Yes</td>
  </tr>
  <tr>
    <td class="tg-c3ow">A</td>
    <td class="tg-c3ow">C</td>
    <td class="tg-c3ow">B</td>
    <td class="tg-c3ow">A</td>
    <td class="tg-baqh">Yes</td>
  </tr>

  <tr>
    <td class="tg-c3ow">B</td>
    <td class="tg-c3ow">A</td>
    <td class="tg-c3ow">C</td>
    <td class="tg-c3ow">B</td>
    <td class="tg-baqh">Yes</td>
  </tr>
  <tr>
    <td class="tg-c3ow">B</td>
    <td class="tg-c3ow">B</td>
    <td class="tg-c3ow">A/C</td>
    <td class="tg-c3ow">C/A</td>
    <td class="tg-baqh">No</td>
  </tr>
  <tr>
    <td class="tg-c3ow">B</td>
    <td class="tg-c3ow">C</td>
    <td class="tg-c3ow">B</td>
    <td class="tg-c3ow">A</td>
    <td class="tg-baqh">Yes</td>
  </tr>

  <tr>
    <td class="tg-c3ow">C</td>
    <td class="tg-c3ow">A</td>
    <td class="tg-c3ow">B</td>
    <td class="tg-c3ow">C</td>
    <td class="tg-baqh">Yes</td>
  </tr>
  <tr>
    <td class="tg-c3ow">C</td>
    <td class="tg-c3ow">B</td>
    <td class="tg-c3ow">A</td>
    <td class="tg-c3ow">C</td>
    <td class="tg-baqh">No</td>
  </tr>
  <tr>
    <td class="tg-c3ow">C</td>
    <td class="tg-c3ow">C</td>
    <td class="tg-c3ow">B</td>
    <td class="tg-c3ow">A</td>
    <td class="tg-baqh">Yes</td>
  </tr>
</table>

<br>

Looking at the last column, we see that, irrespective of the door containing the car and the our initial choice, swtiching would help us win $\frac{2}{3}$rd of the times. Our standard answer does not line-up with  systematic analysis.

Let $A$ be the event of our first choice of door containing the car. Then, $P(A) = \frac{1}{3}$. After we select a door, the host chooses a door to reveal; the door revealed depends on our original choice as the host knows which door contains the car. Let $B$ represent the event that the door that remains contains the car. The probability of $B$ depends on $A$. If $A$ is true then $P(B \, \lvert \, A) = 0$; the door with the car has been selected so $B$ cannot be true. However, if $A$ is false, then $P(B \, \lvert \, A^c) = 1$; this is because the host will only reveal the door without the car. Using the theorem of total probability, we have

$$ P(B) = P(B \, \lvert \, A)P(A) + P(B \, \lvert \, A^c)P(A^c) = 0 \cdot \frac{1}{3} + 1 \cdot \frac{2}{3} = \frac{2}{3}$$ 

This number agrees with the results in the table above. So, where did we go wrong in the standard solution? 

The problem with the standard solution is that we ignore the fact that the host has knowledge of the door containing the car. This is implied in the statement "... We are now left with two doors (A and C), and the probability of the car being behind either one of these doors is $\frac{1}{2}$ ...". But this is false. The door that the host leave unopened is actually more likely to have the car as he will only open the door without the car. To see this more cearly, lets see what happens when the host randomly chooses a door to open and that this door does not contain the car. Then,  we have the following,

$$ P(B \, \lvert \, A) = 0 \quad \text{and} \quad P(B \, \lvert \, A^c) = \frac{1}{2} $$

Thus,

$$ P(B) = P(B \, \lvert \, A)P(A) + P(B \, \lvert \, A^c)P(A^c) = 0 \cdot \frac{1}{3} + \frac{1}{2} \cdot \frac{2}{3} = \frac{1}{3} $$

Here, we see that both $P(A)$ and $P(B)$ are equal and thus there would be no benefit in switching our choice.

After I spent some time thinking about this simply problem and its solution, I realize that the problem with my original approach to the problem was really just lazy thinking.

There are lots of such problems involving conditional probability that put you understanding on the nuances of probability theory to the test. I hope to write about these various problems in my later posts.