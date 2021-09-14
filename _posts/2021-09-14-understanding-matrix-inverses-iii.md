---
layout: post
title: "Understanding matrix inverses - III: Fat matrices"
date: 2021-09-14 20:00:060 +0530
comments: true
categories: [linear-algebra]
---
$$ \newcommand{\mf}{\mathbf} \newcommand{\mb}{\mathbb} \newcommand{\mc}{\mathcal}$$
Fat full rank matrices only have right inverses:

$$ n < m, \,\, rank\left(\mf{A}\right) = n \implies \exists \mf{B} \in \mb{R}^{m \times n} \,\, s.t. \,\, \mf{A} \mf{B} = \mf{I}_{n}$$

This means that, $$\mf{A}\mf{B}\mf{y} = \mf{y}$$.

For full rank fat matrices, the four fundamnetal subspaces have the following dimensions.

$$ \begin{split} \text{dim } \mc{C}\left( \mf{A}^\top \right) = n & \quad \quad \quad \text{dim } \mc{N}\left( \mf{A} \right) = m-n \\
\text{dim } \mc{C}\left( \mf{A} \right) = n & \quad \quad \quad \text{dim } \mc{N}\left( \mf{A}^\top \right) = 0
\end{split} $$ 

This means that the general solution to the equation, $$\mf{A}\mf{x} = \mf{y}$$ has infinitely many solutions of the form,

$$ \mf{x} = \mf{x}_{rs} + \mf{x}_{ns}$$ 

where, $$\mf{x}_{rs} \in \mc{C}\left( \mf{A}^\top\right)$$ is the row space component of the solution, and $$\mf{x}_{ns} \in \mc{N}\left( \mf{A} \right)$$ is the nullspace component, such that

$$ \mf{A}\mf{x}_{rs} = \mf{y} \quad \text{and} \quad \mf{A}\mf{x}_{ns} = \mf{0}$$

This means that entire hyperplanes of dimension $$m-n$$ gets mapped to a single point $$\mf{y}$$.

Even though the mapping from $$\mb{R}^m$$ to $$\mb{R}^n$$ carried out by $$\mf{A}$$ is not unique, **the mapping from the row space to the column space of  $$\mf{A}$$ is unique.**

**Right inverses are not unqiue**

If $$\mf{B}$$ is a right inverse of $$\mf{A}$$, then any matrix of the form $$\mf{B} + \mf{C}$$ will also be left inverse, if the columns of the matrix $$\mf{C}$$ are from the $$\mc{N}\left(\mf{A}\right)$$, i.e. $$\mc{C}\left( \mf{C} \right) \subset \mc{N}\left( \mf{A} \right) \implies \mf{A}\mf{C} = \mf{0}$$.

**What do all these right inverse matrices do?**

> A right inverse allows us to find one of the possible solutions to the equation $$\mf{A}\mf{x} = \mf{y}$$.

The set of all right inverses when post multiplied by $$\mf{y}$$ will produce the entire list of all solutions to the equation $$\mf{A}\mf{x} = \mf{y}$$.

Any vector of the form $$\mf{x} = \left(\mf{B} + \mf{C}\right)\mf{y} \in \mb{R}^m$$ will have both components from the row space and nullspace. Let's assume that the $$\mf{x}_{rs} = \mf{B}\mf{y}$$ produces the row space component, and $$\mf{x}_{ns} = \mf{C}\mf{y}$$ produces the nullspace component. 

Producing the nullspace component is easy. We simply build a matrix using vectors from $$\mc{N}\left(\mf{A}\right)$$, which will produce produces components from such that $$\mf{C}\mf{y} \in \mc{N}\left(\mf{A}\right)$$.

How do we produce the row space component? Building a matrix with vectors from the row space will not work. Let the columsn of $$\hat{\mf{B}}$$ be from the row space of $$\mf{A}$$, but is not guaranteed to be a right inverse, $$\mf{A}\hat{\mf{B}}$$ might not be $$\mf{I}_n$$.

**A special right inverse.**

There is a special right inverse that allows us to find the row space component of $$\mf{x}$$ that produces $$\mf{y} = \mf{A}\mf{x}$$. This is the *Right Pseudoinverse*, also expressed as $$\mf{A}^\dagger$$.

$$ \mf{A}^\dagger = \mf{A}^\top\left(\mf{A}\mf{A}^\top\right)^{-1}$$ 

The mapping performed by the *right pseudoinverse* is shown in the following figure. 

![]({{ site.baseurl }}/figs/right_pinv.png){:style="align: center; margin-left: 5px; margin-right: 10px; margin-top: 7px; width: 600px"}

$$\mf{A}^\dagger$$ produces only the row space components, which implies that among all the possible solutions $$\mf{x}$$, such that $$\mf{A}\mf{x} = \mf{y}$$, the $$\mf{A}^\dagger\mf{y}$$ is the shortest $$\mf{x}$$ becuase it does not include any component in the nullspace.

I hope this short presentaion helps shed some light on the nature of right inverses. I hope to write a blog post on generalized inverses at some point.