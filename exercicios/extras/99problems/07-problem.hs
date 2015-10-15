-- Flatten a nested list structure.
--
-- Transform a list, possibly holding lists as elements into a `flat' list by replacing each list with its elements (recursively).

data NestedList a = Elem a | List [NestedList a]

flatten (List []) = []
flatten (Elem a) = [a]
flatten (List [(Elem a)]) = flatten (Elem a)
flatten (List lista) = foldr (++) [] $ map flatten lista
