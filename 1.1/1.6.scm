As scheme uses eager evaluation, all the arguments of the new-if procedure should be evaluated. The first argument will evaluate fine, while evaluating the second argument will lead to a disaster! Indeed, let's see ourselves what will happen if we use the new version of if:

new-if (good-enough? guess x)
    guess				! evaluates fine
    (sqrt-iter (improve guess x)
               x)))			! oh, no

Even though the guess will be improved, the procedure sqrt-iter will be called again and again! See what happens if you forgot about the fact that 'if' is actually a special form and doesn't evaluate the arguments if there's no need to.