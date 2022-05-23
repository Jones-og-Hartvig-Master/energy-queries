/**
 * @name Non-short circuit
 * @description Not using short circuiting boolean operators can increase energy consumption.
 * @kind problem
 * @precision
 * @problem.severity warning
 * @id cs/energy-aware/non-short-circuit
 * @tags energy-aware
 */

import csharp

from BinaryBitwiseOperation bbo
where
    bbo instanceof BitwiseAndExpr or bbo instanceof BitwiseOrExpr
select bbo, "Operator " + bbo.toString() + " should be used with short circuiting"