
module Runner
    using Days

    function main(args)
        println("[+] Executing Advent of Code 2016 day $(args[1])")

        # Invoke the solver for the day
        Days.main(args)
    end

    export main
end
