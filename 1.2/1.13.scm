; https://en.wikipedia.org/wiki/Mathematical_induction#Complete_induction
; Complete induction can be used to show that
; Fn=(phi^n-psi^n)/(phi-psi)
; where Fn is the nth Fibonacci number, phi=(1+sqrt(5))/2 and psi=(1-sqrt(5))/2.
; By using the fact that F(n+2)=F(n+1)+F(n) for each n belonging N,
; the identity above can be verified by direct calculation for F(n+2)
; if we assume that it already holds for both F(n+1) and F(n).
; To complete the proof, the identity must be verified in the two base cases
; n = 0 and n = 1.

1. The basis:
F(0)=(1-1)/(phi-psi) = 0;
F(1)=(phi-psi)/(phi-psi) = 1;

2. The inductive step:
F(n+2)=F(n+1)+F(n)=((phi^n)*phi-(psi^n)*psi+phi^n-psi^n)/(phi-psi)=((phi^n)*(phi+1)-(psi^n)*(psi+1))/(phi-psi)

We must prove that

phi+1=phi^2
psi+1=psi^2

phi+1=2*(+ 1 sqrt(5) 2)/(* 2 2) = (+ 1 (* 2 sqrt(5)) 5)/4 = (1+(sqrt 5))^2/4 => phi+1=phi^2
psi+1=(1 - (sqrt 5) + 2)/2 = (2 - 2(sqrt 5) + 4) / 4 = (1 - 2(sqrt 5) + 5)/4 = ((1-(sqrt 5))^2)/4=psi^2 

=> F(n+2)=(phi^(n+2) - psi^(n+2))/(phi-psi)
