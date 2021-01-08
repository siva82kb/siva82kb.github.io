---
layout: post
title: "Using Sinc Pulses to Characterize LTI Systems"
date: 2019-06-25 21:00:060 +0530
comments: true
categories: [linear-sysems]
---
I was involved in a discussion, a few months back, about a linear time-invariant (LTI) filter that someone was trying to characterize. Their plan was to use a sinc pulse as an input, and use the Fourier spectrum of the filter's output as a direct readout of the filter's frequency response.

At first, it sounded like a strange idea but after some thought, it sounded reasonable. I had never thought about characterizing a filter using a sinc pulse before. I think my confusion was due to the fact that we often use impulse, step, and sinusoisal signals to characterize LTI systems, as these are easier to generate (or simulate) using analog hardware. I am not aware of an analog circuit that would generate an approximate sinc pulse.

Consider a continuous-time LIT system $H$, with impulse response $h(t)$ and frequency response $H(j\omega)$, the input-output relationship is given by,

$$ y(t) = H\left\{x(t)\right\} = h(t) * x(t) = \int_{-\infty}^{\infty} x(\tau)h(t - \tau)d\tau \quad \text{and} \quad Y(j\omega) = H(j\omega)X(j\omega) $$

where, $x(t)$ is the input and $y(t)$ is the output of the system $H$.

For an input sinc pulse $x(t) = \frac{\omega_c}{\pi}\text{sinc} \left(\omega_c t\right) = \frac{\omega_c}{\pi}\frac{\sin \left( \omega_c t \right)}{\omega_c t}$, the Fourier spectrum of the output is given by,

$$ Y(j\omega) = H(j\omega)X(j\omega) = \begin{cases} H(j\omega) & \left| \omega \right| \leq \omega_c \\
0 & \left| \omega \right| > \omega_c \\
\end{cases} $$

Here, the sinc function acts as an approximate impulse function; increasing $\omega_c$ provides a better and better approximation of the impulse fucntion.

$$ \int_{-\infty}^{\infty} \frac{\omega_c}{\pi}\text{sinc} \left(\omega_c t\right)dt = 1 \quad \text{and} \quad \lim_{\omega_c \to \infty} \frac{\omega_c}{\pi}\text{sinc} \left(\omega_c t\right) = \delta(t) $$

Simultaneously, the brickwall frequency response tends towards a contant function $\lim_{\omega_c \to \infty}X(j\omega) = 1$.

Thus, if $H$ is a bandlimited filter $\left( H\left( j\omega \right) = 0, \forall \vert \omega \vert > \omega_H\right)$, then $Y\left(j\omega\right) = H\left(j\omega\right)$ when $\omega_c \geq \omega_H$.

This means that the output of the system $H$ to two sinc inputs $x_1(t) = \frac{\omega_{c1}}{\pi}\text{sinc} \left(\omega_{c1} t\right)$ and $x_2(t) = \frac{\omega_{c2}}{\pi}\text{sinc} \left(\omega_{c2} t\right)$ will be the same, as long as $\omega_{c1} \geq \omega_H$ and $\omega_{c2} \geq \omega_H$. This implies that $x_1(t) - x_2(t)$ is in the _nullspace_ or the _kernel_ of the system $H$. The _nullspace_ of this system is the eigenspacce spanned by the set of eigenvectors $$\left\{e^{j\omega t}\right\}_{\forall \lvert \omega \rvert \geq \omega_H}$$; it can be easily verified that $x_1(t) - x_2(t)$ is in $$\text{span}(\left\{e^{j\omega t}\right\}_{\forall \lvert \omega \rvert \geq \omega_H})$$.

For systems that are practically bandlimited limited, sufficiently narrow and tall sinc pulse is as good an impulse function for the purpose of characterizing the system.
