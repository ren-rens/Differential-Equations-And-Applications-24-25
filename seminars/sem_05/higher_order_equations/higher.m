function higher

syms y(x)
simplify(dsolve(diff(y, x, 3) == 2 * (diff(y, x, 2) - 1) * cot(x)))

end
