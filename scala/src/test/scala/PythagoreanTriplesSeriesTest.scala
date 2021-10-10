import PythagoreanTriplesSeries.{pythagoreanTriplesIterative, pythagoreanTriplesRecursive, pythagoreanTriplesTailRecursive}
import org.scalatest.FunSuite
import org.scalatest.Matchers._
import org.scalatest.prop.TableDrivenPropertyChecks._

class PythagoreanTriplesSeriesTest extends FunSuite {
  val expectedValues =
    Table(
      ("size", "triplesSeries"),
      (0, List()),
      (1, List((3, 4, 5))),
      (2, List((3, 4, 5), (8, 6, 10))),
      (3, List((3, 4, 5), (8, 6, 10), (5, 12, 13))),
      (4, List((3, 4, 5), (8, 6, 10), (5, 12, 13), (15, 8, 17)))
    )

  test("testPythagoreanTriplesIterative") {
    forAll(expectedValues) { (size: Int, triplesSeries: List[(Int, Int, Int)]) =>
      pythagoreanTriplesIterative(size) should equal(triplesSeries)
    }
  }

  test("testPythagoreanTriplesRecursive") {
    forAll(expectedValues) { (size: Int, triplesSeries: List[(Int, Int, Int)]) =>
      pythagoreanTriplesRecursive(size) should equal(triplesSeries)
    }
  }

  test("testPythagoreanTriplesTailRecursive") {
    forAll(expectedValues) { (size: Int, triplesSeries: List[(Int, Int, Int)]) =>
      pythagoreanTriplesTailRecursive(size) should equal(triplesSeries)
    }
  }

}
