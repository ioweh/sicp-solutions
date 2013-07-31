
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

