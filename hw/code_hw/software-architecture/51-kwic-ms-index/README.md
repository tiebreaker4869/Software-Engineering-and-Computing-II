# KWIC-MS #

KWIC主程序与子程序风格

1. 成员变量说明
```java
/**
 * Input characters
 *
 */

  private char[] chars_;

/**
 * Array that keeps line indices (line index is the index of the first character of a line)
 *
 */

  private int[] line_index_;

/**
 * 2D array that keeps circular shift indices (each circular shift index is a column
 * in this 2D array, the first index is the index of the original line from line_index_ 
 * array, the second index is the index of the starting word from chars_ array of 
 * that circular shift)
 *
 */

  private int[][] circular_shifts_;

/**
 * 2D array that keeps circular shift indices, sorted alphabetically
 *
 */

  private int[][] alphabetized_;
```
2. 作业要求
   + 实现4个方法。    
        - kwic.input("Test_Case.txt");
        - kwic.circularShift();
        - kwic.alphabetizing();
        - kwic.output();
   + 思考如果涉及潜在的变更，需要设计修改哪些的方法
        - 存储的形式发生更改（比如不采用index方式，而是记录完整字符串）
        - 循环位移算法发生更改
   
   