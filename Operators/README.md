# Verilog Operators

## Table of Contents

## Arithmetic Operators

| Operator | A       | B  | Result     | Description                             |
|----------|---------|----|------------|-----------------------------------------|
| +        | 10      | -3 | 7          | Arithmetic addition                     |
| -        | 10      | -3 | 13         | Arithmetic subtraction                  |
| *        | 10      | -3 | -30        | Arithmetic multiplication               |
| /        | -12     | 3  | -4         | If one number is -ve result will be -ve |
|          | 12      | -3 | -4         |                                         |
|          | -d’12   | 3  | 1431655761 | Loses its identity of negative number   |
|          | -sd’12  | 3  | -4         | Signed number expressed as sd           |
|          | -4’sd12 | 3  | 1          | 0100/3 = 1                              |
| %        | 11      | 3  | 2          | Yields 2 as remainder                   |
|          | 12      | 3  | 0          | Yields 0 remainder                      |
|          | -10     | 3  | -1         | Takes sign of first operand             |
|          | 10      | -3 | 1          | Takes sign of first operand             |
|          | -4’d12  | 3  | 1          | 0100 % 3 = 1                            |
| **       | 0       | 0  | 1          | Anything power 0 gives 1                |
|          | 2       | 0  | 1          |                                         |

