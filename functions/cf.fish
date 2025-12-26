function cf -d "Copies file into clipboard";

    for arg in $argv
        if not test -e "$arg"; or test -z "$arg"
            echo "Error: File does not exist -> $arg"
            continue
        end
        set file_path (readlink -e "$arg")
        set file_uri (string replace -r ' ' '%20' "file://$file_path")
        echo -n $file_uri | wl-copy -t text/uri-list
    end

end

