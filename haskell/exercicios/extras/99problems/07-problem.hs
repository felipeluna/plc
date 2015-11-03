-- Flatten a nested list structure.
--
-- Transform a list, possibly holding lists as elements into a `flat' list by replacing each list with its elements (recursively).

-- Example:

-- * (compress '(a a a a b c c a a d e e e e))
-- (A B C A D E)

data NestedList a = Elem a | List [NestedList a]

flatten (List []) = []
flatten (Elem a) = [a]
flatten (List [(Elem a)]) = flatten (Elem a)
flatten (List lista) = foldr (++) [] $ map flatten lista
