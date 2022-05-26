/**
 * @name Repeated conditionals
 * @description A conditional statement that occurs more than once within the same scope.
 * @kind problem
 * @precision low
 * @problem.severity recommendation
 * @id cs/energy-aware/repeated-conditionals
 * @tags energy-aware
 *       maintainability
 */

import csharp

predicate hasMultipleIfstmt(BlockStmt m, int nIfstmt) {
    nIfstmt = count(Stmt s | s = m.getAChildStmt() and s instanceof IfStmt) and
    nIfstmt > 1
}

predicate sameConditionals(BlockStmt m) {
    exists(
        Stmt s, Stmt ss | 
        s = m.getAChildStmt() and s instanceof IfStmt and
        ss = m.getAChildStmt() and ss instanceof IfStmt and
        s.getLocation().toString() != ss.getLocation().toString() and 
        s.(IfStmt).getCondition().toString() = ss.(IfStmt).getCondition().toString())
}

from Method m, int nIfstmt
where
    hasMultipleIfstmt(m.getBody(), nIfstmt) and
    sameConditionals(m.getBody())
select m,
        "Method " + m.getName() + " implements the same conditional statement in multiple locations within the same scope."