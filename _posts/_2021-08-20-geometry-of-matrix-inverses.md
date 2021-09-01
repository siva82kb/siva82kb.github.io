---
layout: post
title: "Geometry of matrix inverses"
date: 2021-08-20 20:00:060 +0530
comments: true
categories: [linear-algebra]
---
Matrices are a representation of **linear maps** between finite-dimensional vector spaces. Consider a  linear map $$\mathcal{L}$$ from $$\mathbb{R}^m$$ to $$\mathbb{R}^n$$.

$$ \mathcal{L}: \mathbb{R}^m \mapsto \mathbb{R}^n $$

This linear map can be represented using a real matrix $$\mathbf{A} \in \mathbb{R}^{n \times m}$$, such that 
    
$$ \mathbf{y} = \mathcal{L}\left( \mathbf{x} \right) = \mathbf{A}\mathbf{x}, \quad \mathbf{x} \in \mathbb{R}^m, \, \mathbf{y} \in \mathbb{R}^n $$

When the domain and range spaces are the same, then $$\mathbf{A}$$ is a square matrix. 

The matrix $$\mathbf{A}$$ has a unique inverse $$\mathbf{A}^{-1}$$, if and only if the $$\mathbf{A}$$ is full-rank, i.e. the columns of the matrix form a basis for $$\mathbb{R}^n$$. In this case, $$\mathbf{A}^{-1}\mathbf{A} = \mathbf{A}\mathbf{A}^{-1} = \mathbf{I}_n$$, where $$\mathbf{I}_n$$ is the $$n \times n$$ identity matrix.

#### Matrix inverses allow us to change basis

Consider the equation, $$\mathbf{A}\mathbf{x} = \mathbf{b}$$. This equation says that the vector $$\mathbf{b}$$ is a linear combination of the columns of $$\mathbf{A}$$, with the weight for each columns given by the elements of $$\mathbf{x}$$.

$$ \mathbf{b} = \mathbf{A}\mathbf{x} = \begin{bmatrix} \mathbf{a}_1 & \mathbf{a}_2 & \cdots & \mathbf{a}_n\end{bmatrix} \begin{bmatrix} x_1 \\ x_2 \\ \vdots \\ x_n\end{bmatrix} = \sum_{i=1}^n x_i\mathbf{a}_i $$

Here, $$\mathbf{x}$$ is the representation of the vector $$\mathbf{b}$$ in the basis of $$\mathbb{R}^n$$ formed by the columns of $$\mathbf{A}$$ (we will refer to this basis as the *column basis*). Given $$\mathbf{A}$$ and $$\mathbf{b}$$, we can solve for $$\mathbf{x}$$ using the inverse of $$\mathbf{A}$$, 

$$ \mathbf{x} = \mathbf{A}^{-1}\mathbf{b} $$

Thus, we see that $$\mathbf{A}^{-1}$$ is the matrix that allows us to change the representation of a vector to the *column basis*.

#### Non-square matrices have left or right inverses, but not both
For full (column or row) rank non-square matrices, we can still have inverses, but there are some peculiarities: 
  1. We can only have left or right inverses, as is described below, and (b) 
  2. The left and right inverses are not unique. Let $\mathbf{A} \in \mathbb{R}^{n \times m}$.

**Tall full rank matrix** only have left inverses:

$$n > m, \,\, rank\left(\mathbf{A}\right) = m \implies \mathbf{B} \mathbf{A} = \mathbf{I}_{m}$$

This means that, $\mathbf{B}\mathbf{A}\mathbf{x} = \mathbf{B}\mathbf{b} \implies \mathbf{x} = \mathbf{B}\mathbf{b}$. 

What $\mathbf{x}$ represents depends on whether or not $\mathbf{b}$ is in the column space of $\mathbf{A}$. 

- $\mathbf{b} \in \mathcal{C}\left( \mathbf{A} \right) \implies $ $\mathbf{x} = \mathbf{B}\mathbf{b}$ is representation of $\mathbf{b}$ in the *column basis* of $\mathbf{A}$.
- $\mathbf{b} \notin \mathcal{C}\left( \mathbf{A} \right) \implies $  $\mathbf{x} = \mathbf{Bb}$ is the representation of some vector $\hat{\mathbf{b}}$ $=$ $\mathbf{ABb}$ in the *column basis* of $\mathbf{A}$.

When $\mathbf{x}$ is substituted back into the original equation, we get

$$ \begin{cases}
\mathbf{b} \in \mathcal{C}\left(\mathbf{A}\right) &\implies \mathbf{A}\left(\mathbf{B}\mathbf{b}\right) = \mathbf{b} \\
\mathbf{b} \notin \mathcal{C}\left(\mathbf{A}\right) &\implies \mathbf{A}\left(\mathbf{B}\mathbf{b}\right) \neq \mathbf{b}
\end{cases}
$$

For a given left inverse $\mathbf{B}$, adding a matrix $\mathbf{C}$ whose rows are orthogonal to the columns of $\mathbf{A}$ will result in another left inverse of $\mathbf{A}$.

$$ \left( \mathbf{B} + \mathbf{C} \right) \mathbf{A} = \mathbf{I}_m, \, s.t. \, \mathbf{C}\mathbf{A} = \mathbf{0} $$

The rows of $\mathbf{C}$ will be vectors from $\mathcal{N}\left(\mathbf{A}^\top\right)$ - the left nullspace of $\mathbf{A}$. Thus, it is clear that there are infinitely many left inverses for $\mathbf{A}$.

Just as inverses of non-singular matrices, a left inverse allow us to find the represen change basis to the *column

What do all these left inverse matrices do? 


**Fat full rank matrix**:

$$n < m, \,\, rank\left(\mathbf{A}\right) = n \implies \mathbf{A} \mathbf{B} = \mathbf{I}_{n}$$

- The left and the right inverses are not unique, there an infinite number of left and right inverses.



