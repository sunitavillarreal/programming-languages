namespace PythagoreanSeries

module PythagoreanSeries =

    let getTriple (m: int, n: int) =
        (m * m - n * n, 2 * m * n, m * m + n * n)

    let pythagoreanTriplesIterative size =
        [ 2 .. size + 1 ]
        |> List.collect (fun m -> [ 1 .. m - 1 ] |> List.map (fun n->getTriple (m, n)))
        |> List.take size

    let pythagoreanTriplesRecursive size =
        let rec recursiveFunction size m n =
            match (size, m, n) with
            | (size, _, _) when size = 0 -> []
            | (_, m, _) when m > n ->
                [ getTriple (m, n) ]
                @ recursiveFunction (size - 1) m (n + 1)
            | _ -> recursiveFunction size (m + 1) 1

        recursiveFunction size 2 1

    let pythagoreanTriplesTailRecursive size =
        let rec tailRecursiveFunction (size: int, m: int, n: int, tripleSeries: (int * int * int) list) =
            match (size, m, n, tripleSeries) with
            | (size, _, _, _) when size <= tripleSeries.Length -> tripleSeries
            | (_, m, _, _) when m > n -> tailRecursiveFunction (size, m, (n + 1), tripleSeries @ [ getTriple (m, n) ])
            | _ -> tailRecursiveFunction (size, (m + 1), 1, tripleSeries)

        tailRecursiveFunction (size, 2, 1, [])
