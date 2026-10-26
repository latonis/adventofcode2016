mutable struct Position
    direction::String # N,S,E,W
    x::Int
    y::Int
end

function manhattan_distance(pos1, pos2)
    return abs(pos1.x - pos2.x) + abs(pos1.y - pos2.y)
end

function solve(input)
    part1(input)
    # part2(input)
end

function part1(input)
    pos = Position("N", 0, 0)

    directions = split(input, ", ")

    for entry in directions
        d = entry[1:1]
        amount = parse(Int, entry[2:end])


        # N + R means pos x
        # N + L means neg x
        # E + R means neg y
        # E + L means pos y
        # S + R means neg x
        # S + L means pos x
        # W + R means pos y
        # W + L means neg y
        println(pos)
        println(d, amount)
        if d == "R"
            if pos.direction == "N"
                pos.x += amount
                pos.direction = "E"
            elseif pos.direction == "E"
                pos.y -= amount
                pos.direction = "S"
            elseif pos.direction == "S"
                pos.x -= amount
                pos.direction = "W"
            elseif pos.direction == "W"
                pos.y += amount
                pos.direction = "N"
            else
                println("unsupported direction found!")
            end
        else
            # L
            if pos.direction == "N"
                pos.x -= amount
                pos.direction = "W"
            elseif pos.direction == "E"
                pos.y += amount
                pos.direction = "N"
            elseif pos.direction == "S"
                pos.x += amount
                pos.direction = "E"
            elseif pos.direction == "W"
                pos.y -= amount
                pos.direction = "S"
            else
                println("unsupported direction found!")
            end
        end
        print(entry)
        println(pos)
    end

    println(manhattan_distance(Position("N", 0, 0), pos))


end

function part2(input)
    input |> strip |> println
end
