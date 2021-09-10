---
layout: post
title: "Understanding matrix inverses - II: Tall matrices"
date: 2021-09-10 20:00:060 +0530
comments: true
categories: [linear-algebra]
---

For full (column or row) rank non-square matrices $\mathbf{A} \in \mathbb{R}^{n \times m}$, we can still have inverses but there are some peculiarities: 
  1. We can only have left or right inverses, as is described below, and 
  2. The left and right inverses are not unique.

We will talk about the inverses of tall matrices in this post, i.e. matrices where $n > m$. Tall full rank matrices only have left inverses:

$$n > m, \,\, rank\left(\mathbf{A}\right) = m \implies \exists \mathbf{B} \in \mathbb{R}^{m \times n} \,\, s.t. \,\, \mathbf{B} \mathbf{A} = \mathbf{I}_{m}$$

This means that, $\mathbf{B}\mathbf{A}\mathbf{x} = \mathbf{B}\mathbf{b} \implies \mathbf{x} = \mathbf{B}\mathbf{b}$. 

What $\mathbf{x}$ represents depends on whether or not $\mathbf{b}$ is in the column space of $\mathbf{A}$. 

- $\mathbf{b} \in \mathcal{C}\left( \mathbf{A} \right) \implies $ $\mathbf{x} = \mathbf{B}\mathbf{b}$ is the representation of $\mathbf{b}$ in the *column basis* of $\mathbf{A}$.
- $\mathbf{b} \notin \mathcal{C}\left( \mathbf{A} \right) \implies $  $\mathbf{x} = \mathbf{Bb}$ is the representation of some vector $\hat{\mathbf{b}}$ $=$ $\mathbf{A}\mathbf{x} = \mathbf{ABb}$, which in the *column basis* of $\mathbf{A}$.

When $\mathbf{x}$ is substituted back into the original equation, we get

$$ \begin{cases}
\mathbf{b} \in \mathcal{C}\left(\mathbf{A}\right) &\implies \hat{\mathbf{b}} = \mathbf{A}\left(\mathbf{B}\mathbf{b}\right) = \mathbf{b} \\
\mathbf{b} \notin \mathcal{C}\left(\mathbf{A}\right) &\implies \hat{\mathbf{b}} = \mathbf{A}\left(\mathbf{B}\mathbf{b}\right) \neq \mathbf{b}
\end{cases}
$$

For a given left inverse $\mathbf{B}$, adding a matrix $\mathbf{C}$ whose rows are orthogonal to the columns of $\mathbf{A}$ will result in another left inverse of $\mathbf{A}$.

$$ \left( \mathbf{B} + \mathbf{C} \right) \mathbf{A} = \mathbf{I}_m, \, s.t. \, \mathbf{C}\mathbf{A} = \mathbf{0} $$

The rows of $\mathbf{C}$ will be vectors from $\mathcal{N}\left(\mathbf{A}^\top\right)$ - the left nullspace of $\mathbf{A}$. Thus, it is clear that there are infinitely many left inverses for $\mathbf{A}$.

**What do all these left inverse matrices do?**

> A left inverse allows us to find the representation of $$\hat{\mathbf{b}}$$ -- a component of $$\mathbf{b}$$ in $$\mathcal{C}\left(\mathbf{A}\right)$$ -- in the *column basis* of $$\mathbf{A}$$.

These components are oblique projections onto $$\mathcal{C}\left(\mathbf{A}\right)$$ along a complementary subspace in $$\mathbb{R}^n$$.





#### Fat full rank matrix

$$n < m, \,\, rank\left(\mathbf{A}\right) = n \implies \mathbf{A} \mathbf{B} = \mathbf{I}_{n}$$

- The left and the right inverses are not unique, there an infinite number of left and right inverses.



