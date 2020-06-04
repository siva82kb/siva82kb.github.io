---
layout: post
title: "Input-Output Relationship of a Linear Time-Varying System"
date: 2018-08-20 18:30:00 +0530
comments: true
categories: [linear-systems]
---
Most of us that have studied signal processing or control theory would be familiar with the input-output relationship of linear time-invariant (LTI) systems. If $H$ is an LTI system with impulse response $h(t)$, then the output of the system for any arbitrary input is given by **convolution integral**,

$$ y(t) = \int_{-\infty}^{\infty} h(\tau) x(t - \tau) d\tau \,, \quad t \in \mathbb{R}$$

The same idea can be applied to a discrete-time system with impulse response $h[n]$. The output in this case is given by the **convolution sum**,

$$ y[n] = \sum_{k=-\infty}^{\infty}h[k]x[n - k] \,, \quad n \in \mathbb{Z} $$

The fact that input-output (IO) relationships for LIT systems can be determined through convolution, also leads to popular transform-based representation, analysis and design of LIT systems.

Linear-time varying (LTV) systems on the other hand cannot be understood through the convolution integral or the sum as shown above. The behavior of a LTV system depends explicity on time, and its IO behavior changes with time. If $H$ is a LTV system, then if $$H\left\{ x(t) \right\} = y(t)$$, then $$H\left\{x(t - t_0)\right\} \neq y(t - t_0)$$, i.e. time-shifted inputs do not produce time-shifted outputs.

A LTV system can be viewed as a system with impulse response that is  time dependent, i.e. the output of the system to an impulse input $\delta(t - s)$ depends on both $t$ and $s$.

$$ \phi(t, s) = H\left\{ \delta(t - s) \right\}, \quad t, s \in \mathbb{R} $$

where, $t$ is time, and $s$ is the time instant at which the impulse is applied. In the case of an LTI system, the response to $\delta(t - s)$ is $h(t - s)$; the output only depends on a single argument $t - s$.

In LTI systems, $h(t)$ acts as a weighting function that determines how the past, present and future input values are combined to produce the present output; this is the operation performed by the covolution operation. $\phi(t, s)$ also plays a similar role. The output at a given time $t$ for an LTV system, will weight the past, present and future values according to the function $\phi(t, s)$. In order to find out the output of an LTV system for an arbitrary input $x(t)$, lets start with the following,

$$ x(t) = \int_{-\infty}^{\infty} x(\tau) \delta(t - \tau) d\tau $$

The output of the system $H$ to the input $\delta(t - \tau)$ is given by $h(\tau, t)$. Thus, $y(t)$ can be obtained as the following,

$$ y(t) = H\left\{ \int_{-\infty}^{\infty} x(\tau) \delta(t - \tau) d\tau \right\} = \int_{-\infty}^{\infty} x(\tau) H\left\{ \delta(t - \tau) \right\}d\tau $$

$$ y(t) = \int_{-\infty}^{\infty} x(\tau) h(\tau, t) d\tau $$

In the above equation the input at time $\tau$ is weighted by the factor $h(\tau, t)$ to determine the output of the system at time $t$.

$$
\phi(\tau, t) \longrightarrow \begin{cases}
\text{Weight for past input} & \tau < t \\
\text{Weight for the present input} & \tau = t \\
\text{Weight for the future input} & \tau > t \\
\end{cases}
$$

In the case of a causal LTV system, we have $h(\tau, t) = 0$ for $\tau > t$.

In the case of a discrete-time LTV system, we could express the IO relatioship similarly,

$$ y[n] = \sum_{k=-\infty}^{\infty} x[k] h[k, n] $$

where, $h[k, n]$ is the output of the LTV system to an impulse $\delta[n - k]$.
