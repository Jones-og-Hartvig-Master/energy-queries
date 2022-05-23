/**
 * @name Parameter by value
 * @description Using parameters by reference instead of value
 * @kind problem
 * @precision low
 * @problem.severity recommendation
 * @id cs/energy-aware/parameter-by-value
 * @tags energy-aware
 */

import csharp

from Method m
where
    m.isSourceDeclaration() and
    exists(Parameter p | p = m.getAParameter() and p.isRef())
select m, 
    "Method " + m.getName() + " has a parameter of ref type which can consume more " +
    "energy than a non-ref type"