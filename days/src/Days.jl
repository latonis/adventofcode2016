module Days

    function main(args)
        println("[+] Solver for day $(args[1])")

        if length(args) > 1
            testing = args[2] == "-t"
        else
            testing = false
        end

        current_directory = @__DIR__

        if testing
            input = read("$(current_directory)/../input/$(args[1]).test", String)
        else
            input = read("$(current_directory)/../input/$(args[1])", String)
        end

        include("$(current_directory)/$(args[1]).jl")

        # 2. Extract the function object from this module
        solve_func = getfield(Days, :solve)

        # 3. Use Base.invokelatest to run it with the newest world age
        Base.invokelatest(solve_func, input |> strip)

        println("[+] solved day$(args[1]).jl")
    end

    export main
end
