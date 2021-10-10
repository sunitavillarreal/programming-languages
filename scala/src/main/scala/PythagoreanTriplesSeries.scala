import scala.annotation.tailrec

object PythagoreanTriplesSeries {

  def getTriple(m: Int, n: Int) = {
    (m * m - n * n, 2 * m * n, m * m + n * n)
  }

  def pythagoreanTriplesIterative(size: Int) = {
    List.range(2, size + 2).flatMap(m => List.range(1, m)
      .map(n => getTriple(m, n))).take(size)
  }

  def pythagoreanTriplesRecursive(size: Int, m: Int = 2, n: Int = 1): List[(Int, Int, Int)] = size match {
    case _ if size == 0 => List.empty
    case _ if m > n => List(getTriple(m, n)) ::: pythagoreanTriplesRecursive(size - 1, m, n + 1)
    case _ => pythagoreanTriplesRecursive(size, m + 1)
  }

  @tailrec
  def pythagoreanTriplesTailRecursive(size: Int, m: Int = 2, n: Int = 1, triplesSeries: List[(Int, Int, Int)] = List.empty): List[(Int, Int, Int)] = size match {
    case _ if size <= triplesSeries.size => triplesSeries
    case _ if n < m => pythagoreanTriplesTailRecursive(size, m, n + 1, triplesSeries :+ getTriple(m, n))
    case _ => pythagoreanTriplesTailRecursive(size, m + 1, 1, triplesSeries)
  }
}
