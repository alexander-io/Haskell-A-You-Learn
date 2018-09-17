-- pattern matching
-- define a function take two vectors in 2d space and add them together
addVectors (x1, y1) (x2, y2) = (x1 + x2, y1 + y2)

-- extract first, second, third elem from triples
frist (x, _,  _) = x
second (_, x, _) = x
third (_, _, x) = x
