module PythagoreanSeries.Tests

open NUnit.Framework
open PythagoreanSeries

type TestClass() =

    static member TestData() =
        [| (0, [])
           (1, [ (3, 4, 5) ])
           (2, [ (3, 4, 5); (8, 6, 10) ])
           (3, [ (3, 4, 5); (8, 6, 10); (5, 12, 13) ])
           (4,
            [ (3, 4, 5)
              (8, 6, 10)
              (5, 12, 13)
              (15, 8, 17) ]) |]

    [<Test>]
    [<TestCaseSource("TestData")>]
    member this.TestIterative(testData: int * (int * int * int) list) =
        let size, expected = testData
        let actual = pythagoreanTriplesIterative size

        Assert.That(actual, Is.EquivalentTo(expected))

    [<Test>]
    [<TestCaseSource("TestData")>]
    member this.TestRecursive(testData: int * (int * int * int) list) =
        let size, expected = testData
        let actual = pythagoreanTriplesRecursive size

        Assert.That(actual, Is.EquivalentTo(expected))

    [<Test>]
    [<TestCaseSource("TestData")>]
    member this.TestTailRecursive(testData: int * (int * int * int) list) =
        let size, expected = testData
        let actual = pythagoreanTriplesTailRecursive size

        Assert.That(actual, Is.EquivalentTo(expected))
