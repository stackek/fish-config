function cg
    if test (count $argv) -ne 1
        echo "Usage: fish <directory>"
        return 1
    end

    cd ~/.config/$argv[1]
end
