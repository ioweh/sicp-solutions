
What is the result of

(car ''abracadabra)

Remember how the quote is implemented internally.

(car (quote (quote abracadabra)))

Hardly surprising, the interpreter will print back "quote".

Test it

(car ''abracadabra)
;Value: quote

(car (quote (quote abracadabra)))
;Value: quote

***

The best answer is given here:

https://stackoverflow.com/questions/16885044/when-does-scheme-evaluate-quote

When scheme evaluates a combination it evaluates the operator. Then it will apply if it's a special form or macro. If not, it will evaluate each operands before applying.

(car (quote (quote abracadabra)))

Can be evaluated like this*

    car evaluates to #<proc car>. since it's a procedure evaluate all operands in any order
    (quote (quote abracadabra)) is a combination, thus
        quote is evaluated => #<macro quote> and since its a macro/special form do macro-apply
        apply-macro (#<macro quote> (quote abracadabra))) => (quote abracadabra)
    apply-proc (#<proc car> (quote abracadabra)) => quote
