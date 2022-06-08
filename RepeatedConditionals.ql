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

predicate hasMultipleIfstmt(BlockStmt bs, int nIfstmt) {
    nIfstmt = count(Stmt s | s = bs.getAChildStmt() and s instanceof IfStmt) and
    nIfstmt > 1
}

predicate sameConditionals(BlockStmt bs) {
    exists(
        Stmt s, Stmt ss | 
        s = bs.getAChildStmt() and s instanceof IfStmt and
        ss = bs.getAChildStmt() and ss instanceof IfStmt and
        s.getLocation().toString() != ss.getLocation().toString() and 
        s.(IfStmt).getCondition().toString() = ss.(IfStmt).getCondition().toString())     
}

from BlockStmt bs, int nIfstmt
where
    hasMultipleIfstmt(bs, nIfstmt) and
    sameConditionals(bs)
select bs,
        "Method " + bs.getEnclosingCallable().getName() + " implements the same conditional statement in multiple locations within the same scope."