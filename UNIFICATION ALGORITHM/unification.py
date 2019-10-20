#!/usr/bin/python

from pl1_formula import *


class Substitution(dict):
    """
    Representing a substitution set. The dictionary keys must be Variable
    objects. There are three ways of creating a Substitution objects:
        1) Substitution()      # Creates the empty set.
        2) Singleton(x, t)     # Creates a substitution containing the single
                               # element {x/t}. x must be a Variable object, t
                               # can be an arbitrary term (i.e., Constant,
                               # Variable, or Function).
        3) Composition(s1, s2) # Creates the composed substitution s1s2. s1
                               # and s2 must both be Substitution objects.

    You can use Substitution objects pretty much the same as dictionaries. For
    example, given a Substitution object s, iterating over s can be done as
    follows:
        for var in s:
            term = s[var]
            # ... do something
    or directly via
        for (var, term) in s.iteritems():
            # ... do something ...
    To extend s by x2/t2, do
        s[x2] = t2
    To check whether s defines a substitution for x:
        if x in s:
            # ... do something
    To print s:
        print(s)
    """

    @staticmethod
    def Singleton(var, term):
        assert (isinstance(var, Variable))
        assert (isinstance(term, Variable) or isinstance(term, Constant) or isinstance(term, Function))
        s = Substitution()
        s[var] = term
        return s

    @staticmethod
    def Composition(s1, s2):
        c = 0
        assert (isinstance(s1, Substitution))
        assert (isinstance(s2, Substitution))
        comp = Substitution()
        for (var1, term1) in s1.items():
            for (var2, term2) in s2.items():
                if term1.contains_variable(var2):
                    term1 = term1.apply_substitutions(Substitution({var2: term2}))
                    if var1 != term1:
                        comp[var1] = term1
            for (var2, term2) in s2.items():
                if (var1.contains_variable(var2)):
                    c = 1
                    break
            if c == 0:
                if var1 != term1:
                    comp[var1] = term1

        for (var2, term2) in s2.items():
            c = 0
            for (var1, term1) in s1.items():
                if (var2.contains_variable(var1)):
                    c = 1
                    break
            if c == 0:
                if var2 != term2:
                    comp[var2] = term2
        # TODO: compute the composed substitution s1s2 of s1 and s2 (as defined
        # on slide 21 in chapter 8)
        # You may use the provided apply_substitutions function (see
        # pl1_formula.py)
        return comp

    def __str__(self):
        return "{%s}" % ", ".join(["%s/%s" % (var, self[var]) for var in self])


def compute_disagreement_set(atoms):
    """
    Compute the disagreement set for the provided set of atoms.

    Result must be a collection (list, set, etc) of term objects (Variable,
    Constant, Function).

    You can assume that all atoms are over the same predicate.
    """
    D = []
    unmatched = 0
    unmacthedsymbol = 0
    unmacthedvariable = 0
    if len(atoms) <= 1:
        return []

    # Get the predicate's arity
    arity = next(iter(atoms)).symbol.arity
    for i in range(arity):
        a = atoms[0].terms[i]
        unmatched = 0
        unmacthedsymbol = 0
        for j in range(1, len(atoms)):
            if atoms[j].terms[i] != a:
                unmatched = 1
                break
        if unmatched == 1:
            if hasattr(atoms[0].terms[i], 'symbol'):
                #   print(hasattr(atoms[0].terms[i], 'symbol'))
                #    print(atoms[0].terms[i])
                for j in range(1, len(atoms)):
                    if (atoms[j].terms[i], 'symbol') == 0:
                        unmacthedsymbol = 1
                        break
                    else:
                        if atoms[j].terms[i].symbol != atoms[0].terms[i].symbol:
                            unmacthedsymbol = 1
                            break
                if unmacthedsymbol == 1:
                    for j in range(len(atoms)):
                        D.append(atoms[j].terms[i])
                else:
                    for j in range(len(atoms)):
                        D.append(atoms[j].terms[i].terms[0])

            else:
                for j in range(len(atoms)):
                    D.append(atoms[j].terms[i])
        if len(D) != 0:
            break
    return D
    # TODO: compute the disagreement set
    raise NotImplementedError("compute_disagreement_set has not been implemented yet")


def unification(atoms):
    """
    Runs the unification algorithm on the given set of atoms. If there exists
    a unifier for atoms, returns an idempotent mgu. Otherwise, returns None.
    """
    c = 0
    k = 0
    b = []

    tk = atoms
    sk = Substitution()
    while len(set(tk)) != 1:
        k += 1
        # if k == 5:
        #     break
        idxc = -1
        idxf = -1
        idxv = -1
        fset = 0
        cset = 0
        d = (compute_disagreement_set(tk))
        s2 = Substitution()

        for i in range(len(d)):
            if (isinstance(d[i], Variable)):
                for j in range(len(d)):
                    if i != j and (isinstance(d[j], Variable)):
                        idxv = j
                    elif (isinstance(d[j], Constant)):
                        cset += 1
                        if cset == 2:
                            break
                        else:
                            idxc = j
                    elif (isinstance(d[j], Function)):
                        fset += 1
                        if fset == 2:
                            break
                        else:
                            idxf = j

            if cset == 2 or fset == 2:
                break
            elif idxc != -1:
                s2[d[i]] = d[idxc]
                break
            elif idxf != -1:
                if (d[idxf].contains_variable(d[i]) == 0):
                    s2[d[i]] = d[idxf]
                    break
            elif idxv != -1:
                s2[d[i]] = d[idxv]
                break

        if len(s2) == 0:
            return None
        sk = Substitution.Composition(sk, s2)
        for i in range(len(tk)):
            tk[i] = tk[i].apply_substitutions(sk)

    return sk


def run_disagreement_set_print_result(atoms):
    print("Clause: {%s}" % (", ".join([str(e) for e in atoms])))
    d = compute_disagreement_set(atoms)
    print("Disagreement set: {%s}" % (", ".join([str(e) for e in d])))
    print("")


def run_unification_print_result(atoms):
    print("Clause: {%s}" % (", ".join([str(e) for e in atoms])))
    # unification(atoms)

    s = unification(atoms)
    if s is None:
        print("Is not unifiable!")

    else:
        print("Unifier: %s" % s)
    print("")


if __name__ == "__main__":
    # Define predicate symbols, function symbols, as well as variables and
    # constants:
    P = PredicateSymbol("P", 3)
    f = FunctionSymbol("f", 1)
    g = FunctionSymbol("g", 1)
    v = Variable("v")
    w = Variable("w")
    x = Variable("x")
    y = Variable("y")
    z = Variable("z")
    a = Constant("a")
    b = Constant("b")
    c = Constant("c")

    # Test Substitution

    #   s1 = Substitution({z:g(x,y), v:w})
    #  s2 = Substitution({x:a, y:b, w:v,z:d})
    # s = Substitution.Composition(s1, s2)
    #   print(s)

    # Disagreement set
    # Examples of slide 25 of chapter 8
    run_disagreement_set_print_result([P(x, c, f(y)), P(x, z, z)])
    run_disagreement_set_print_result([P(x, a, f(y)), P(y, a, f(y))])
    run_disagreement_set_print_result([P(v, f(z), g(w)), P(v, f(z), g(f(z)))])
    run_disagreement_set_print_result([P(v, f(z), g(w)), P(v, f(z), g(f(z))), P(v, f(z), f(x))])

    # Unification
    # Example of slide 27 of chapter 8
    run_unification_print_result([P(x, f(y), y), P(z, f(b), b)])
