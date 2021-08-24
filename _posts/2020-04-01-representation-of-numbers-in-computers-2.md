---
layout: post
title: "Representation of Numbers in Computers - II: Fixed and Floating point number"
date: 2020-03-30 00:00:00 +0530
comments: true
categories: [computer-science]
---

This second part of the blog post on number representation on computers focuses on fixed-point and floating-point numbers. Fixed and floating point numbers allow use to have approximate representation of real numbers. 

The binary representation of a real number has the following general form,
<center>
  <img src="{{ site.baseurl }}/figs/real_number.png" width="60%" height="60%">
</center>

The computation of the value represented by this number is done the same way we would compute it with a decimal number. The radix point separates the numbers with non-negative powers on 2 on one side (left side), and the ones with negative powers of 2 on the right. For example, consider the numbers $$ 1001.1011$$. The integer and fractional parts are given by,

$$
\begin{split}
1001  &= 1 \times 2^3 + 0 \times 2^2 + 0 \times 2^1 + 1 \times 2^0 = 9\\
.1011 &= 1 \times 2^{-1} + 0 \times 2^{-2} + 1 \times 2^{-3} + 2^{-4}\\
      &= 0.5 + 0.125 + 0.0625  = 0.6875
\end{split}
$$

So, the number $$1001.1011$$ in binary equals $$9.6875$$ in decimal. You are probably familar about the procedure to convert a integer to a binary numbers. How would you convert a fractional number to its corresponding binary number? The procedures for adding and multiplication of real numbers in binary representation are similar to the ones we are familiar with decimal numbers.

### Fixed-point Numbers
Fixed point numbers are the real number equivalent of whole number or intgeers numbers represented by a finite number of bits. Unlike integers, fixed point numbers have a non-zero fractional part. These are called _fixed-point numbers_ because the position of the radix point is fixed to a mutually agreed location. Consider the example of a 8-bit $$\left(b_7b_6b_5b_4.b_3b_2b_1b_0\right)$$ numbers with the radix point located between the bits $$b_4$$ and $$b_3$$. This fixed-point number can represent upto 256 different numbers, from $$0000.0000$$ to $$1111.1111$$. Let us assume for now that we are only interested in representing positive numbers. Then, this 8-bit number can represented numbers from 0 to 15.9375, with the difference between successive numbers being $$0.0625 = 0000.0001$$.

When representing whole numbers with 8-bits, we could think of it as the real number line betwee to 0 to 256 being equally divided into 256 segments starting from 0. Each 8-bit number then represent the boundaries of the 256 line segments of unit length. In the case of a 8-bit fixed-point number with the radix point between the fourth and fifth bits, we divide the number line between 0 and 16 into 256 equal segments. Here, the length of line segment on the number line that is divided is determined by the number of bits to the left of the radix points, and the number of divisions of this segment is determined by the total number of bits. Whole numbers can be thought of a fixed-point numbers with the radix point after the least significant bit. 

The following figure demonstrates how fixed-point number segment a part of the real line. The following two figures two different 3-bit fixed-point numbers shcemes. The figure on the left has the radix point after the first bit, and the one on the right has the radix point after the second bit. The figures, along with the explanation in the previous paragraph should be able to convey the idea about how fixed-point numbers chop up a segment of the real line. 

<center>
  <img src="{{ site.baseurl }}/figs/nw-wn-fp.png" width="80%" height="80%">
</center>

Negative nubers are handled the same way they were with integers. The integer part of the is represented in the 2s complement format. The following figure demonstrate this for a 3-bit number with the radix point after the second bit.

<center>
  <img src="{{ site.baseurl }}/figs/nw-int-fp.png" width="45%" height="45%">
</center>

### Floating-point Numbers
From a practical perspective, there are two issues with fixed-point numbers.
1.  The range of numbers they can represent is limited and the number of bits used will need to be increased to widen this range. To be fair, this problem is common to all numbers represented using a finite numbers of bits (or digits).
2.  The difference between successive numbers (absolute resolution) in a fixed-point representation is constant throughout its entire range. However, often in practice the absolute resolution required for numbers increases with the size of the numbers. For example, the resolution of the numbers needed to report the masses of adult Chihuahuas, humans, or blue whales are quite different; reasonalble resolutions could be 0.1Kg, 1Kg and 1000Kgs for Chihuahas, humans, and blue whales, respectively. If we decide to use a fixed-point number system to represent the masses of these three species, these numbers must:
  - have a resultion of at least 0.1Kg, and 
  - be able to represent numbers as large as 200,000Kg.

This could be achieved with a 21-bit fixed-point number with the radix point between $$b_{4}$$ and $$b_{3}$$ bits: $$b_{20}b_{19}b_{18} \ldots b_{6}b_{5}b_{4}.b_3b_2b_1b_0$$. It sounds like we would be able to do this easily on a 32-bit machine. However, this is a highly inefficient way of representing numbers for practical purposes. This 21 fixed-point number would allow us to specify the mass of a blue whale upto an accuracy of 0.1Kg! Who would ever want to know the mass that accurately, assuming we can actually  measure it to that level of accuracy?

It turns out, in practice, _relative resolution_ is more useful than absolute resultion. Relative resolution is the ratio of the difference between successive numbers with respect to the mangitude of the numbers. With floating-point numbers the relative resolution remains the same throughout the range of these numbers. 



<!-- 
The binary representation of _whole numbers_ is something all of us are familiar with. In the decimal system, the number two hundred and thirty five is represented as the following,

$$ 235 = 2 \times 10^2 + 3 \times 10^1 + 5 \times 10^0 $$

In the decimal system, the base is 10 and 10 unique (decimal) digits $0-9$ are used for representing all numbers.

In the binary system, this number has the following representation, where the base is 2 and the digits 0 and 1 are used.

$$ \begin{split}
235 =& 1 \times 2^7 + 1 \times 2^6 + 1 \times 2^5 + 0 \times 2^4 + \\
& 1 \times 2^3 + 0 \times 2^2 + 1 \times 2^1 + 1 \times 2^0 \\
=& \left[ 11101011 \right]_2 
\end{split}
$$

(Note: $$\left[\cdot\right]_2$$ _indicates that the number in the square brackets is a binary number. We will use this representation only when there is ambiquity regarding the base of a number._)

A $n$ bit binary number $B$ is written as $B = \left[ b_{n-1}b_{n-2} \ldots b_1b_0 \right]_2$, where $b_i \in [0, 1], \, 0 \leq i \leq n-1$. Let $d(\cdot)$ be the function that coverts a binary number $B$ to its decimal equivalent, $$ d(B) = \sum_{i=0}^{n-1} b_i \times 2^i $$. 
<style>
div .textbox {
  width: 100%;
  background-color: #fee;
  padding: 5px;
  border: 0px solid gray;
  margin-bottom: 10px;
  text-align: left;
}
</style>
<center>
<div class="textbox">
<b>Prove:</b> <i>The maximum whole number that can be represented by a $n$-bit number is $2^n - 1$.</i>
</div>  
</center>

Arithmetic operations on binary numbers are carried out exactly the way we perform decimal arithmetic. We will only consider the addition and multiplication operations here, as the set of whole numbers are not closed under the subtraction and division operations.

**Binary Addition** can be carried out with the knowledge of the following truth table. Addition of two $n$ bit binary numbers $A$ and $B$ can result in a binary number $C = A + B$ with at most $n+1$ bits.

<style type="text/css">
.tg  {border-collapse:collapse;border-spacing:0;}
.tg td{font-family:Arial, sans-serif;font-size:14px;padding:2px 2px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:black;}
.tg th{font-family:Arial, sans-serif;font-size:14px;font-weight:normal;padding:2px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:black;}
.tg .tg-baqh{text-align:center;vertical-align:top}
.tg .tg-c3ow{border-color:inherit;text-align:center;vertical-align:top}
.tg .tg-7btt{font-weight:bold;border-color:inherit;text-align:center;vertical-align:top}
</style>
<center>
<table class="tg">
  <tr>
    <th class="tg-7btt">A</th>
    <th class="tg-7btt">B</th>
    <th class="tg-7btt">C = A + B</th>
    <th class="tg-7btt">C = A x B</th>
  </tr>
  <tr>
    <th class="tg-7btt">0</th>
    <th class="tg-7btt">0</th>
    <th class="tg-7btt">00<sub>2</sub></th>
    <th class="tg-7btt">00<sub>2</sub></th>
  </tr>
  <tr>
    <th class="tg-7btt">0</th>
    <th class="tg-7btt">1</th>
    <th class="tg-7btt">01<sub>2</sub></th>
    <th class="tg-7btt">01<sub>2</sub></th>
  </tr>
  <tr>
    <th class="tg-7btt">1</th>
    <th class="tg-7btt">0</th>
    <th class="tg-7btt">01<sub>2</sub></th>
    <th class="tg-7btt">00<sub>2</sub></th>
  </tr>
  <tr>
    <th class="tg-7btt">1</th>
    <th class="tg-7btt">1</th>
    <th class="tg-7btt">10<sub>2</sub></th>
    <th class="tg-7btt">01<sub>2</sub></th>
  </tr>
</table>
</center>

Here is an example demonstrating the procedure for adding two binary numbers,

$$ \left[ 0110 \right]_2 + \left[ 1101 \right]_2 = 
\begin{matrix}
  \begin{array}{r}
    & 0 & 1 & 1 & 0\\
   + & 1 & 1 & 0 & 1\\
    \hline
    1 & 0 & 0 & 1 & 1
  \end{array}
\end{matrix} = \left[ 10011 \right]_2$$

$$ \left[ 6 \right]_{10} + \left[ 13 \right]_{10} = \left[ 19 \right]_{10} $$

**Binary Multiplication** can be carried out with the knowledge of the above truth table. Multipliation of two $n$ bit binary numbers $A$ and $B$ can result in a binary number $C = A \times B$ with at most $2n$ binary bits.

$$ \left[ 0110 \right]_2 \times \left[ 1101 \right]_2 = 
\begin{matrix}
  \begin{array}{r}
    & & & 0 & 1 & 1 & 0\\
    & & \times & 1 & 1 & 0 & 1\\
    \hline
    & & & 0 & 1 & 1 & 0\\
    & & 0 & 0 & 0 & 0 & 0\\
    & 0 & 1 & 1 & 0 & 0 & 0\\
    0 & 1 & 1 & 0 & 0 & 0 & 0\\
    \hline
    1 & 0 & 0 & 1 & 1 & 1 & 0\\
  \end{array}
\end{matrix} = \left[ 1001110 \right]_2
$$

$$ \left[ 6 \right]_{10} + \left[ 13 \right]_{10} = \left[ 78 \right]_{10} $$


### Numbers represented using a finite number of bits behave like modulo-$n$ numbers
Numbers represented in computer use a finite number of bits. For example, a 64 bit microprocessor uses 64 bits to represent data, which means that with a single word (64 bits) we can only represent upto a $2^{64}$ different numbers or data types. If we were representing whole numbers then, the maximum number that can be represented is $2^{64} - 1$. Arthimetic operations performed with 64 bit numbers are also restrcited to be 64 bit numbers. This results in these numbers behaving differently under arthimetic operations, compared to numbers with no such restriction on the number of bit. For example, 3-bit numbers under the operation of addition and multiplication will behave like modulo-$2^{3}$ numbers; overflows are ignored and the lower three bits are considered the results of the arthimethic operations.

In general, whole numbers can be represented as discrete, equi-distant points on a number line (infinitely long) as shown in the following figure,
<center>
  <img src="{{ site.baseurl }}/figs/nl-wn.png" width="50%" height="50%">
</center>

While, the whole numbers represented with a finite number of bits can be represented on a circle (number-wheel) as the following figure,
<center>
  <img src="{{ site.baseurl }}/figs/nw-wn.png" width="42%" height="42%">
</center>

### Integers
When representing negative numbers, on paper, one could simply use the '-' symbol, e.g. -51 in binary can be written as -110011. Since 0s and 1s are the only available symbols when representing things on a computer, we need a different approach to represent negative numbers: _2's complement representation_. Let's assume that we working with 3 bit numbers; we can represent upto 8 different numbers. In the 2's complement representation, the binary representation of positive numbers and zero remain unchanged. However, when we have a negative number $N$, we first take the binary representation of $\vert N \vert$, invert the bits, and add 1 to the inverted numbers. 

$$ -2 \xrightarrow[\text{binary}]{\text{2 in}} 010 \xrightarrow[\text{bits}]{\text{Invert}} 101 \xrightarrow[\text{1}]{\text{Add}} 110$$

In the 2's complement representation, the most significant bit represents the sign bit, and it is 1 for negative numbers. As the following table indicates.

<center>
<table class="tg">
  <tr>
    <th class="tg-7btt">Binary No.</th>
    <th class="tg-7btt">Whole number</th>
    <th class="tg-7btt">Integer</th>
  </tr>
  <tr>
    <th class="tg-7btt">000<sub>2</sub></th>
    <th class="tg-7btt">0</th>
    <th class="tg-7btt">0</th>
  </tr>
  <tr>
    <th class="tg-7btt">001<sub>2</sub></th>
    <th class="tg-7btt">1</th>
    <th class="tg-7btt">1</th>
  </tr>
  <tr>
    <th class="tg-7btt">010<sub>2</sub></th>
    <th class="tg-7btt">2</th>
    <th class="tg-7btt">2</th>
  </tr>
  <tr>
    <th class="tg-7btt">011<sub>2</sub></th>
    <th class="tg-7btt">3</th>
    <th class="tg-7btt">3</th>
  </tr>
  <tr>
    <th class="tg-7btt">100<sub>2</sub></th>
    <th class="tg-7btt">4</th>
    <th class="tg-7btt">-4</th>
  </tr>
  <tr>
    <th class="tg-7btt">101<sub>2</sub></th>
    <th class="tg-7btt">5</th>
    <th class="tg-7btt">-3</th>
  </tr>
  <tr>
    <th class="tg-7btt">110<sub>2</sub></th>
    <th class="tg-7btt">6</th>
    <th class="tg-7btt">-2</th>
  </tr>
  <tr>
    <th class="tg-7btt">111<sub>2</sub></th>
    <th class="tg-7btt">7</th>
    <th class="tg-7btt">-1</th>
  </tr>
</table>
</center>

We can convert a 2's complement number to the corresponding decimal number using the following formula,

$$ N = -b_{n-1}2^{n-1} + \sum_{i=0}^{n-2} b_i2^i $$ 

The followiing image shows another way to look at 2's complement numbers.
<center>
  <img src="{{ site.baseurl }}/figs/nw-int.png" width="42%" height="42%">
</center>

<center>
<div class="textbox">
<b>Prove:</b> <i>In the 2's complement representation using $n$-bits, (a) the highest positive integer that can be represented is $2^{n-1} - 1$; and (b) the lowest negative integer that can be represented is $-2^{n-1}$.</i> 
</div>  
</center>

**Binary Addition**. The truth table for addition remains the same, and we can add two numbers like we did with whole numbers. This handles the addition of both negative and positive numbers, but we need to be careful when interpreting the results because of the sign bit. Addition of numbers corresponds to clockwise movement along the number-wheel, and the 2's complement representation is such that addition by positive numbers can be seen as clockwise movements, and that of negative numbers as anti-clockwise movement. 

However, we need to keep in mind the following conditions, which indicate an overflow:
  - Addition of two positive numbers cannot result in a negative number, e.g. $$ 3 + 2 = [011]_2 + [010]_2 = [101]_2 $$.
  - Addition of two negative numbers cannot result in a positive number, e.g. $$ -3 + -4 = [101]_2 + [100]_2 = [001]_2 $$. Note that the addition of negative numbers in 2's complement number will result a four bit number. Here we simply ignore the fourth bit.

When adding a positive and negative 2's complement number, we never run into trouble.

It should be noted that overflow here does not mean the presence of a carryover bit in the $$(n+1)^{th}$$ position, but rather when the boundary on the number-wheel between extreme positive and negative numbers is crossed by the addition or multiplication operation.

**Binary Multiplication**. We can multiply 2's complement numbers like we do with binary whole numbers. The products come out with the appropriate signs provided there is no overflow. Consider wo binary signed numbers $B_1$ and $B_2$. An overflow occurs when: the product $\vert B_1 \times B_2$ is greater than $2^{n-1}$ when the $\text{sign}\left(B_1 \times B_2\right)$ is $-1$, or when the product $\vert B_1 \times B_2$ is greater than $2^{n-1} - 1$ when the $\text{sign}\left(B_1 \times B_2\right)$ is $+1$. There is no overflow when one of the numbers is $0$. You can verify this writing down the product table for 2 bit numbers. 

The second part of this blog-post will deal with fixed and floating point numbers. -->