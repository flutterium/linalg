library linalg.test.matrix;

import 'package:test/test.dart';
import 'package:linalg/linalg.dart';

void main() {
  group("Matrix", () {
    test("Identity Matrix generator", () {
      final Matrix eye = Matrix.eye(3);
      expect(
          eye,
          Matrix([
            [1.0, 0.0, 0.0],
            [0.0, 1.0, 0.0],
            [0.0, 0.0, 1.0]
          ]));
    });

    test('value access tests', () {
      final Matrix mt = Matrix([
        [1.0, 3.0],
        [5.0, -2.0]
      ]);
      expect(mt[0][0], 1.0);
      expect(mt[0][1], 3.0);
      expect(mt[1][0], 5.0);
      expect(mt[1][1], -2.0);
    });

    test('fill test', () {
      final Matrix m = Matrix.fill(2, 2, 10.0);
      expect(m[0][0], 10.0);
      expect(m[0][1], 10.0);
      expect(m[1][0], 10.0);
      expect(m[1][1], 10.0);
    });

    test('cut test', () {
      final Matrix m = Matrix([
        [1.0, 2.0, 3.0],
        [4.0, 5.0, 6.0],
        [7.0, 8.0, 9.0],
      ]);

      final Matrix expected = Matrix([
        [1.0, 3.0],
        [7.0, 9.0]
      ]);

      expect(m.cut(1, 1), expected);
    });

    test("addition", () {
      final Matrix a = Matrix.eye(3);
      final Matrix b = Matrix([
        [1.0, 1.0, 2.0],
        [3.0, 1.0, 3.0],
        [5.0, 6.0, 7.0]
      ]);
      expect(
          a + b,
          Matrix([
            [2.0, 1.0, 2.0],
            [3.0, 2.0, 3.0],
            [5.0, 6.0, 8.0]
          ]));
    });

    test("subtraction", () {
      final Matrix a = Matrix([
        [1.0, 1.0, 2.0],
        [3.0, 1.0, 3.0],
        [5.0, 6.0, 7.0]
      ]);
      final Matrix b = Matrix.eye(3);
      expect(
          a - b,
          Matrix([
            [0.0, 1.0, 2.0],
            [3.0, 0.0, 3.0],
            [5.0, 6.0, 6.0]
          ]));
    });

    test("transpose", () {
      final Matrix a = Matrix([
        [1.0, 2.0],
        [3.0, 4.0],
        [5.0, 6.0]
      ]);
      expect(
          a.transpose(),
          Matrix([
            [1.0, 3.0, 5.0],
            [2.0, 4.0, 6.0]
          ]));
    });

    test("negate", () {
      final Matrix a = Matrix.eye(3);
      expect(
          ~a,
          Matrix([
            [-1.0, 0.0, 0.0],
            [0.0, -1.0, 0.0],
            [0.0, 0.0, -1.0]
          ]));
    });

    test('2x2 Matrix Determinant test', () {
      expect(
          Matrix([
            [1.0, 3.0],
            [5.0, -2.0]
          ]).det(),
          -17);
      expect(
          Matrix([
            [2.0, 1.0],
            [4.0, 2.0]
          ]).det(),
          0);
      expect(
          Matrix([
            [4.0, -1.0],
            [-3.0, 2.0]
          ]).det(),
          5);
      expect(
          Matrix([
            [4.0, -3.0],
            [1.0, 2.0]
          ]).det(),
          11);
    });

    test('3x3 Matrix Determinant test', () {
      expect(
          Matrix([
            [1.0, 3.0, 2.0],
            [4.0, 1.0, 3.0],
            [2.0, 2.0, 0.0]
          ]).det(),
          24);
      expect(
          Matrix([
            [1.0, 0.0, 2.0],
            [1.0, 3.0, 4.0],
            [0.0, 6.0, 0.0]
          ]).det(),
          -12);
      expect(
          Matrix([
            [3.0, -2.0, 4.0],
            [2.0, -4.0, 5.0],
            [1.0, 8.0, 2.0]
          ]).det(),
          -66);
      expect(
          Matrix([
            [8.0, -1.0, 9.0],
            [3.0, 1.0, 8.0],
            [11.0, 0.0, 17.0]
          ]).det(),
          0);
    });

    test('4x4 Matrix Determinant test', () {
      expect(
          Matrix([
            [1.0, 2.0, 1.0, 0.0],
            [0.0, 3.0, 1.0, 1.0],
            [-1.0, 0.0, 3.0, 1.0],
            [3.0, 1.0, 2.0, 0.0]
          ]).det(),
          16);
    });

    test('4x4 Matrix Determinant test', () {
      expect(
          Matrix([
            [1.0, 2.0, 1.0, 0.0],
            [0.0, 3.0, 1.0, 1.0],
            [-1.0, 0.0, 3.0, 1.0],
            [3.0, 1.0, 2.0, 0.0]
          ]).det(),
          16);
    });

    test('Co Factors Matrix test', () {
      expect(
          Matrix([
            [3.0, 0.0, 2.0],
            [2.0, 0.0, -2.0],
            [0.0, 1.0, 1.0]
          ]).coFactors(),
          Matrix([
            [2.0, -2.0, 2.0],
            [2.0, 3.0, -3.0],
            [0.0, 10.0, 0.0]
          ]));
    });

    test("multiplication test", () {
      final Matrix a1 = Matrix([
        [1.0, 2.0],
        [3.0, 4.0]
      ]);
      final Matrix b1 = Matrix([
        [2.0, 0.0],
        [1.0, 2.0]
      ]);
      final Matrix e1 = Matrix([
        [4.0, 4.0],
        [10.0, 8.0]
      ]);
      expect(a1 * b1, e1);

      final Matrix a2 = Matrix([
        [1.0, 2.0],
        [3.0, 4.0],
        [1.0, 2.0]
      ]);
      final Matrix b2 = Matrix([
        [2.0, 0.0],
        [1.0, 2.0]
      ]);
      final Matrix e2 = Matrix([
        [4.0, 4.0],
        [10.0, 8.0],
        [4.0, 4.0]
      ]);
      expect(a2 * b2, e2);
    });

    test("inversion 2x2", () {
      final Matrix a = Matrix([
        [4.0, 7.0],
        [2.0, 6.0]
      ]);
      expect(
          a.inverse(),
          Matrix([
            [0.6, -0.7],
            [-0.2, 0.4]
          ]));
    });

    test("inversion 3x3", () {
      final Matrix a = Matrix([
        [1.0, 3.0, 3.0],
        [1.0, 4.0, 3.0],
        [1.0, 3.0, 4.0]
      ]);
      expect(
          a.inverse(),
          Matrix([
            [7.0, -3.0, -3.0],
            [-1.0, 1.0, 0.0],
            [-1.0, 0.0, 1.0]
          ]));
    });

    test("inversion 4x4", () {
      final Matrix a = Matrix([
        [1.0, 2.0, 4.0, 1.0],
        [5.0, 3.0, 1.0, 2.0],
        [4.0, 2.0, 4.0, 1.0],
        [6.0, 3.0, 2.0, 1.0]
      ]);
      expect(
          a.inverse(),
          Matrix([
            [-1 / 3, 0.0, 1 / 3, 0.0],
            [20 / 27, -2 / 9, -29 / 27, 7 / 9],
            [1 / 27, -1 / 9, 8 / 27, -1 / 9],
            [-8 / 27, 8 / 9, 17 / 27, -10 / 9]
          ]));
    });

    test('Matrix trace', () {
      expect(
          Matrix([
            [1.0, 2.0, 1.0, 0.0],
            [0.0, 3.0, 1.0, 1.0],
            [-1.0, 0.0, 3.0, 1.0],
            [3.0, 1.0, 2.0, 0.0]
          ]).trace(),
          7.0);
    });

    test('columnVector', () {
      Matrix m = Matrix([
        [1.0, 2.0, 3.0, 1.0],
        [4.0, 5.0, 6.0, 2.0],
        [7.0, 8.0, 9.0, 3.0],
      ]);

      Vector vc = m.columnVector(0);
      expect(vc, Vector.column([1.0, 4.0, 7.0]));

      // columnVector is always a deep copy
      m[0][0] = 100.0;
      expect(vc, Vector.column([1.0, 4.0, 7.0]));
    });

    test('toVector deepCopy', () {
      Matrix m = Matrix([
        [1.0, 2.0, 3.0, 1.0],
      ]);

      Vector vc = m.toVector();
      expect(vc, Vector.row([1.0, 2.0, 3.0, 1.0]));

      // rowVector by default is a deep copy.
      m[0][0] = 100.0;
      expect(vc, Vector.row([1.0, 2.0, 3.0, 1.0]));
    });

    test('toVector reference', () {
      Matrix m = Matrix([
        [1.0, 2.0, 3.0, 1.0],
      ]);

      Vector vc = m.toVector(false);
      expect(vc, Vector.row([1.0, 2.0, 3.0, 1.0]));

      // rowVector by default is a deep copy.
      m[0][0] = 100.0;
      expect(vc, Vector.row([100.0, 2.0, 3.0, 1.0]));
    });

    test('rowVector deepCopy', () {
      Matrix m = Matrix([
        [1.0, 2.0, 3.0, 1.0],
        [4.0, 5.0, 6.0, 2.0],
        [7.0, 8.0, 9.0, 3.0],
      ]);

      Vector vc = m.rowVector(0);
      expect(vc, Vector.row([1.0, 2.0, 3.0, 1.0]));

      // rowVector by default is a deep copy.
      m[0][0] = 100.0;
      expect(vc, Vector.row([1.0, 2.0, 3.0, 1.0]));
    });

    test('rowVector reference', () {
      Matrix m = Matrix([
        [1.0, 2.0, 3.0, 1.0],
        [4.0, 5.0, 6.0, 2.0],
        [7.0, 8.0, 9.0, 3.0],
      ]);

      Vector vc = m.rowVector(0, false);
      expect(vc, Vector.row([1.0, 2.0, 3.0, 1.0]));

      // rowVector with forces shared storage.
      m[0][0] = 100.0;
      expect(vc, Vector.row([100.0, 2.0, 3.0, 1.0]));
    });

    // Test exceptions

    test("Exception: Creating matrix with invalid dimensions", () {
      expect(() => Matrix.eye(-2),
          throwsA(TypeMatcher<MatrixInvalidDimensions>()));

      final Matrix a = Matrix.eye(3);
      final Matrix b = Matrix.eye(2);
      expect(() => a * b, throwsA(TypeMatcher<MatrixInvalidDimensions>()));
    });

    test("Exception: Multiplying matrix with invalid argument", () {
      final Matrix a = Matrix.eye(3);
      final String b = "this makes no sense";
      expect(() => a * b, throwsA(TypeMatcher<MatrixUnsupportedOperation>()));
    });

    test("Exception: Determinant of non-square matrix", () {
      final Matrix a = Matrix([
        [1.0, 2.0],
        [3.0, 4.0],
        [1.0, 2.0]
      ]);
      expect(() => a.det(), throwsA(TypeMatcher<MatrixInvalidDimensions>()));
    });

    test("Exception: Cofactors of non-square matrix", () {
      final Matrix a = Matrix([
        [1.0, 2.0],
        [3.0, 4.0],
        [1.0, 2.0]
      ]);
      expect(
          () => a.coFactors(), throwsA(TypeMatcher<MatrixInvalidDimensions>()));
    });

    test("Exception: Determinant of 1x1 matrix", () {
      final Matrix a = Matrix.eye(1);
      expect(() => a.det(), throwsA(TypeMatcher<MatrixInvalidDimensions>()));
    });

    test("Exception: Cofactor of 2x2 matrix", () {
      final Matrix a = Matrix.eye(2);
      expect(
          () => a.coFactors(), throwsA(TypeMatcher<MatrixInvalidDimensions>()));
    });

    test("Exception: Impossible Inversion", () {
      final Matrix a = Matrix([
        [1.0, 3.0, 3.0],
        [2.0, 6.0, 6.0],
        [1.0, 3.0, 4.0]
      ]);
      expect(
          () => a.inverse(), throwsA(TypeMatcher<MatrixNoInverseException>()));
    });

    test("Exception: Matrix to Vector that is not a vector", () {
      final Matrix a = Matrix.eye(2);
      expect(
          () => a.toVector(), throwsA(TypeMatcher<MatrixInvalidDimensions>()));
    });

    test("Exception: Trace on non-square matrix", () {
      final Matrix a = Matrix([
        [1.0, 3.0, 3.0],
        [2.0, 6.0, 6.0]
      ]);
      expect(() => a.trace(), throwsA(TypeMatcher<MatrixInvalidDimensions>()));
    });
  });
}
